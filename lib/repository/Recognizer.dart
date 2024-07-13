import 'dart:math';
import 'dart:developer' as dev;
import 'dart:typed_data';
import 'dart:ui';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart';

import '../model/Recognition.dart';

class Recognizer {
  late Interpreter interpreter;
  late InterpreterOptions _interpreterOptions;
  static const int WIDTH = 112;
  static const int HEIGHT = 112;
  @override
  String get modelName => 'assets/mobile_face_net.tflite';
  Map<String, Recognition> registered = Map();

  Recognizer({int? numThreads}) {
    _interpreterOptions = InterpreterOptions();

    if (numThreads != null) {
      _interpreterOptions.threads = numThreads;
    }
    loadModel();
  }

  // void loadRegisteredFaces() async {
  //   final allRows = await dbHelper.queryAllRows();
  //   // print('query all rows: $allRows');
  //   for (final row in allRows) {
  //     print(row[DatabaseHelper.columnEmbedding]);
  //     //  debugPrint(row.toString());
  //     print(row[DatabaseHelper.columnName]);
  //     String name = row[DatabaseHelper.columnName];
  //     print(double.parse(0.0017627746565267444.toString()));
  //     List<double> embd = row[DatabaseHelper.columnEmbedding]
  //         .split(',')
  //         .map((e) {
  //           try {
  //             return double.parse(e.replaceAll('[', '').replaceAll(']', ''));
  //           } catch (err) {
  //             print(e);
  //             print(err);
  //           }
  //         })
  //         .toList()
  //         .cast<double>();
  //     Recognition recognition =
  //         Recognition(row[DatabaseHelper.columnName], Rect.zero, embd, 0);
  //     registered.putIfAbsent(name, () => recognition);
  //   }
  // }

  // void registerFaceInDB(String name, String embedding) async {
  //   // row to insert
  //   Map<String, dynamic> row = {
  //     DatabaseHelper.columnName: name,
  //     DatabaseHelper.columnEmbedding: embedding
  //   };
  //   final id = await dbHelper.insert(row);
  //   print('inserted row id: $id');
  // }

  Future<void> loadModel() async {
    try {
      interpreter = await Interpreter.fromAsset(modelName);
    } catch (e) {
      print('Unable to create interpreter, Caught Exception: ${e.toString()}');
    }
  }

  List<dynamic> imageToArray(img.Image inputImage) {
    img.Image resizedImage =
        img.copyResize(inputImage!, width: WIDTH, height: HEIGHT);
    List<double> flattenedList = resizedImage.data!
        .expand((channel) => [channel.r, channel.g, channel.b])
        .map((value) => value.toDouble())
        .toList();
    Float32List float32Array = Float32List.fromList(flattenedList);
    int channels = 3;
    int height = 112;
    int width = 112;
    Float32List reshapedArray = Float32List(1 * height * width * channels);
    for (int c = 0; c < channels; c++) {
      for (int h = 0; h < height; h++) {
        for (int w = 0; w < width; w++) {
          int index = c * height * width + h * width + w;
          reshapedArray[index] =
              float32Array[c * height * width + h * width + w];
        }
      }
    }
    return reshapedArray.reshape([1, 112, 112, 3]);
  }

  List<double> recog(
    img.Image image,
    Rect location,
  ) {
    //TODO crop face from image resize it and convert it to float array
    var input = imageToArray(image);
    print(input.shape.toString());

    //TODO output array
    List output = List.filled(1 * 192, 0).reshape([1, 192]);

    //TODO performs inference
    final runs = DateTime.now().millisecondsSinceEpoch;
    interpreter.run(input, output);
    final run = DateTime.now().millisecondsSinceEpoch - runs;
    print('Time to run inference: $run ms$output');

    //TODO convert dynamic list to double list
    List<double> outputArray = output.first.cast<double>();

    //TODO looks for the nearest embeeding in the database and returns the pair
    // Pair pair = findNearest(outputArray, emb);
    // print("distance= ${pair.distance}");

    // return Recognition(pair.name, location, outputArray, pair.distance);
    return outputArray;
  }

  Recognition recognize(img.Image image, Rect location, List<double> emb) {
    //TODO crop face from image resize it and convert it to float array
    var input = imageToArray(image);
    print(input.shape.toString());

    //TODO output array
    List output = List.filled(1 * 192, 0).reshape([1, 192]);

    //TODO performs inference
    final runs = DateTime.now().millisecondsSinceEpoch;
    interpreter.run(input, output);
    final run = DateTime.now().millisecondsSinceEpoch - runs;
    print('Time to run inference: $run ms$output');

    //TODO convert dynamic list to double list
    List<double> outputArray = output.first.cast<double>();

    //TODO looks for the nearest embeeding in the database and returns the pair
    Pair pair = findNearest(outputArray, emb);

    print("distance= ${pair.distance}");

    return Recognition(pair.name, location, outputArray, pair.distance);
  }

  bool areMatching(List<double> emb1, List<double> emb2, double threshold) {
    if (emb1.length != emb2.length) {
      throw ArgumentError("Panjang embeddings harus sama.");
    }

    print(emb1);
    print(emb2);

    double distance = 0;
    for (int i = 0; i < emb1.length; i++) {
      double diff = emb1[i] - emb2[i];
      distance += diff * diff;
    }
    distance = sqrt(distance);
    print(distance);

    return distance < threshold;
  }

  //TODO  looks for the nearest embeeding in the database and returns the pair which contain information of registered face with which face is most similar
  findNearest(List<double> emb1, List<double> emb2) {
    Pair pair = Pair("Unknown", -5);
    // for (MapEntry<String, Recognition> item in registered.entries) {
    double minDist = 999;
    double currDist = 0.0;
    pair.name = "Tidak dikenali";
    // for (String label in data.keys) {
    currDist = euclideanDistance(emb1, emb2);
    if (currDist <= 1.0 && currDist < minDist) {
      minDist = currDist;
      // _predRes = "label";
      pair.name = "dikenali";
      pair.distance = minDist;
      // if (_verify == false) {
      //   _verify = true;
      // }
    }

    return pair;

    // }
  }
}

double euclideanDistance(List e1, List e2) {
  double sum = 0.0;
  for (int i = 0; i < e1.length; i++) {
    sum += pow((e1[i] - e2[i]), 2);
  }
  return sqrt(sum);
}

class Pair {
  String name;
  double distance;
  Pair(this.name, this.distance);
}
import 'package:dapenda/app/constant.dart';
import 'package:dapenda/app/routes.dart';
import 'package:dapenda/cubit/image_cubit/current_image_cubit.dart';
import 'package:dapenda/widgets/box_gap.dart';
import 'package:dapenda/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liveness_detection_flutter_plugin/index.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart'
    // ignore: library_prefixes
    as faceD;

import 'package:image/image.dart' as img;

import '../../model/Recognition.dart';
import '../../repository/Recognizer.dart';

class RecognationScreen extends StatefulWidget {
  const RecognationScreen({super.key});

  @override
  State<RecognationScreen> createState() => _RecognationScreenState();
}

class _RecognationScreenState extends State<RecognationScreen> {
  File? _image;
  String? imgPath;
  var image;
  List<faceD.Face> faces = [];

  late faceD.FaceDetector faceDetector;
  late Recognizer recognizer;
  late Recognition recognition1;
  late Recognition recognition2;

  List<LivenessDetectionStepItem> stepLiveness = [
    LivenessDetectionStepItem(
      step: LivenessDetectionStep.smile,
      title: "senyum",
      isCompleted: false,
    ),
    LivenessDetectionStepItem(
      step: LivenessDetectionStep.blink,
      title: "kedip",
      isCompleted: false,
    ),
  ];

  Future<bool> liveness() async {
    final String? response =
        await LivenessDetectionFlutterPlugin.instance.livenessDetection(
      context,
      config: LivenessConfig(
        steps: stepLiveness,
        startWithInfoScreen: false,
      ),
    );
    setState(() {
      imgPath = response;
      _image = File(imgPath!);
    });
    List<double> dataFace = await doFaceDetection();
    Future.delayed(Duration(seconds: 2)).then((value) {
      Navigator.pushReplacementNamed(context, cameraRoute, arguments: dataFace);
    });
    return true;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final options = faceD.FaceDetectorOptions(
        performanceMode: faceD.FaceDetectorMode.accurate);
    faceDetector = faceD.FaceDetector(options: options);
    recognizer = Recognizer();

    Future(() {
      liveness().then((value) async {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: imgPath == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : const SizedBox.shrink(),
    );
  }

  Future<List<double>> doFaceDetection() async {
    //TODO remove rotation of camera images

    InputImage inputImage = InputImage.fromFile(_image!);

    // image = await _image?.readAsBytes();
    image = await decodeImageFromList(_image!.readAsBytesSync());
    //TODO passing input to face detector and getting detected faces
    faces = await faceDetector.processImage(inputImage);

    // for (Face face in faces) {
    final Rect boundingBox = faces[0].boundingBox;

    print("Rect " + boundingBox.toString());

    num left = boundingBox.left < 0 ? 0 : boundingBox.left;
    num top = boundingBox.top < 0 ? 0 : boundingBox.top;
    num right =
        boundingBox.right > image.width ? image.width - 1 : boundingBox.right;
    num bottom = boundingBox.bottom > image.height
        ? image.height - 1
        : boundingBox.bottom;
    num width = right - left;
    num height = bottom - top;

    final bytes = _image!.readAsBytesSync();
    img.Image? faceImg = img.decodeImage(bytes);
    img.Image? croppedFace = img.copyCrop(faceImg!,
        x: left.toInt(),
        y: top.toInt(),
        width: width.toInt(),
        height: height.toInt());

    List<double> recog = recognizer.recog(
      croppedFace,
      boundingBox,
    );

    return recog;
    // showFaceRegistrationDialogue(
    //     Uint8List.fromList(img.encodeBmp(croppedFace)), recognition);
    // }

    // drawRectangleAroundFaces();

    //TODO call the method to perform face recognition on detected faces
  }
}
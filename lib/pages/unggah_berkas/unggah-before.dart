import 'dart:io';

import 'package:dapenda/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../themes/themes.dart';
import '../../widgets/text-rapi.dart';

class UnggahBefore extends StatefulWidget {
  final Map data;

  const UnggahBefore({super.key, required this.data});
  @override
  _UnggahBeforeState createState() => _UnggahBeforeState();
}

class _UnggahBeforeState extends State<UnggahBefore> {
  File? gambar1;
  File? gambar2;
  bool _loading = false;

  Future getImage1() async {
    // ignore: deprecated_member_use, invalid_use_of_visible_for_testing_member
    var image = await ImagePicker.platform.pickImage(
      source: ImageSource.camera,
      imageQuality: 100, // <- Reduce Image quality
      maxHeight: 2048, // <- reduce the image size
      maxWidth: 2048,
    );

    setState(() {
      // gambar1 = image;
    });
  }

  Future getImage2() async {
    // ignore: deprecated_member_use, invalid_use_of_visible_for_testing_member
    var image = await ImagePicker.platform.pickImage(
      source: ImageSource.camera,
      imageQuality: 100, // <- Reduce Image quality
      maxHeight: 2048, // <- reduce the image size
      maxWidth: 2048,
    );

    setState(() {
      // gambar2 = image;;
    });
  }

  var data = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        title: Text(
          'Kembali',
          style: robotoM.copyWith(fontSize: 20, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'BERKAS DATA ULANG',
                  style: tahomaB.copyWith(
                    color: Color(0XFF9AD25C),
                    fontSize: 26,
                  ),
                ),
              ),
              SizedBox(height: 32),
              Text(
                'Saya : ',
                style: tahomaB.copyWith(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 11),
              TextRapi(
                data: 'Nama Penerima MP',
                value: data['penerima'] != null ? data['penerima'] : '',
              ),
              TextRapi(
                data: 'Nomor e-DU',
                value: data['edu'] != null ? data['edu'] : '',
              ),
              TextRapi(
                data: 'Nomor Pensiunan',
                value: data['nip'] != null ? data['nip'] : '',
              ),
              TextRapi(
                data: 'Jenis Pensiun',
                value: data['jenispen'] != null ? data['jenispen'] : '',
              ),
              SizedBox(height: 32),
              Text(
                data['label_1'] != null
                    ? 'Unggah Berkas ' + data['label_1']
                    : '',
                style: tahomaR.copyWith(
                  color: Color(0XFF757575),
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 8),
              Align(
                  alignment: Alignment.center,
                  child: gambar1 != null
                      ? Text("gambar1.path.split('/').last")
                      : SizedBox()),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 40,
                  child: CustomButton(
                    onPressed: () => getImage1(),
                    text: "Ambil FOTO",
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text(
                data['label_2'] != null
                    ? 'Unggah Berkas ' + data['label_2']
                    : '',
                style: tahomaR.copyWith(
                  color: Color(0XFF757575),
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 8),
              Align(
                  alignment: Alignment.center,
                  child: gambar2 != null
                      ? Text("gambar2.path.split('/').last")
                      : SizedBox()),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 40,
                  child: CustomButton(
                    onPressed: () => getImage2(),
                    text: 'Ambil FOTO',
                  ),
                ),
              ),
              SizedBox(height: 32),
              Text(
                'Demikian pernyataan ini saya buat\ndengan sebenarnya, harap dapat dimaklumi.',
                style: tahomaB.copyWith(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: _loading == false
                    ? Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        height: 40,
                        child: CustomButton(
                          onPressed: () async {
                            // if (gambar1 == null || gambar2 == null) {
                            //   print('harus diisi');
                            // } else {
                            //   setState(() {
                            //     _loading = true;
                            //   });
                            //   final result =
                            //       await Provider.of<DatabaseServices>(context,
                            //               listen: false)
                            //           .sendBerkas(
                            //               edu: data['edu'],
                            //               file1: gambar1,
                            //               file2: gambar2);
                            //   if (result['status'] == true) {
                            //     setState(() {
                            //       _loading = false;
                            //     });
                            //     Navigator.pushReplacementNamed(
                            //       context,
                            //       '/unggahafter',
                            //       arguments: {
                            //         'edu': data['edu'],
                            //         'name': data['name'],
                            //         'penerima': data['penerima'],
                            //         'nopen': data['nip'],
                            //         'jnspen': data['jenispen'],
                            //       },
                            //     );
                            //   } else {
                            //     setState(() {
                            //       _loading = false;
                            //     });
                            //     _buildShowDialog(context);
                            //   }
                            // }
                          },
                          text: "SIMPAN",
                        ))
                    : CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_buildShowDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      ),
      content: Text(
        'Ada kesalahan saat mengirim berkas.',
        style: tahomaR.copyWith(
          fontSize: 18,
          color: Colors.black,
        ),
      ),
      actions: <Widget>[
        Container(
          width: 70,
          margin: EdgeInsets.only(right: 8, bottom: 4),
          child: CustomButton(
            onPressed: () {
              Navigator.pop(context);
            },
            text: "Oke",
          ),
        )
      ],
    ),
  );
}
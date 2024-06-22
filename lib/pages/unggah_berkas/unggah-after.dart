import 'package:dapenda/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../themes/themes.dart';
import '../../widgets/text-rapi.dart';

class UnggahAfter extends StatefulWidget {
  @override
  _UnggahAfterState createState() => _UnggahAfterState();
}

class _UnggahAfterState extends State<UnggahAfter> {
  var data = {};

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size.height;
    data = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: blue,
        title: Text(
          'Kembali',
          style: robotoM.copyWith(fontSize: 20, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 16, top: 40, right: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/success.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    'Unggah Berhasil',
                    style: tahomaB.copyWith(
                      fontSize: 20,
                      color: Color(0XFF9AD25C),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: mediaQuery * 0.02,
              ),
              Text(
                'Terima Kasih Bapak / Ibu\nTelah mengunggah Berkas Data Ulang',
                textAlign: TextAlign.center,
                style: tahomaB.copyWith(
                  fontSize: 18,
                  color: Color(0XFF9AD25C),
                ),
              ),
              SizedBox(
                height: mediaQuery * 0.08,
              ),
              TextRapi(
                data: 'Nomor e-DU',
                value: data['edu'],
              ),
              TextRapi(
                data: 'Nama Pensiunan',
                value: data['name'],
              ),
              TextRapi(
                data: 'Penerima MP',
                value: data['penerima'],
              ),
              TextRapi(
                data: 'Nomor Pensiunan',
                value: data['nopen'],
              ),
              TextRapi(
                data: 'Jenis Pensiun',
                value: data['jnspen'],
              ),
              SizedBox(
                height: mediaQuery * 0.08,
              ),
              Text(
                'Verifikasi akan memakan waktu 1x24 jam\n\nSilakan Cek kembali besok',
                textAlign: TextAlign.center,
                style: tahomaB.copyWith(
                  fontSize: 16,
                  color: Color(0XFFFC8276),
                ),
              ),
              SizedBox(
                height: mediaQuery * 0.08,
              ),
              Container(
                  width: 100,
                  height: 40,
                  child: CustomButton(
                      text: "Tutup",
                      onPressed: () {
                        Navigator.pop(context);
                      }))
            ],
          ),
        ),
      ),
    );
  }
}

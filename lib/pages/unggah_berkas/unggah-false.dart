import 'package:flutter/material.dart';

import '../../themes/themes.dart';
import '../../widgets/box_gap.dart';
import '../../widgets/text-rapi.dart';

class UnggahFalse extends StatefulWidget {
  final Map data;

  const UnggahFalse({super.key, required this.data});
  @override
  _UnggahFalseState createState() => _UnggahFalseState();
}

class _UnggahFalseState extends State<UnggahFalse> {
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
          margin: EdgeInsets.only(left: 16, top: 40, right: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/failed.png'),
                      ),
                    ),
                  ),
                  const BoxGap(
                    width: 16,
                  ),
                  Text(
                    'Validasi Berkas Gagal',
                    style: tahomaB.copyWith(
                      fontSize: 24,
                      color: Color(0XFFFC8276),
                    ),
                  ),
                ],
              ),
              const BoxGap(height: 32),
              Text(
                'Alasan Gagal : ',
                style: tahomaB.copyWith(
                  color: Color(0XFFFC8276),
                  fontSize: 18,
                ),
              ),
              const BoxGap(height: 8),
              Text(
                data['alasan'] != null
                    ? data['alasan']
                    : 'Belum diverifikasi, mohon untuk menunggu.',
                style: tahomaR.copyWith(
                  color: Color(0XFF757575),
                  fontSize: 14,
                ),
              ),
              const BoxGap(height: 32),
              TextRapi(
                data: 'Nama Penerima Pensiun',
                value: data['name'] != null ? data['name'] : '',
              ),
              TextRapi(
                data: 'Nomor eDU',
                value: data['edu'] != null ? data['edu'] : '',
              ),
              TextRapi(
                data: 'Nomor Pensiunan / NIP',
                value: data['nip'] != null ? data['nip'] : '',
              ),
              TextRapi(
                data: 'Jenis Pensiun',
                value: data['jenispen'] != null ? data['jenispen'] : '',
              ),
              const BoxGap(height: 32),
              Text(
                data['label1'] != null ? data['label1'] : '',
                style: tahomaR.copyWith(
                  color: Color(0XFF757575),
                  fontSize: 14,
                ),
              ),
              const BoxGap(height: 16),
              Container(
                width: double.infinity,
                height: 160,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(data['file_1']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const BoxGap(height: 16),
              Text(
                data['label2'] != null ? data['label2'] : '',
                style: tahomaR.copyWith(
                  color: Color(0XFF757575),
                  fontSize: 14,
                ),
              ),
              const BoxGap(height: 16),
              Container(
                width: double.infinity,
                height: 160,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(data['file_2']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const BoxGap(height: 32),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 40,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/unggah');
                    },
                    child: Text(
                      'ULANGI',
                      style: robotoM.copyWith(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    color: green,
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

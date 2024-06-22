import 'package:eDapenda/shared/constant.dart';
import 'package:eDapenda/widgets/text-rapi.dart';
import 'package:flutter/material.dart';

class UnggahTrue extends StatefulWidget {
  @override
  _UnggahTrueState createState() => _UnggahTrueState();
}

class _UnggahTrueState extends State<UnggahTrue> {
  var data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
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
                        image: AssetImage('assets/success.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    'Validasi Berkas Berhasil',
                    style: tahomaB.copyWith(
                      fontSize: 20,
                      color: Color(0XFF9AD25C),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 48),
              TextRapi(
                data: 'Penerima MP',
                value: data['name'] != null ? data['name'] : '',
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
                data['label1'] != null ? data['label1'] : '',
                style: tahomaR.copyWith(
                  color: Color(0XFF757575),
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 16),
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(data['file_1']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                data['label2'] != null ? data['label2'] : '',
                style: tahomaR.copyWith(
                  color: Color(0XFF757575),
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 16),
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(data['file_2']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    height: 40,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'OKE',
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    height: 40,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/unggah');
                      },
                      child: Text(
                        'UPDATE BERKAS',
                        style: robotoM.copyWith(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      color: blue,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

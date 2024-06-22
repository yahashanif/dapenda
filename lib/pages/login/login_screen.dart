import 'package:dapenda/app/constant.dart';
import 'package:dapenda/app/routes.dart';
import 'package:dapenda/widgets/box_gap.dart';
import 'package:dapenda/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../themes/themes.dart';

final _formKey = GlobalKey<FormState>();

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var maskFormatter = new MaskTextInputFormatter(
        mask: '####-####-####', filter: {"#": RegExp(r'[0-9]')});

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bglogin.png'),
                  fit: BoxFit.cover),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.2,
                      bottom: getActualY(y: 8, context: context)),
                  child: Container(
                    margin: EdgeInsets.only(
                        left: getActualX(x: 16, context: context),
                        top: getActualY(y: 8, context: context),
                        right: getActualX(x: 16, context: context),
                        bottom: getActualY(y: 8, context: context)),
                    padding: EdgeInsets.only(
                        left: getActualX(x: 16, context: context),
                        top: getActualY(y: 24, context: context),
                        right: getActualX(x: 16, context: context),
                        bottom: getActualY(y: 24, context: context)),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          offset: const Offset(0.4, 0.8),
                          blurRadius: 4.0,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Selamat Datang',
                          style: tahomaB.copyWith(
                            fontSize: getActualY(y: 20, context: context),
                            color: Colors.black,
                          ),
                        ),
                        const BoxGap(
                          height: 24,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TextFormField(
                                inputFormatters: [maskFormatter],
                                // onSaved: (val) =>
                                //     _edu = val.replaceAll(new RegExp(r'-'), ''),
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  suffixIcon: Icon(Icons.person_outline),
                                  labelText: 'Nomor e-DU',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              const BoxGap(
                                height: 4,
                              ),
                              Text(
                                'Masukkan Nomor e-DU Anda',
                                style: tahomaR.copyWith(
                                  fontSize: getActualY(y: 12, context: context),
                                  color: Color(0XFF707070),
                                ),
                              ),
                              const BoxGap(
                                height: 24,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                      width:
                                          getActualX(x: 100, context: context),
                                      height:
                                          getActualY(y: 40, context: context),
                                      child: CustomButton(
                                          text: "Masuk",
                                          onPressed: () {
                                            Navigator.pushNamedAndRemoveUntil(
                                                context,
                                                homeRoute,
                                                (route) => false);
                                          })

                                      //  ElevatedButton(
                                      //   onPressed: () async {
                                      //     // final form = _formKey.currentState;
                                      //     // form.save();
                                      //     // if (form.validate()) {
                                      //     //   await Provider.of<AuthServices>(
                                      //     //           context,
                                      //     //           listen: false)
                                      //     //       .login(edu: _edu)
                                      //     //       .whenComplete(
                                      //     //     () {
                                      //     //       if (Provider.of<AuthServices>(
                                      //     //               context,
                                      //     //               listen: false)
                                      //     //           .status) {
                                      //     //         Navigator.pushReplacementNamed(
                                      //     //             context, '/wrapper');
                                      //     //       } else {
                                      //     //         _buildShowDiaolog(context);
                                      //     //       }
                                      //     //     },
                                      //     //   );
                                      //     // }
                                      //   },
                                      //   child: Text(
                                      //     'Masuk',
                                      //     style: robotoM.copyWith(
                                      //       fontSize: 16,
                                      //       color: Colors.white,
                                      //     ),
                                      //   ),
                                      // color: green,
                                      // shape: OutlineInputBorder(
                                      //   borderRadius: BorderRadius.circular(8),
                                      //   borderSide: BorderSide(
                                      //       color: Colors.transparent),
                                      // ),
                                      // ),
                                      ),
                                ],
                              ),
                              const BoxGap(
                                height: 16,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin: EdgeInsets.only(
                        right: getActualX(x: 16, context: context)),
                    child: Text(
                      'versi 1.2',
                      style: tahomaR.copyWith(
                        fontSize: getActualY(y: 12, context: context),
                        color: const Color(0XFF707070),
                      ),
                    ),
                  ),
                ),
                const BoxGap(
                  height: 16,
                ),
                Text(
                  'Butuh Bantuan ?',
                  style: tahomaB.copyWith(
                    fontSize: getActualY(y: 18, context: context),
                    color: const Color(0XFF28166F),
                  ),
                ),
                const BoxGap(
                  height: 48,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: EdgeInsets.only(
                  left: getActualX(x: 16, context: context),
                  bottom: getActualY(y: 8, context: context)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => launch("tel://021 5505399"),
                    child: Container(
                      width: getActualX(x: 48, context: context),
                      height: getActualY(y: 48, context: context),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/icons8-phone-96.png'),
                        ),
                      ),
                    ),
                  ),
                  const BoxGap(
                    height: 4,
                  ),
                  Text(
                    'Telp : 021 5505399',
                    textAlign: TextAlign.center,
                    style: robotoM.copyWith(
                      fontSize: getActualY(y: 14, context: context),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.only(
                  right: getActualX(x: 16, context: context),
                  bottom: getActualY(y: 8, context: context)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => _launchUrl(),
                    child: Container(
                      width: getActualX(x: 48, context: context),
                      height: getActualY(y: 48, context: context),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/icons8-whatsapp-96.png'),
                        ),
                      ),
                    ),
                  ),
                  const BoxGap(
                    height: 4,
                  ),
                  Text(
                    'WA : 08111162801',
                    textAlign: TextAlign.center,
                    style: robotoM.copyWith(
                      fontSize: getActualY(y: 14, context: context),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

_launchUrl() async {
  const url = 'https://api.whatsapp.com/send?phone=628111162801&text=Halo';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_buildShowDiaolog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
      ),
      content: Text(
        'Maaf, Nomor e-Du Anda Salah.\nSilahkan Ulangi.',
        style: tahomaR.copyWith(
          fontSize: getActualY(y: 18, context: context),
          color: Colors.black,
        ),
      ),
      actions: <Widget>[
        Container(
          width: 70,
          margin: EdgeInsets.only(
              right: getActualX(x: 8, context: context),
              bottom: getActualY(y: 4, context: context)),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Oke',
              style: robotoM.copyWith(
                  fontSize: getActualY(y: 16, context: context),
                  color: Colors.white),
            ),
            // color: green,
            // shape: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(4),
            //   borderSide: BorderSide(
            //     color: Colors.transparent,
            //   ),
            // ),
          ),
        )
      ],
    ),
  );
}

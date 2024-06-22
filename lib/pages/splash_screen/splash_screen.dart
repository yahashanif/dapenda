import 'package:flutter/material.dart';

import '../../app/constant.dart';
import '../../app/routes.dart';
import '../../themes/themes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, onBoardingRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg.png'), fit: BoxFit.cover),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            margin: EdgeInsets.only(
                left: getActualX(x: 16, context: context),
                right: getActualX(x: 16, context: context)),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                      top: getActualY(y: 150, context: context),
                      bottom: getActualY(y: 24, context: context)),
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    width: getActualX(x: 130, context: context),
                    height: getActualY(y: 130, context: context),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/dapenda.png'),
                      ),
                    ),
                  ),
                ),
                Text(
                  'e-DAPENDA',
                  style: tahomaB.copyWith(
                    fontSize: getActualY(y: 24, context: context),
                    color: const Color(0XFF707070),
                  ),
                ),
                Text(
                  'Dana Pensiun Angkasa Pura II',
                  style: tahomaB.copyWith(
                    fontSize: getActualY(y: 20, context: context),
                    color: const Color(0XFF707070),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
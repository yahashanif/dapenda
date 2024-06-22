import 'package:flutter/material.dart';

import '../../app/constant.dart';
import '../../themes/themes.dart';
import '../../widgets/box_gap.dart';

class DetailProfil extends StatelessWidget {
  const DetailProfil({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: getActualY(y: 8, context: context)),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            offset: const Offset(0.4, 0.8),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Selamat Pagi,',
                style: tahomaR.copyWith(
                  fontSize: getActualY(y: 24, context: context),
                ),
              ),
              const BoxGap(
                height: 8,
              ),
              Text(
                "Hanif",
                style: tahomaB.copyWith(
                  fontSize: getActualY(y: 24, context: context),
                  color: const Color(0XFF757575),
                ),
              ),
              const BoxGap(
                height: 5,
              ),
              Text(
                "193301288080",
                style: tahomaR.copyWith(
                  fontSize: getActualY(y: 14, context: context),
                  color: const Color(0XFF757575),
                ),
              ),
              const BoxGap(
                height: 5,
              ),
              Text(
                "MP Dibayarkan Sekarang",
                style: tahomaR.copyWith(
                  fontSize: getActualY(y: 14, context: context),
                  color: Color(0XFF757575),
                ),
              )
            ],
          ),
          Container(
            width: getActualX(x: 80, context: context),
            height: getActualY(y: 80, context: context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              image: const DecorationImage(
                image: NetworkImage(
                    "https://www.missnumerique.com/blog/wp-content/uploads/reussir-sa-photo-de-profil-michael-dam.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
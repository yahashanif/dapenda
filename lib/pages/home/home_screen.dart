import 'package:dapenda/app/routes.dart';
import 'package:dapenda/widgets/base_appbar.dart';
import 'package:dapenda/widgets/box_gap.dart';
import 'package:flutter/material.dart';

import '../../app/constant.dart';
import '../../themes/themes.dart';
import '../../widgets/menu.dart';
import 'carousel_slider_berita.dart';
import 'detail_profil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController controller = PageController(initialPage: 0);
  int currentPageValue = 0;

  // final GlobalKey<RefreshIndicatorState> _key =
  //     GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    Widget indicator(bool isActive, page) {
      return GestureDetector(
        onTap: () {
          controller.animateToPage(page,
              duration: const Duration(seconds: 1), curve: Curves.easeOut);
        },
        child: SizedBox(
          height: getActualY(y: 10, context: context),
          child: Container(
            // margin: EdgeInsets.symmetric(horizontal: 4.0),
            height: isActive
                ? getActualY(y: 18, context: context)
                : getActualY(y: 16, context: context),
            width: isActive
                ? getActualX(x: 20, context: context)
                : getActualX(x: 16, context: context),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? blue : const Color(0XFFEAEAEA),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppbar(
        title: "E-DAPENDA",
        centerTitle: false,
        backgroundColor: blue,
        actionWidget: [
          TextButton(
              onPressed: () {},
              child: Text(
                "Keluar",
                style: robotoM.copyWith(
                    fontSize: getActualY(y: 20, context: context),
                    color: Colors.white),
              ))
        ],
      ),
      body: RefreshIndicator(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: getActualX(x: 10, context: context),
                  vertical: getActualY(y: 16, context: context)),
              child: Column(
                children: [
                  CarouselSliderBerita(
                    controller: controller,
                    onSlide: (page) {
                      setState(() {
                        currentPageValue = page;
                      });
                    },
                  ),
                  const BoxGap(height: 8),
                  Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (var i = 0; i < 3; i++)
                            if (i == currentPageValue) ...[
                              indicator(true, i)
                            ] else
                              indicator(false, i),
                        ],
                      ),
                    ],
                  ),
                  const BoxGap(height: 16),
                  const DetailProfil(),
                  Menu(
                    func: () {
                      // statusFotoAwal == false
                      //     ? Navigator.pushReplacementNamed(
                      //         context,
                      //         '/pendataanbaru',
                      //       )
                      //     : statusFoto == '1' && _statusFotoAwal == 'false'
                      //         ? _buildShowDialogPushNamed(
                      //             context,
                      //             'Foto tidak sesuai, ulangi Pendataan Foto',
                      //             '/pendataanbaru',
                      //           )
                      //         : _buildShowDialog(
                      //             context,
                      //             'Terimakasih Anda sudah melakukan Pendataan Foto.',
                      //             Pendataan(),
                      //           );
                    },
                    title: 'Pendataan Foto',
                    subtitle: 'Anda belum melakukan\npendataan foto terbaru!',
                    image: 'pendataan',
                  ),
                  Menu(
                    func: () {
                      // _statusFotoAwal == 'false'
                      //     ? _buildShowDialogOtentikasi(context)
                      //     : Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (context) => Otentikasi(),
                      //         ),
                      //       );
                    },
                    title: 'Otentikasi',
                    subtitle: 'Silakan Lakukan Otentikasi\ndisini.',
                    image: 'otentikasi',
                  ),
                  Menu(
                    func: () {
                      Navigator.pushNamed(context, dataUlangRoute);
                    },
                    title: 'Data Ulang',
                    subtitle: 'Jika ada perubahan, Silakan\nlakukan disini.',
                    image: 'data',
                  ),
                  Menu(
                    func: () {
                      // if (_statusBerkas) {
                      //   _buildShowDialog(
                      //     context,
                      //     'Terimakasih Anda sudah melakukan Unggah Berkas.',
                      //     UnggahWrapper(),
                      //   );
                      // } else {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => Unggah(),
                      //     ),
                      //   );
                      // }
                    },
                    title: 'Unggah Berkas\nData Ulang',
                    subtitle:
                        'Unggah berkas kelengkapan\ndata ulang Anda disini.',
                    image: 'data',
                  ),
                  Menu(
                    func: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => Bantuan()));
                    },
                    title: 'Bantuan',
                    subtitle: 'Pusat Bantuan.',
                    image: 'bantuan',
                  ),
                  const BoxGap(height: 8),
                  Text('copyright © e-DAPENDA 2020 - versi 1.2',
                      style: robotoM.copyWith(color: Colors.grey))
                ],
              ),
            ),
          ),
          onRefresh: () async {}),
    );
  }
}

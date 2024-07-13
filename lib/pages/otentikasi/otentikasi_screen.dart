import 'dart:io';

import 'package:dapenda/widgets/base_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:liveness_detection_flutter_plugin/index.dart';

import '../../app/constant.dart';
import '../../app/routes.dart';
import '../../cubit/image_cubit/current_image_cubit.dart';
import '../../cubit/pendataan_foto_cubit/pendataan_foto_cubit.dart';
import '../../cubit/value_pendataan_foto_cubit/value_pendataan_foto_cubit.dart';
import '../../themes/themes.dart';
import '../../widgets/box_gap.dart';
import '../../widgets/custom_button.dart';

class OtentikasiScreen extends StatefulWidget {
  const OtentikasiScreen({super.key});

  @override
  State<OtentikasiScreen> createState() => _OtentikasiScreenState();
}

class _OtentikasiScreenState extends State<OtentikasiScreen> {
  File? dataFoto;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CurrentImageCubit>().setXFile(null);
  }

  @override
  Widget build(BuildContext context) {
    Box tokenBox = Hive.box('token');
    return Scaffold(
      appBar: BaseAppbar(
        title: "Kembali",
        backgroundColor: blue,
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BoxGap(
            height: defaultMargin,
          ),
          Text(
            'Silakan Ambil Foto Selfie',
            style: tahomaB.copyWith(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          const BoxGap(
            height: 32,
          ),
          GestureDetector(
            onTap: () async {
              Navigator.pushNamed(context, recognationRoute);
              // Navigator.pushNamed(context, pendataanCameraRoute);
            },
            /** 
             * 
             * Blok untuk data foto
             * cek ada tidak fotonya diambil
            */
            child: BlocBuilder<CurrentImageCubit, XFile?>(
              builder: (context, state) {
                if (state != null) {
                  dataFoto = File(state.path);
                  return Container(
                    width: double.infinity,
                    height: 380,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(File(state.path)),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                } else {
                  return Container(
                    width: double.infinity,
                    height: 380,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.5),
                    ),
                    child: Center(
                      child: Text(
                        'Ketuk disini untuk ambil foto',
                        textAlign: TextAlign.center,
                        style: tahomaR.copyWith(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          const BoxGap(
            height: 24,
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: getActualX(x: 8, context: context)),
            child: Row(
              children: [
                Expanded(
                    child: CustomButton(
                  buttonColor: blue,
                  borderColor: blue,
                  text: "FOTO",
                  onPressed: () {
                    Navigator.pushNamed(context, pendataanCameraRoute);
                  },
                )),
                const BoxGap(
                  width: 8,
                ),
                Expanded(
                    child: BlocConsumer<PendataanFotoCubit, PendataanFotoState>(
                  listener: (context, state) {
                    if (state is PendataanFotoFailed) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.error),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return CustomButton(
                      isLoading: state is PendataanFotoLoading,
                      text: "SIMPAN",
                      onPressed: () {
                        List<double> dataMatriks =
                            context.read<ValuePendataanFotoCubit>().state ?? [];
                        if (dataMatriks.isEmpty || dataFoto == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Data tidak boleh kosong'),
                            ),
                          );
                        } else {
                          context.read<PendataanFotoCubit>().pendataanFotoPost(
                              token: tokenBox.get('token'),
                              matriks: dataMatriks,
                              File: dataFoto!);
                        }
                      },
                    );
                  },
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

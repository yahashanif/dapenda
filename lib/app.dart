import 'package:dapenda/app/routes.dart';
import 'package:dapenda/cubit/auth_cubit/auth_cubit.dart';
import 'package:dapenda/cubit/berkas_cubit/berkas_cubit.dart';
import 'package:dapenda/cubit/berkas_cubit/berkas_ulang_cubit.dart';
import 'package:dapenda/cubit/data_peserta_cubit/data_peserta_cubit.dart';
import 'package:dapenda/cubit/faq_cubit/faq_cubit.dart';
import 'package:dapenda/cubit/value_pendataan_foto_cubit/value_pendataan_foto_cubit.dart';
import 'package:dapenda/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/image_cubit/current_image_cubit.dart';
import 'cubit/pendataan_foto_cubit/pendataan_foto_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CurrentImageCubit()),
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => DataPesertaCubit()),
        BlocProvider(create: (_) => BerkasCubit()),
        BlocProvider(create: (_) => BerkasUlangCubit()),
        BlocProvider(create: (_) => ValuePendataanFotoCubit()),
        BlocProvider(create: (_) => PendataanFotoCubit()),
        BlocProvider(create: (_) => FaqCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: green,
            // primaryColor,
            // ···
            brightness: Brightness.light,
          ),
        ),
        initialRoute: splashRoute,
        onGenerateRoute: AppRoute().generateRoute,
      ),
    );
  }
}

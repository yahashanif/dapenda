import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/pendataan_foto_repository.dart';

part 'pendataan_foto_state.dart';

class PendataanFotoCubit extends Cubit<PendataanFotoState> {
  PendataanFotoCubit() : super(PendataanFotoInitial());

  void pendataanFotoPost(
      {required String token,
      required List<double> matriks,
      required File File}) async {
    try {
      emit(PendataanFotoLoading());
      await PendataanFotoRepository()
          .pendataanFotoPost(token: token, matriks: matriks, File: File);
      emit(PendataanFotoPosted());
    } catch (e) {
      emit(PendataanFotoFailed(error: e.toString()));
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/berkas.dart';
import '../../repository/berkas_repository.dart';

part 'berkas_state.dart';

class BerkasCubit extends Cubit<BerkasState> {
  BerkasCubit() : super(BerkasInitial());

  void getBerkas({required String token}) async {
    try {
      emit(BerkasLoading());
      final berkas = await BerkasRepository().getBerkas(token: token);
      emit(BerkasLoaded(berkas: berkas));
    } catch (e) {
      emit(BerkasFailed(error: e.toString()));
    }
  }
}

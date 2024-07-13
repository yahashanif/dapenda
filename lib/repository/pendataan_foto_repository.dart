import 'dart:io';

import 'base_repository.dart';

class PendataanFotoRepository extends BaseRepository {
  Future<bool> pendataanFotoPost(
      {required String token,
      required List<double> matriks,
      required File File}) async {
    final body = {'matriks': matriks, 'file': File};
    final response =
        await post(token: token, service: 'd_peserta_foto/add', body: body);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to load data');
    }
  }
}

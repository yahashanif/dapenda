import 'dart:convert';

import 'package:http/http.dart' as http;

import '../app/url.dart';

class BaseRepository {
  Future<http.Response> post({
    Map<String, dynamic>? body,
    Map<String, dynamic>? param,
    required String service,
    String? token,
  }) async {
    try {
      // log("baseUrl");
      // log(service);
      // log(jsonEncode(body));
      // log(body.toString());
      // Log(body);
      final url = param != null
          ? Uri.https(baseUrl, service, param)
          : Uri.https(baseUrl, service);
      // print(createHeader(token: token!, url: service, method: "POST"));
      // print(createHeaderWithoutToken(url: service, method: 'POST'));
      // print(url);
      final response = await http.post(url,
          body: body != null ? jsonEncode(body) : null,
          headers: token != null
              ? createHeader(
                  token: token,
                )
              : createHeaderWithoutToken());
      return response;
    } catch (e) {
      // Log(e);
      throw Exception(e.toString());
    }
  }

  Future<http.Response> get({
    bool isParse = false,
    Map<String, dynamic>? param,
    required String service,
    String? token,
  }) async {
    try {
      // Log("service");
      // print(service);
      // Log(Uri.https(baseUrl, service, param));
      final url = param != null
          ? Uri.https(baseUrl, service, param)
          : Uri.https(baseUrl, service);
      // Log(url);
      final response = await http.get(isParse ? Uri.parse(service) : url,
          headers: token != null
              ? createHeader(
                  token: token,
                )
              : createHeaderWithoutToken());

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<http.Response> put({
    Map<String, dynamic>? body,
    required String service,
    String? token,
  }) async {
    try {
      final url = Uri.https(baseUrl, service, {'_method': 'PUT'});

      //  Uri url = Uri.https(
      //     baseUrl, '$apiVersion/invoices/$invoiceId', {'_method': 'PUT'});
      // Log(url);
      // Map<String, String> headers = createHeader(user.token);

      // Log('body invoice update $body');

      final response = await http.post(url,
          body: body != null ? jsonEncode(body) : null,
          headers: token != null
              ? createHeader(
                  token: token,
                )
              : createHeaderWithoutToken());

      // log(response.body);

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<http.Response> delete({
    Map<String, dynamic>? param,
    required String service,
    String? token,
  }) async {
    try {
      // Log("Delete");
      // Log(Uri.https(baseUrl, service, param));
      final url = param != null
          ? Uri.https(baseUrl, service, param)
          : Uri.https(baseUrl, service);
      final response = await http.delete(url,
          headers: token != null
              ? createHeader(
                  token: token,
                )
              : createHeaderWithoutToken());

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}

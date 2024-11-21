import 'dart:convert';

import 'package:http/http.dart' as http;

import '../helper/helper.dart';
import '../model/api_exception.dart';

class APIServices {
  late String _url;
  final Map<String, String> _header = {};

  Future<void> _getHeader() async {
    // _header.putIfAbsent('Content-Type', () => 'multipart/form-data');
  }

  APIServices() {
    _getEndpoint();
    _getHeader();
  }

  void _getEndpoint() {
    _url = 'https://flutter-api-demo.graduan.xyz/api';
  }

  Future post(
      {required String path, required Map<String, dynamic> body}) async {
    try {
      var client = http.Client();

      var response = await client.post(Uri.parse('$_url$path'),
          body: body, headers: _header);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
      throw ApiException(
        code: response.statusCode.toString(),
        message: response.body,
      );
    } catch (e) {
      logError('Error post : $e');
      rethrow;
    }
  }

  Future get(String path) async {
    try {
      var client = http.Client();

      var response =
          await client.get(Uri.parse('$_url$path'), headers: _header);

      if (response.statusCode == 200) {
        return response.body;
      }
      throw ApiException(
        code: response.statusCode.toString(),
        message: response.body,
      );
    } catch (e) {
      rethrow;
    }
  }

  void put() {}
}

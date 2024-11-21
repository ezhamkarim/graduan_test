import 'dart:convert';

import 'package:graduan_test/src/service/service.dart';
import 'package:http/http.dart' as http;

import '../helper/helper.dart';
import '../model/api_exception.dart';

class APIServices {
  late String _url;
  final Map<String, String> _header = {};
  Future<void> _getHeader() async {
    _header.putIfAbsent('Content-Type', () => 'multipart/form-data');

    var token = await CacheService.readCache('token');

    if (token == null) return;

    _header.putIfAbsent('Authorization', () => 'Bearer $token');
  }

  APIServices() {
    _getEndpoint();
    _getHeader();
  }

  void _getEndpoint() {
    _url = 'https://flutter-api-demo.graduan.xyz/api';
  }

  Future post({
    required String path,
    required Map<String, String>
        formData, // Form data should be a Map<String, String>
  }) async {
    try {
      // Prepare the multipart request
      var uri = Uri.parse('$_url$path');
      var request = http.MultipartRequest('POST', uri);

      // Add headers
      request.headers.addAll(_header);

      // Add form-data fields
      formData.forEach((key, value) {
        request.fields[key] = value;
      });

      // Send the request
      var streamedResponse = await request.send();

      // Convert the streamed response to a full response
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }

      throw ApiException(
        code: response.statusCode.toString(),
        message: response.body,
      );
    } catch (e) {
      logError('Error post (form-data): $e');
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

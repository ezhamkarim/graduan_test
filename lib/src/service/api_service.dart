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

    _header.update(
      'Authorization',
      (v) => 'Bearer $token',
      ifAbsent: () => 'Bearer $token',
    );
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
    required Map<String, String> formData,
  }) async {
    try {
      await _getHeader();

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

      if (response.statusCode == 200 || response.statusCode == 204) {
        return response.body.isNotEmpty ? jsonDecode(response.body) : null;
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

  Future postLogout({
    required String path,
    required Map<String, dynamic> body,
  }) async {
    try {
      var client = http.Client();

      var token = await CacheService.readCache('token');
      var response = await client.post(Uri.parse('$_url$path'), headers: {
        'Accept': 'application/json',
        'Content-Length': '0',
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200 || response.statusCode == 204) {
        return response.body.isNotEmpty ? jsonDecode(response.body) : null;
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
      await _getHeader();
      var client = http.Client();

      var response =
          await client.get(Uri.parse('$_url$path'), headers: _header);

      if (response.statusCode == 200) {
        logInfo('Response : ${response.body}');
        return jsonDecode(response.body);
      }
      throw ApiException(
        code: response.statusCode.toString(),
        message: response.body,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future put({
    required String path,
    required Map<String, String> body,
  }) async {
    try {
      await _getHeader();
      var client = http.Client();

      _header['Content-Type'] = 'application/x-www-form-urlencoded';

      var response = await client.put(
        Uri.parse('$_url$path'),
        headers: _header,
        encoding: Encoding.getByName('utf-8'),
        body: body, // Send the encoded body
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        return response.body.isNotEmpty ? jsonDecode(response.body) : null;
      }

      throw ApiException(
        code: response.statusCode.toString(),
        message: response.body,
      );
    } catch (e) {
      logError('Error put : $e');
      rethrow;
    }
  }
}

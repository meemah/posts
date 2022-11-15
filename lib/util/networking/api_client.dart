import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'networking.dart';

class NetworkClient {
  static Future<dynamic> get({required String url}) async {
    dynamic responseJson;
    try {
      final response = await http.get(
        Uri.parse(url),
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  static Future<dynamic> post({required String url, dynamic body}) async {
    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(url), body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  static dynamic _returnResponse(http.Response response) {
    log(response.body);
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = response.body.toString();
        return responseJson;
      case 400:
        throw BadRequestException(
            jsonDecode(response.body.toString())["message"]);
      case 401:
      case 403:
        throw UnauthorisedException(
            jsonDecode(response.body.toString())["message"]);
      case 500:
        throw FetchDataException(
            jsonDecode(response.body.toString())["message"]);
      default:
        throw BadRequestException(
            jsonDecode(response.body.toString())["message"]);
    }
  }
}

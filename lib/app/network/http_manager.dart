import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:solsafe/app/constants/app_constant.dart';

class HttpManager {
  static HttpManager? _instance;
  static HttpManager get instance {
    _instance ??= HttpManager._init();
    return _instance!;
  }

  HttpManager._init();

  Future<Map<String, dynamic>> getJsonRequest(String urlPath_) async {
    String uri = urlPath + urlPath_;
    debugPrint(uri);
    try {
      http.Response res = await http.get(Uri.parse(uri));
      var body = jsonDecode(res.body);
      if (res.statusCode == 200) {
        return {'status': true, 'data': body};
      } else {
        return {'status': false, 'message': body};
      }
    } on HttpException catch (e) {
      return {'status': false, 'message': e.message};
    }
  }
 getJsonRequestEasy(String urlPath_) async {
    String uri = urlPath + urlPath_;
    debugPrint(uri);
    try {
      http.Response res = await http.get(Uri.parse(uri));
      var body = jsonDecode(res.body);
      if (res.statusCode == 200) {
        return {'status': true, 'data': body};
      } else {
        return {'status': false, 'message': body};
      }
    } on HttpException catch (e) {
      return  e.message;
    }
  }

  Future<Map<String, dynamic>> postJsonRequest(
      String urlPath_1, Map<String, dynamic> requestBody) async {
    String uri = urlPath + urlPath_1;
    debugPrint(uri);
    try {
      http.Response res = await http.post(Uri.parse(uri),
          body: jsonEncode(requestBody),
          headers: {'Content-Type': 'application/json'});
      var body = jsonDecode(res.body);
      if (res.statusCode == 200) {
        return {'status': true, 'data': body};
      } else {
        return {'status': false, 'message': body};
      }
    } on HttpException catch (e) {
      return {'status': false, 'message': e.message};
    }
  }
}

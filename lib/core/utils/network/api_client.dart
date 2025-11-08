import 'dart:async';
import 'dart:convert';
import 'dart:io' as IO;
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:six_am_tech_task/core/utils/network/url_helper.dart';

class ApiClient {

  static Future<dynamic> get(String url, dynamic parameters, bool isJWTRequired, {bool isGeoCoding = false, Map<String, String>? headers}) async {
    try {
      Dio dio = await dioClient(isJWTRequired, isGeoCoding: isGeoCoding, headers: headers);
      Response response = await dio.get(url, queryParameters: parameters).catchError((error) => throw error);
      return dioResponse(response);
    } on DioException catch (e) {
      throwError(e);
    } catch (e) {
      rethrow;
    }
  }

  static dynamic dioResponse(Response response) {
    try {
      var responseJson = json.decode(response.toString());
      switch (response.statusCode) {
        case 200:
        case 201:
        case 412:
          return responseJson;
        case 401:
          throw throwResponseError(response);
        case 403:
        case 404:
        case 417:
        case 422:
        case 500:
        case 503:
          throw throwResponseError(response);
        default:
          throw throwResponseError(response);
      }
    } catch (e) {
      debugPrint(e.toString());
      throw e.toString();
    }
  }

  static Future<Dio> dioClient(bool isJWTRequired, {bool isGeoCoding = false, Map<String, String>? headers}) async {
    String? token = "";
    if (isJWTRequired) {
      //token = await Prefs.getValue(SharedPreferenceConstant.jwt);
    }
    Dio dio = Dio(await _options(token, isJWTRequired, isGeoCoding, headers));
    isProduction(dio);
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (IO.HttpClient client) {
      client.badCertificateCallback = (IO.X509Certificate cert, String host, int port) => true;
      return client;
    };
    return dio;
  }

  static Future<BaseOptions> _options(String token, bool isJWTRequired, bool isGeoCoding, Map<String, String>? headers) async {
    var header = {
      'Content-Type': 'application/json; charset=UTF-8',
    };

    if (headers != null) {
      header.addAll(headers);
    }

    if (isJWTRequired) {
      header['Authorization'] = 'Bearer $token';
    }

    return BaseOptions(
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      headers: header,
    );
  }

  static void throwError(Exception e) {
    if (e is DioException) {
      if (e.error is SocketException) {
        throw "Check your internet connection";
      } else {
        if (e.response != null) {
          String? errorMsg;
          if (e.response?.data["message"]?.isNotEmpty == true) {
            errorMsg = e.response?.data["message"];
          }
          if (e.response?.statusMessage?.isNotEmpty == true) {
            errorMsg = e.response?.statusMessage;
          }
          throw errorMsg ?? 'Something went wrong';
        } else {
          throw e.error.toString();
        }
      }
    } else {
      throw 'Something went wrong';
    }
  }

  static dynamic throwResponseError(Response<dynamic> response) {
    try {
      var responseJson = json.decode(response.toString());
      return responseJson;
    } on DioException catch (e) {
      throwError(e);
    } catch (e) {
      throw e.toString();
    }
  }

}

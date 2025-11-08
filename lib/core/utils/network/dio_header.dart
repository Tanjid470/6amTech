import 'package:dio/dio.dart';

Options dioHeader() {
  return Options(
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'zoneId': '[1]',
      'latitude': '23.735129',
      'longitude': '90.425614',
    },
  );
}

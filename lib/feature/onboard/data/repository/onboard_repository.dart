import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:six_am_tech_task/core/utils/const/url_conts.dart';
import 'package:six_am_tech_task/core/utils/network/api_client.dart';
import 'package:six_am_tech_task/core/utils/network/dio_header.dart';
import 'package:six_am_tech_task/feature/onboard/data/model/banners_response_body.dart';
import 'package:six_am_tech_task/feature/onboard/data/model/categories_response_body.dart';

class OnBoardRepository {
  Dio dio = Dio();

  Future<List<Banners>?> getBanners() async {
    try {
      dio = await ApiClient.dioClient(true);
      Response response = await dio.get(
        UrlConst.banners,
        options: dioHeader(),
      );
      BannersResponse data = BannersResponse.fromJson(response.data);
      if (response.statusCode == 200) {
        return data.banners?.toList();
      }
      else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<List<Category>?> getCategories() async {
    try {
      dio = await ApiClient.dioClient(true);
      Response response = await dio.get(
        UrlConst.categories,
        options: dioHeader(),
      );

      if (response.statusCode == 200) {

        if (response.data is List) {
          return (response.data as List)
              .map((json) => Category.fromJson(json))
              .toList();
        }
        else if (response.data['data'] != null && response.data['data'] is List) {
          return (response.data['data'] as List)
              .map((json) => Category.fromJson(json))
              .toList();
        }
      }
      return null;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:six_am_tech_task/core/utils/const/url_conts.dart';
import 'package:six_am_tech_task/core/utils/network/api_client.dart';
import 'package:six_am_tech_task/core/utils/network/dio_header.dart';
import 'package:six_am_tech_task/feature/onboard/data/model/banners_response_body.dart';
import 'package:six_am_tech_task/feature/onboard/data/model/campaign_response_body.dart';
import 'package:six_am_tech_task/feature/onboard/data/model/categories_response_body.dart';
import 'package:six_am_tech_task/feature/onboard/data/model/popular_food_response_body.dart';

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

  Future<List<Products>?> getPopularFood() async {
    try {
      dio = await ApiClient.dioClient(true);
      Response response = await dio.get(
        UrlConst.popularFood,
        options: dioHeader(),
      );
      PopularFoodResponse data = PopularFoodResponse.fromJson(response.data);
      if (response.statusCode == 200) {
        return data.products?.toList();
      }
      else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<List<CampaignItem>?> getCampaign() async {
    try {
      dio = await ApiClient.dioClient(true);
      Response response = await dio.get(
        UrlConst.foodCampaign,
        options: dioHeader(),
      );

      if (response.statusCode == 200) {
        return CampaignResponse.fromJson(response.data).campaigns;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }


}

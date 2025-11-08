import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:six_am_tech_task/feature/onboard/data/model/banners_response_body.dart';
import 'package:six_am_tech_task/feature/onboard/data/repository/onboard_repository.dart';


class OnBoardController extends GetxController {
  OnBoardRepository onBoardRepository = OnBoardRepository();

  List<Banners>? allBanners = [];
  List<Category>? allCategories = [];

  RxBool isLoadingBanners = false.obs;
  RxBool isLoadingCategories = false.obs;

  TextEditingController searchController = TextEditingController();

  var selectedPage = 0.obs;
  void changePage(int value) {
    selectedPage.value = value;
  }

  Future<void> getAllBanners() async {
    isLoadingBanners.value = true;
    final result = await onBoardRepository.getBanners();
    if (result != null) {
      allBanners = result;
    }
    isLoadingBanners.value = false;
  }

  Future<void> getAllCategories() async {
    isLoadingCategories.value = true;
    final result = await onBoardRepository.getCategories();
    if (result != null) {
      //allCategories = result;
    }
    isLoadingCategories.value = false;
  }

  void initAll() {
    getAllBanners();
    getAllCategories();
  }
}

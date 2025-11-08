import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:six_am_tech_task/feature/onboard/data/model/banners_response_body.dart';
import 'package:six_am_tech_task/feature/onboard/data/repository/onboard_repository.dart';


class OnBoardController extends GetxController {
  OnBoardRepository onBoardRepository = OnBoardRepository();

  List<Banners>? allBanners = [];

  RxBool isLoadingMyCourseList = false.obs;
  RxBool isLoadingMyCourseModuleList = false.obs;

  TextEditingController searchController = TextEditingController();

  var selectedPage = 0.obs;
  void changePage(int value) {
    selectedPage.value = value;
  }

  Future<void> getAllBanners() async {
    isLoadingMyCourseList.value = false;
    final result = await onBoardRepository.getBanners();
    if (result != null) {
      isLoadingMyCourseList.value = true;
      allBanners = result;
    }
    isLoadingMyCourseList.value = true;
  }
}

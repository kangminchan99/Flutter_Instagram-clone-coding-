import 'package:flutter/material.dart';
import 'package:get/get.dart';

// this를 사용하려면  with GetTickerProviderStateMixin를 해줘야한다.
class MyPageController extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
  }
}

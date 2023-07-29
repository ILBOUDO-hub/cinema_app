import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cinema/models/movies.dart';


class TicketDetailController extends GetxController with SingleGetTickerProviderMixin {
  late TabController tabController;
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: 0); // Initialisez la longueur à 0
    pageController = PageController();
    update();
  }

  @override
  void onClose() {
    tabController.dispose();
    pageController.dispose();
    super.onClose();
  }

  void selectTabIndex(int index) {
    tabController.animateTo(index);
    pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }
}

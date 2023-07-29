import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cinema/models/movies.dart';

class TicketDetailController extends GetxController with SingleGetTickerProviderMixin {
  late TabController tabController;
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: 2);
    pageController = PageController();
    update();
  }

  @override
  void onClose() {
    tabController.dispose();
    pageController.dispose(); // Dispose the PageController
    super.onClose();
  }

  void selectTabIndex(int index) {
    tabController.animateTo(index);
    pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeInOut); // Use animateToPage for smooth transition
  }
}

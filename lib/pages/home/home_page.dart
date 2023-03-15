import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/pages/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key}) {
    Get.put(HomeController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Text('ahihi'),
      ),
    );
  }
}

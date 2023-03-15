import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_app/common/custom_text.dart';
import 'package:test_app/pages/home/home_page.dart';
import 'package:test_app/pages/home_tab/home_tab_controller.dart';
import 'package:test_app/pages/home_tab/widget/custom_tab.dart';
import 'package:test_app/values/app_extension.dart';
import 'package:test_app/values/assets.dart';

class HomeTabPage extends GetView<HomeTabController> {
  HomeTabPage({super.key}) {
    Get.put(HomeTabController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: SafeArea(
        child: Obx(
          () => Stack(
            children: [
              Positioned.fill(
                child: Container(
                  color: Colors.red,
                  child: IndexedStack(
                    index: controller.currentTab.value,
                    children: [
                      HomePage(),
                      Text('2'),
                      Text('3'),
                      Text('4'),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 24.w,
                right: 24.w,
                child: BottomNavyBar(
                  selectedIndex: controller.currentTab.value,
                  showElevation: true,
                  borderRadius: 50.borderRadius,
                  itemCornerRadius: 24.w,
                  containerHeight: 56.w,
                  curve: Curves.easeIn,
                  itemPadding: 4.leftInset,
                  onItemSelected: (index) => controller.currentTab(index),
                  items: <BottomNavyBarItem>[
                    BottomNavyBarItem(
                      icon: controller.currentTab.value == 0
                          ? Image.asset(R.icHomeActive)
                          : Icon(Icons.add_home_sharp),
                      title: AppText(
                        'Trang chủ',
                        size: 12.sp,
                        color: const Color(0xFFE11A1A),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    BottomNavyBarItem(
                      icon: Image.asset(
                        R.icCalendar,
                        width: 24.w,
                      ),
                      title: AppText(
                        'Calendar',
                        size: 12.sp,
                        color: const Color(0xFFE11A1A),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    BottomNavyBarItem(
                      icon: Image.asset(R.icInfo),
                      title: AppText(
                        'Infomation',
                        size: 12.sp,
                        color: const Color(0xFFE11A1A),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    BottomNavyBarItem(
                      icon: Image.asset(R.icAccount),
                      title: AppText(
                        'Account',
                        size: 12.sp,
                        color: const Color(0xFFE11A1A),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 24.w,
                bottom: 64.w,
                child: Container(
                  width: 65.w,
                  height: 65.w,
                  padding: 16.allInset,
                  decoration: BoxDecoration(
                      borderRadius: 60.borderRadius,
                      gradient: const LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Color(0xFFFF8D4E), Color(0xFFE11A1A)])),
                  child: Center(
                    child: Image.asset(
                      R.icSupport,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

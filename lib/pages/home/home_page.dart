import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_app/common/app_image.dart';
import 'package:test_app/common/custom_text.dart';
import 'package:test_app/common/title_widget.dart';
import 'package:test_app/pages/home/home_controller.dart';
import 'package:test_app/pages/home/widget/item_deal.dart';
import 'package:test_app/values/app_colors.dart';
import 'package:test_app/values/app_extension.dart';

import '../../values/assets.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key}) {
    Get.put(HomeController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              locationTop(),
              searchTop(),
              feature(),
              deals(),
              100.hB,
            ],
          ),
        ),
      ),
    );
  }

  locationTop() {
    return TitleWidget(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            R.icLocation,
            width: 24.w,
          ),
          8.wB,
          AppText(
            '112, Duy Tân, Cầu Giấy, Hà nội',
            maxlength: 21,
            size: 12.sp,
            fontWeight: FontWeight.w700,
          ),
          8.wB,
          Image.asset(
            R.icArrDown,
            width: 24.w,
          ),
        ],
      ),
      trailingWidget: Image.asset(
        R.icNoti,
        width: 24.w,
      ),
    );
  }

  searchTop() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            Positioned(
              right: 0,
              top: 0,
              child: Image.asset(R.bg1),
            ),
            Row(
              children: [
                24.wB,
                Expanded(
                  child: AppText(
                    'Chẩn đoán tình trạng xe của bạn!',
                    size: 24.sp,
                    color: AppColors.primaryColor,
                  ),
                ),
                Image.asset(R.bgCar),
              ],
            ),
          ],
        ),
        search(),
      ],
    );
  }

  search() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 30.w),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 20.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.w),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                  ),
                ],
                color: Colors.white,
              ),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                cursorHeight: 21.w,
                maxLines: 1,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  isDense: true,
                  hintText: 'Chẩn đoán tình trạng xe',
                  hintStyle: TextStyle(
                    height: 1,
                    fontSize: 14.sp,
                    color: const Color(0xFFAEAEAE),
                  ),
                ),
              ),
            ),
          ),
          12.wB,
          Image.asset(
            R.icCapture,
            width: 56.w,
          ),
        ],
      ),
    );
  }

  feature() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.w),
      color: Colors.white,
      child: Row(
        children: [
          itemFeature('dịch vụ', R.icFeature1),
          itemFeature('đèn Taplo', R.icFeature2),
          itemFeature('chi tiêu', R.icFeature3),
          itemFeature('Cứu hộ', R.icFeature4),
        ],
      ),
    );
  }

  itemFeature(String title, url) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            url,
            width: 45.w,
          ),
          8.hB,
          AppText(
            title.toUpperCase(),
            size: 12.sp,
          ),
        ],
      ),
    );
  }

  deals() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TitleWidget(
          title: 'Ưu đãi gần bạn',
          trailingWidget: AppText(
            'Xem tất cả',
            size: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryColor,
          ),
        ),
        DefaultTabController(
          length: 6,
          child: Column(
            children: [
              TabBar(
                isScrollable: true,
                indicatorColor: AppColors.primaryColor,
                labelStyle: TextStyle(
                  fontSize: 15.w,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'sfPro',
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 15.w,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'sfPro',
                ),
                labelColor: AppColors.primaryColor,
                unselectedLabelColor: const Color(0xFF313131),
                tabs: const [
                  Tab(text: 'Trang bị'),
                  Tab(text: 'Phụ kiện'),
                  Tab(text: 'Phụ tùng'),
                  Tab(text: 'Dầu máy'),
                  Tab(text: 'Nâng cấp'),
                  Tab(text: 'Bảng điều khiển'),
                ],
                onTap: (index) {},
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: 24.horizontalInset,
                child: Row(
                  children: List.generate(
                    5,
                    (index) => const ItemDealWidget(),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_app/values/app_extension.dart';

import '../../../common/app_image.dart';
import '../../../common/custom_text.dart';
import '../../../values/assets.dart';

class ItemDealWidget extends StatelessWidget {
  const ItemDealWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.4,
      padding: 6.allInset,
      margin: 8.rightInset,
      decoration: BoxDecoration(
        borderRadius: 15.borderRadius,
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: Get.width * 0.4,
            height: Get.width * 0.4,
            child: const AppImage(
              'http://via.placeholder.com/350x150',
              radius: 10,
              boxFit: BoxFit.cover,
            ),
          ),
          3.hB,
          Container(
            decoration: BoxDecoration(
              borderRadius: 10.borderRadius,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 0.5,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            padding: 5.allInset,
            child: AppText(
              'Hạnh Garage gói bảo dưỡng xe',
              size: 14.sp,
              fontWeight: FontWeight.w600,
              maxline: 2,
            ),
          ),
          8.hB,
          Padding(
            padding: 5.verticalInset,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  R.icLocation,
                  width: 15.w,
                ),
                5.wB,
                AppText(
                  '1,5km - Bắc Từ Liêm',
                  size: 12.sp,
                  fontWeight: FontWeight.w300,
                  color: const Color(0xFF0A0B09),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

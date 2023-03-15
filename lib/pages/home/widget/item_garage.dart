import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_app/values/app_extension.dart';

import '../../../common/app_image.dart';
import '../../../common/custom_text.dart';
import '../../../values/assets.dart';

class ItemGarageWidget extends StatelessWidget {
  const ItemGarageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.55,
      padding: 6.allInset,
      margin: 8.rightInset,
      decoration: BoxDecoration(
        borderRadius: 15.borderRadius,
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const AspectRatio(
            aspectRatio: 182 / 126,
            child: AppImage(
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
              'Hoai Ha Garage salon oto uy tín',
              size: 14.sp,
              fontWeight: FontWeight.w600,
              maxline: 2,
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
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  R.icBag,
                  width: 15.w,
                ),
                4.wB,
                Expanded(
                  child: AppText(
                    '5k lượt chọn',
                    size: 12.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Image.asset(
                  R.icStarActive,
                  width: 12.w,
                ),
                Image.asset(
                  R.icStarActive,
                  width: 12.w,
                ),
                Image.asset(
                  R.icStarActive,
                  width: 12.w,
                ),
                Image.asset(
                  R.icStarActive,
                  width: 12.w,
                ),
                Image.asset(
                  R.icStar,
                  width: 12.w,
                ),
              ],
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
                Expanded(
                  child: AppText(
                    '800m - Bắc Từ Liêm, Hà Nội Nội Nội',
                    size: 12.sp,
                    fontWeight: FontWeight.w300,
                    maxline: 2,
                    color: const Color(0xFF0A0B09),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

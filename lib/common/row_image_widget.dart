import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/values/app_extension.dart';

import '../values/app_colors.dart';
import 'app_image.dart';
import 'custom_text.dart';

class RowImageItemWidget extends StatelessWidget {
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final dynamic title;
  final dynamic description;
  final String? imageUrl;
  final bool? imageInright;
  final Function? onTap;
  final double? sizeImage;
  final double? radiusImage;
  final double? radius;
  final Widget? action;

  const RowImageItemWidget({
    Key? key,
    this.title,
    this.padding,
    this.margin,
    this.description,
    this.imageUrl,
    this.onTap,
    this.imageInright = false,
    this.sizeImage,
    this.radiusImage,
    this.radius,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 0),
        color: Colors.white,
      ),
      padding: padding ?? EdgeInsets.fromLTRB(8.w, 8.w, 16.w, 8.w),
      margin: margin,
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (onTap != null) onTap!();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!imageInright!) ...[_imageWidget(radiusImage), 12.wB],
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        title != null
                            ? title is String
                                ? AppText(
                                    title,
                                    size: 15.sp,
                                    fontWeight: FontWeight.w600,
                                    maxline: 2,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                : title
                            : const SizedBox(),
                        6.hB,
                        description != null
                            ? description is String
                                ? AppText(
                                    description,
                                    size: 13.sp,
                                    maxline: 2,
                                    overflow: TextOverflow.ellipsis,
                                    color: const Color(0xFF0A0B09),
                                  )
                                : description
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (action != null) ...[4.wB, action!, 12.wB],
          if (imageInright!) ...[12.wB, _imageWidget(radiusImage)],
        ],
      ),
    );
  }

  _imageWidget(double? radius) {
    return SizedBox(
      width: sizeImage ?? 92.w,
      height: sizeImage ?? 92.w,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 12.w),
        child: AppImage(imageUrl ?? ''),
      ),
    );
  }
}

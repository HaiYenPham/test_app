import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/values/app_extension.dart';

import 'custom_text.dart';

class TitleWidget extends StatelessWidget {
  final dynamic title;
  final Widget? trailingWidget;
  final Widget? leadingWidget;
  final EdgeInsets? padding;
  const TitleWidget({
    Key? key,
    required this.title,
    this.trailingWidget,
    this.leadingWidget,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ?? EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.w),
      child: Row(
        children: [
          if (leadingWidget != null) ...[leadingWidget!, 8.wB],
          Expanded(
            child: title is String
                ? AppText(
                    title,
                    fontWeight: FontWeight.w600,
                    size: 16.sp,
                    maxline: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                : title,
          ),
          if (trailingWidget != null) ...[8.wB, trailingWidget!],
        ],
      ),
    );
  }
}

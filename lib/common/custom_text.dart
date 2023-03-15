import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String title;
  final double? size;
  final TextAlign? textAlign;
  final Color? color;
  final FontWeight? fontWeight;
  final EdgeInsets? padding;
  final int? maxline;
  final int? maxlength;
  final TextOverflow? overflow;
  final bool? softWrap;

  const AppText(
    this.title, {
    Key? key,
    this.size,
    this.textAlign,
    this.color,
    this.fontWeight,
    this.padding,
    this.maxline,
    this.overflow,
    this.softWrap,
    this.maxlength,
  }) : super(key: key);

  AppText copyWith({
    double? size,
    TextAlign? textAlign,
    Color? color,
    FontWeight? fontWeight,
    EdgeInsets? padding,
    int? maxline,
    TextOverflow? overflow,
    bool? softWrap,
    int? maxlength,
  }) {
    return AppText(
      title,
      size: size ?? this.size,
      textAlign: textAlign ?? this.textAlign,
      color: color ?? this.color,
      fontWeight: fontWeight ?? this.fontWeight,
      padding: padding ?? this.padding,
      maxline: maxline ?? this.maxline,
      overflow: overflow ?? this.overflow,
      softWrap: softWrap,
      maxlength: maxlength,
    );
  }

  @override
  Widget build(BuildContext context) {
    var disT = title;
    var length = maxlength ?? 0;
    if (length > 0 && title.length > length) {
      disT = title.substring(0, length);
      disT = '$disT...';
    }
    return Container(
      padding: padding ?? EdgeInsets.zero,
      child: Text(
        disT,
        style: TextStyle(
          fontFamily: 'outfit',
          fontSize: size,
          fontWeight: fontWeight ?? FontWeight.w400,
          color: color ?? Colors.black,
        ),
        maxLines: maxline,
        overflow: overflow,
        textAlign: textAlign,
        softWrap: softWrap,
      ),
    );
  }
}

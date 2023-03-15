import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../../values/assets.dart';

class AppImage extends StatelessWidget {
  final String url;
  final double radius;
  final String errorImage;
  final bool hasShape;
  final BoxFit boxFit;
  final BoxShape shape;
  final ExtendedImageMode mode;
  final BoxBorder? border;
  final Widget Function()? onLoading;
  final Size? sizeFailed;

  final bool showLoading;

  const AppImage(
    this.url, {
    Key? key,
    this.hasShape = true,
    this.radius = 0,
    this.errorImage = R.icFeature1,
    this.boxFit = BoxFit.cover,
    this.shape = BoxShape.rectangle,
    this.mode = ExtendedImageMode.none,
    this.onLoading,
    this.border,
    this.showLoading = true,
    this.sizeFailed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      url,
      mode: mode,
      fit: boxFit,
      gaplessPlayback: true,
      timeLimit: const Duration(seconds: 3),
      retries: 1,
      shape: hasShape ? shape : null,
      border: border,
      borderRadius: hasShape
          ? BorderRadius.all(Radius.elliptical(
              radius,
              radius,
            ))
          : null,
      loadStateChanged: (state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            if (onLoading != null) {
              return onLoading!();
            }
            return const SizedBox();
          case LoadState.completed:
            return state.completedWidget;
          case LoadState.failed:
            return Center(
              child: SizedBox(
                width: sizeFailed?.width ?? double.infinity,
                height: sizeFailed?.height ?? double.infinity,
                child: Container(
                  color: const Color(0xFFDDDDDD),
                  child: Center(
                    child: Image.asset(
                      errorImage,
                      gaplessPlayback: true,
                      width: 48,
                      height: 48,
                    ),
                  ),
                ),
              ),
            );
        }
      },
    );
  }
}

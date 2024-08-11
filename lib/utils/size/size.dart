import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'dart:ui' as ui;

// MediaQueryData mediaQueryData = MediaQuery.of(Get.context!);
// MediaQueryData mediaQueryData = MediaQueryData.fromView(ui.window);
MediaQueryData mediaQueryData = MediaQueryData.fromView(
    WidgetsBinding.instance.platformDispatcher.views.single);

extension ResponsiveExtension on num {
  get _width {
    return mediaQueryData.size.width;
  }

  double get screenWidth {
    return (this * mediaQueryData.size.width / 100).toDouble();
  }

  get _heightViewPort {
    return mediaQueryData.size.height;
  }

  get height {
    num statusBar = mediaQueryData.viewPadding.top;
    num bottomBar = mediaQueryData.viewPadding.bottom;
    num screenHeight = mediaQueryData.size.height - statusBar - bottomBar;
    return screenHeight;
  }

  double get screenHeight {
    num statusBar = mediaQueryData.viewPadding.top;
    num bottomBar = mediaQueryData.viewPadding.bottom;
    num availableHeight = mediaQueryData.size.height - statusBar - bottomBar;
    return (this * availableHeight / 100).toDouble();
  }

  get statusBar {
    return mediaQueryData.viewPadding.top;
  }

  double get h => ((this * _width) / _width);
  double get v => (this * _heightViewPort) / (_heightViewPort - statusBar);
  double get adaptSize {
    var height = v;
    var width = h;
    return height < width ? height.toDoubleValue() : width.toDoubleValue();
  }

  double get fSize => adaptSize;
}

extension FormatExtension on double {
  double toDoubleValue({int fractionDigits = 2}) {
    return double.parse(toStringAsFixed(fractionDigits));
  }
}

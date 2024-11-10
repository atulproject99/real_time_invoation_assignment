import 'dart:developer';

import 'package:flutter/widgets.dart';

class Sizes {
  static const double _defaultWidth = 360;
  static const double _defaultHeight = 690;

  static double get defaultWidth => _defaultWidth;
  static double get defaultHeight => _defaultHeight;

  static double width = defaultWidth;
  static double height = defaultHeight;

  /// Updates the width and height of the device's screen size
  static void updateSize(Size size) {
    log('App Resolutions width: ${size.width} height: ${size.height}');
    if (size.width != 0 && size.height != 0) {
      Sizes.width = size.width;
      Sizes.height = size.height;
    }
  }
}

extension SizeExtenstion on num {
  /// Calculates the sp (Scalable Pixel) depending on the device's screen size
  double get sp => Sizes.width < Sizes.height
      ? this * (Sizes.width / Sizes.defaultWidth)
      : this * (Sizes.height / Sizes.defaultHeight);
}

import 'dart:io';

import 'package:flutter/foundation.dart';

enum PlatFormType { android, ios, web, windows, unknown }

class CurrentPlatform {
  static PlatFormType get type {
    if (kIsWeb) {
      return PlatFormType.web;
    } else if (Platform.isAndroid) {
      return PlatFormType.android;
    } else if (Platform.isIOS) {
      return PlatFormType.ios;
    } else if (Platform.isWindows) {
      return PlatFormType.windows;
    } else {
      return PlatFormType.unknown;
    }
  }
}

import 'package:flutter/material.dart';

import '../../keys/app_keys.dart';

class CustomBottomSheet {
  /// Method to show bottom sheet
  static showBottomSheet({required Widget Function(BuildContext) builder}) {
    showModalBottomSheet(
      context: AppKeys.navigatorKey.currentContext!,
      useSafeArea: true,
      isScrollControlled: true,
      useRootNavigator: true,
      sheetAnimationStyle: AnimationStyle(duration: Durations.medium2),
      builder: builder,
    );
  }
}

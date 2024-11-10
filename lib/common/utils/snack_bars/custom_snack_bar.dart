import 'package:flutter/material.dart';

import '../../keys/app_keys.dart';
import '../../theme/app_colors.dart';
import '../../widgets/custom_text_widgets.dart';

class Snack {
  static _show({required String title, required Color color}) {
    AppKeys.scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        backgroundColor: color,
        content: TextRobo16W500(title, color: AppColors.white),
      ),
    );
  }

  static success(String title) {
    _show(title: title, color: AppColors.green);
  }

  static error(String title) {
    _show(title: title, color: AppColors.red);
  }
}

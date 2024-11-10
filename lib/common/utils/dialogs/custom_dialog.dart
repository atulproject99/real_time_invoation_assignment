import 'package:flutter/material.dart';

import '../../keys/app_keys.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_geometry.dart';
import 'confirm_dialog.dart';
import 'loading_dialog.dart';

class CustomDialog {
  static void _showDialog({
    required Widget child,
    bool onWillPop = true,
    bool barrierDismissible = true,
  }) {
    showDialog(
      context: AppKeys.navigatorKey.currentContext!,
      barrierDismissible: barrierDismissible,
      builder: (context) => PopScope(
        canPop: onWillPop,
        child: Dialog(
          shape: const RoundedRectangleBorder(borderRadius: AppBorderRadius.a5),
          insetPadding: AppEdgeInsets.a10,
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: AppBorderRadius.a10,
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.1),
                  blurRadius: 15,
                  offset: const Offset(5, 5),
                )
              ],
            ),
            child: child,
          ),
        ),
      ),
    );
  }

  ///Generic dialog, pass any widget!
  static void dialog({
    required Widget child,
    bool barrierDismissible = true,
    bool onWillPop = true,
  }) {
    _showDialog(
      child: child,
      barrierDismissible: barrierDismissible,
      onWillPop: onWillPop,
    );
  }

  ///Call to close any open screen using go router!
  static void closeScreen() {
    // final canPop = AppKeys.navigatorKey.currentContext!.canPop();
    // if (canPop) {
    //   AppKeys.navigatorKey.currentContext?.pop();
    // } else {
    //   AppKeys.navigatorKey.currentContext!.go(HomeView.path);
    // }
  }

  ///Call to close any open dialog using navigator 1.0!
  static void closeDialog() {
    final canPop = Navigator.of(AppKeys.navigatorKey.currentContext!).canPop();
    if (canPop) {
      Navigator.of(AppKeys.navigatorKey.currentContext!).pop();
    }
  }

  ///Pre defined loading dialog
  static void loading({required String message}) {
    _showDialog(
      child: LoadingDialog(message: message),
      barrierDismissible: false,
      onWillPop: false,
    );
  }

  static void confirmDialog(
      {required String message,
      String title = 'Alert',
      String confirmButtonTitle = 'Yes',
      String cancelButtonTitle = 'No',
      required VoidCallback onConfirm}) {
    showDialog(
      context: AppKeys.navigatorKey.currentContext!,
      barrierDismissible: false,
      builder: (context) => ConfirmDialog(
        message: message,
        onConfirm: onConfirm,
        title: title,
        cancelButtonTitle: cancelButtonTitle,
        confirmButtonTitle: confirmButtonTitle,
      ),
    );
  }
}

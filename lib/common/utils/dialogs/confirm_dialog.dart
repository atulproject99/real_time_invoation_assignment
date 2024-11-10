import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_font_size.dart';
import '../../theme/app_geometry.dart';
import '../../widgets/buttons/custom_filled_button.dart';
import '../../widgets/custom_sized_boxes.dart';
import '../../widgets/custom_text_widgets.dart';

import 'custom_dialog.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog(
      {super.key,
      required this.message,
      required this.title,
      required this.onConfirm,
      required this.cancelButtonTitle,
      required this.confirmButtonTitle});
  final String message;
  final String title;
  final VoidCallback onConfirm;
  final String confirmButtonTitle;
  final String cancelButtonTitle;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(borderRadius: AppBorderRadius.a10),
      backgroundColor: AppColors.white,
      title: Row(
        children: [
          TextRobo16W700(title),
        ],
      ),
      content: TextRobo16W400(message),
      actionsOverflowButtonSpacing: AppSize.size14,
      actions: [
        Row(
          children: [
            Expanded(
              child: CustomFilledButton(
                text: confirmButtonTitle,
                onTap: onConfirm,
                color: AppColors.blue,
              ),
            ),
            const SBW5(),
            Expanded(
              child: CustomFilledButton(
                  color: AppColors.blue.withOpacity(0.2),
                  textColor: AppColors.blue,
                  text: cancelButtonTitle,
                  onTap: CustomDialog.closeDialog),
            ),
          ],
        )
      ],
    );
  }
}

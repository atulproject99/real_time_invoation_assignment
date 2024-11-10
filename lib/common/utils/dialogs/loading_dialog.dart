import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_font_size.dart';
import '../../theme/app_geometry.dart';

import '../../widgets/custom_sized_boxes.dart';
import '../../widgets/custom_text_widgets.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({
    super.key,
    required this.message,
  });
  final String message;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        height: AppSize.size150,
        width: AppSize.size150,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: AppBorderRadius.a10,
        ),
        child: Padding(
          padding: AppEdgeInsets.a20,
          child: Column(
            children: [
              const CircularProgressIndicator(),
              const SBH30(),
              TextRobo16W500(message),
            ],
          ),
        ),
      ),
    );
  }
}

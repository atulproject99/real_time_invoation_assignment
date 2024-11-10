import 'package:flutter/material.dart';
import '../../../../common/constants/app_strings_constants.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/theme/app_font_size.dart';
import '../../../../common/theme/app_geometry.dart';
import '../../../../common/widgets/buttons/custom_filled_button.dart';
import '../../../../common/widgets/custom_sized_boxes.dart';

class AddEmployyBottomWidget extends StatelessWidget {
  const AddEmployyBottomWidget(
      {super.key,
      required this.onSavePressed,
      required this.onCancelPressed,
      this.buttonWidth});
  final VoidCallback onSavePressed;
  final VoidCallback onCancelPressed;
  final double? buttonWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Divider
        const Divider(
          color: AppColors.darkGrey,
          thickness: 2,
        ),
        const SBH10(),

        /// Cancel and Save buttons
        Padding(
          padding: AppEdgeInsets.h10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                  child: CustomFilledButton(
                text: AppStrings.cancel,
                onTap: onCancelPressed,
                width: buttonWidth ?? AppSize.size100,
                color: AppColors.blue.withOpacity(0.2),
                textColor: AppColors.blue,
              )),
              const SBW10(),
              Flexible(
                  child: CustomFilledButton(
                text: AppStrings.save,
                width: buttonWidth ?? AppSize.size100,
                onTap: onSavePressed,
                color: AppColors.blue,
                textColor: AppColors.white,
              )),
            ],
          ),
        ),
      ],
    );
  }
}

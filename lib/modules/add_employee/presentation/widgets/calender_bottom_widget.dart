import 'package:flutter/material.dart';
import '../../../../common/constants/image_path_constants.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/theme/app_font_size.dart';

import '../../../../common/widgets/buttons/custom_filled_button.dart';
import '../../../../common/widgets/custom_sized_boxes.dart';
import '../../../../common/widgets/custom_text_widgets.dart';
import '../../../../common/widgets/images/custom_svg_asset.dart';
import 'package:intl/intl.dart';

class CalendarBottomWidget extends StatelessWidget {
  const CalendarBottomWidget(
      {super.key,
      required this.onSavePressed,
      required this.onCancelPressed,
      this.buttonWidth,
      this.selectedDate});
  final VoidCallback onSavePressed;
  final VoidCallback onCancelPressed;
  final double? buttonWidth;
  final DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: AppColors.darkGrey,
          thickness: 2,
        ),
        const SBH10(),
        Row(
          children: [
            Row(
              children: [
                const CustomSvgAsset(
                  imagePath: SvgIcons.calendarIcon,
                  height: 24,
                  width: 24,
                ),
                const SBW5(),
                TextRobo14W400(selectedDate != null
                    ? DateFormat('d MMM yyyy')
                        .format(selectedDate ?? DateTime.now())
                    : 'No Date'),
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                      child: CustomFilledButton(
                    text: 'Cancel',
                    width: buttonWidth ?? AppSize.size90,
                    color: AppColors.blue.withOpacity(0.2),
                    textColor: AppColors.blue,
                    onTap: onCancelPressed,
                  )),
                  const SBW10(),
                  Flexible(
                      child: CustomFilledButton(
                    text: 'Save',
                    width: buttonWidth ?? AppSize.size90,
                    onTap: onSavePressed,
                    color: AppColors.blue,
                    textColor: AppColors.white,
                  )),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

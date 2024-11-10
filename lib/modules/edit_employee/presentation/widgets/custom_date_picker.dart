import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../common/constants/image_path_constants.dart';
import '../../../../common/enums/date_option_enum.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/theme/app_geometry.dart';
import '../../../../common/utils/dialogs/custom_dialog.dart';
import '../../../../common/widgets/images/custom_svg_asset.dart';
import '../../../../common/widgets/text_form_fields/custom_text_form_field.dart';
import '../../../add_employee/presentation/widgets/custom_calender_widget.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({
    super.key,
    required TextEditingController startDateController,
    required TextEditingController endDateController,
  })  : _startDateController = startDateController,
        _endDateController = endDateController;

  final TextEditingController _startDateController;
  final TextEditingController _endDateController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: CustomTextFormField(
          controller: _startDateController,
          readOnly: true,
          prefixIcon: const Padding(
              padding: AppEdgeInsets.a10,
              child: CustomSvgAsset(imagePath: SvgIcons.calendarIcon)),
          onTap: () {
            CustomDialog.dialog(
              child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.7,
                  child: CustomCalendarWidget(
                    initialDate:
                        DateOption.getDateForTitle(_startDateController.text),
                    onDateSelected: (date) {
                      _startDateController.text = date != null
                          ? DateFormat('d MMM yyyy').format(date)
                          : 'No Date';
                    },
                  )),
            );
          },
        )),
        const Padding(
          padding: AppEdgeInsets.h10,
          child: Icon(
            Icons.arrow_forward,
            color: AppColors.blue,
          ),
        ),
        Expanded(
            child: CustomTextFormField(
          controller: _endDateController,
          onTap: () {
            CustomDialog.dialog(
              child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.7,
                  child: CustomCalendarWidget(
                    initialDate:
                        DateOption.getDateForTitle(_endDateController.text),
                    onDateSelected: (date) {
                      _endDateController.text = date != null
                          ? DateFormat('d MMM yyyy').format(date)
                          : 'No Date';
                    },
                  )),
            );
          },
          prefixIcon: const Padding(
              padding: AppEdgeInsets.a10,
              child: CustomSvgAsset(imagePath: SvgIcons.calendarIcon)),
          readOnly: true,
        )),
      ],
    );
  }
}

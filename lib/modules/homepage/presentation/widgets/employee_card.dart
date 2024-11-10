import 'package:flutter/material.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/theme/app_geometry.dart';
import '../../../../common/widgets/custom_sized_boxes.dart';
import '../../../../common/widgets/custom_text_widgets.dart';
import '../../../add_employee/data/model/employee_model.dart';
import 'package:intl/intl.dart';

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({
    super.key,
    required this.employeeModel,
    required this.onTap,
  });

  final EmployeeModel employeeModel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // Format the start and end dates for display in 'd MMM, yyyy' format
    final formattedStartDate =
        DateFormat('d MMM, yyyy').format(employeeModel.startDate!);
    final formattedEndDate = employeeModel.endDate != null
        ? DateFormat('d MMM, yyyy').format(employeeModel.endDate!)
        : null;

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: AppEdgeInsets.a16,
        color: AppColors.white,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Display the employee's name
            TextRobo16W500(employeeModel.name),
            const SBH5(),

            /// Display the employee's role
            TextRobo14W400(
              employeeModel.role,
              color: AppColors.black.withOpacity(0.4),
            ),
            const SBH5(),

            /// Display the formatted start and end dates
            TextRobo12W400(
              formattedEndDate != null
                  ? '$formattedStartDate - $formattedEndDate'
                  : 'From $formattedStartDate',
              color: AppColors.black.withOpacity(0.4),
            ),
          ],
        ),
      ),
    );
  }
}

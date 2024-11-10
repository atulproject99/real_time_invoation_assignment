import 'package:flutter/material.dart';
import '../../../../common/constants/image_path_constants.dart';

import '../../../../common/extensions/context_extension.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/theme/app_font_size.dart';
import '../../../../common/theme/app_geometry.dart';

import '../../../../common/widgets/custom_text_widgets.dart';
import '../../../../common/widgets/images/custom_svg_asset.dart';
import '../../../add_employee/data/model/employee_model.dart';
import '../../../edit_employee/presentation/views/edit_employee_view.dart';
import '../cubit/delete_employee_cubit.dart';

import 'employee_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeListWidget extends StatefulWidget {
  const EmployeeListWidget(
      {super.key, required this.title, required this.employeeList});
  final String title;
  final List<EmployeeModel> employeeList;

  @override
  State<EmployeeListWidget> createState() => _EmployeeListWidgetState();
}

class _EmployeeListWidgetState extends State<EmployeeListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title Section: Displays the title of the employee list
          Container(
            padding: AppEdgeInsets.a16,
            width: double.infinity,
            color: AppColors.lightGrey.withOpacity(0.7),
            child: TextRobo16W500(
              widget.title,
              color: AppColors.blue,
            ),
          ),

          /// Employee List Section: Displays a list of employees with swipe-to-delete functionality
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Dismissible(
                    key: Key(widget.employeeList[index].id.toString()),
                    direction: DismissDirection.endToStart,

                    // Delete employee on swipe
                    onDismissed: (direction) async {
                      await context
                          .read<DeleteEmployeeCubit>()
                          .deleteEmployee(widget.employeeList[index].id);
                      setState(() {
                        widget.employeeList.removeAt(index);
                      });
                    },

                    /// Background when swiping to delete
                    background: Container(),
                    secondaryBackground: Container(
                      color: Colors.red,
                      width: AppSize.size80,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomSvgAsset(
                            imagePath: SvgIcons.deleteIcon,
                            height: AppSize.size24,
                            width: AppSize.size24,
                          ),
                        ],
                      ),
                    ),

                    /// Employee card widget displaying the employee information
                    child: EmployeeCard(
                      onTap: () {
                        context.pushPage(EditEmployeeView(
                          id: widget.employeeList[index].id,
                        ));
                      },
                      employeeModel: widget.employeeList[index],
                    ),
                  ),
              separatorBuilder: (context, index) => const Divider(
                    color: AppColors.darkGrey,
                  ),
              itemCount: widget.employeeList.length)
        ],
      ),
    );
  }
}

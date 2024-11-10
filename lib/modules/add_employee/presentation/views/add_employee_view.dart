import 'dart:developer';

import 'package:flutter/material.dart';
import '../../../../common/constants/app_strings_constants.dart';
import '../../../../common/constants/image_path_constants.dart';
import '../../../../common/enums/date_option_enum.dart';
import '../../../../common/extensions/context_extension.dart';
import '../../../../common/models/page_state.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/theme/app_font_size.dart';

import '../../../../common/theme/app_geometry.dart';
import '../../../../common/utils/bottom_sheet/custom_bottom_sheet.dart';
import '../../../../common/utils/dialogs/custom_dialog.dart';
import '../../../../common/utils/snack_bars/custom_snack_bar.dart';

import '../../../../common/widgets/custom_app_bar.dart';
import '../../../../common/widgets/custom_sized_boxes.dart';

import '../../../../common/widgets/images/custom_svg_asset.dart';
import '../../../../common/widgets/text_form_fields/custom_text_form_field.dart';
import '../../../edit_employee/presentation/widgets/custom_date_picker.dart';
import '../cubit/add_employee_cubit.dart';
import '../../data/model/employee_model.dart';

import '../widgets/add_employee_bottom_widget.dart';

import '../widgets/employee_rold_bottom_sheet_widget.dart';
import '../../../homepage/presentation/cubit/get_employees_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEmployeeView extends StatefulWidget {
  const AddEmployeeView({super.key});

  @override
  State<AddEmployeeView> createState() => _AddEmployeeViewState();
}

class _AddEmployeeViewState extends State<AddEmployeeView> {
  late TextEditingController _nameController;
  late TextEditingController _roleController;
  late TextEditingController _startDateController;
  late TextEditingController _endDateController;
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _roleController = TextEditingController();
    _startDateController = TextEditingController();
    _endDateController = TextEditingController();
    _startDateController.text = DateOption.today.title;
    _endDateController.text = 'No Date';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomAppBar(title: AppStrings.addEmployeeDetails),
      body: Stack(
        children: [
          Positioned.fill(
            child: ListView(
              padding: AppEdgeInsets.a16,
              children: [
                const SBH10(),
                CustomTextFormField(
                  controller: _nameController,
                  hintText: AppStrings.employeeNameHintText,
                  prefixIcon: const Padding(
                      padding: AppEdgeInsets.a5,
                      child: CustomSvgAsset(imagePath: SvgIcons.personIcon)),
                ),
                const SBH20(),
                CustomTextFormField(
                  hintText: AppStrings.selectRoleHintText,
                  controller: _roleController,
                  onTap: () {
                    CustomBottomSheet.showBottomSheet(
                        builder: (context) => EmployeeRoldBottomSheetWidget(
                              onRoleSelected: (value) {
                                log('Selected role: $value');
                                _roleController.text = value;
                                Navigator.pop(context);
                              },
                            ));
                  },
                  enabled: true,
                  autofocus: false,
                  readOnly: true,
                  suffixIcon: Padding(
                      padding: AppEdgeInsets.a5,
                      child: Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.blue,
                        size: AppSize.size22,
                      )),
                  prefixIcon: const Padding(
                      padding: AppEdgeInsets.a10,
                      child: CustomSvgAsset(imagePath: SvgIcons.roleIcon)),
                ),
                const SBH20(),
                CustomDatePicker(
                  startDateController: _startDateController,
                  endDateController: _endDateController,
                ),
                const SBH20(),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: BlocListener<AddEmployeeCubit, PageState>(
              listener: (context, state) {
                if (state is PageSuccessState) {
                  Snack.success(state.data.toString());
                  CustomDialog.closeDialog();
                  Navigator.of(context).pop();
                  context.read<GetAllEmployeeCubit>().getAllEmployees();
                } else if (state is PageErrorState) {
                  CustomDialog.closeDialog();
                  Snack.error(state.exception.message);
                } else if (state is PageLoadingState) {
                  CustomDialog.loading(message: AppStrings.adding);
                }
              },
              child: AddEmployyBottomWidget(
                onCancelPressed: () {
                  context.popPage();
                },
                onSavePressed: () {
                  log('save button pressed');
                  final model = EmployeeModel(
                      name: _nameController.text,
                      role: _roleController.text,
                      startDate:
                          DateOption.getDateForTitle(_startDateController.text),
                      endDate:
                          DateOption.getDateForTitle(_endDateController.text));
                  context.read<AddEmployeeCubit>().addEmployee(model);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

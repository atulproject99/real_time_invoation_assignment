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

import '../../../add_employee/data/model/employee_model.dart';

import '../../../add_employee/presentation/widgets/add_employee_bottom_widget.dart';

import '../../../add_employee/presentation/widgets/employee_rold_bottom_sheet_widget.dart';
import '../../../homepage/presentation/cubit/get_employees_cubit.dart';
import '../cubit/get_employee_details_cubit.dart';
import '../cubit/update_employee_cubit.dart';
import '../../../homepage/presentation/cubit/delete_employee_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/custom_date_picker.dart';

/// EditEmployeeView is the screen for editing an existing employee's details.
class EditEmployeeView extends StatefulWidget {
  const EditEmployeeView({super.key, required this.id});

  /// Employee ID to fetch and update details.
  final int id;

  @override
  State<EditEmployeeView> createState() => _EditEmployeeViewState();
}

class _EditEmployeeViewState extends State<EditEmployeeView> {
  late TextEditingController _nameController;
  late TextEditingController _roleController;
  late TextEditingController _startDateController;
  late TextEditingController _endDateController;

  /// Initializes the controllers and fetches employee details by ID.
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _roleController = TextEditingController();
    _startDateController = TextEditingController();
    _endDateController = TextEditingController();

    /// Fetch employee details for the given employee ID.
    context.read<GetEmployeeDetailsCubit>().fetchEmployeeById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: AppStrings.editEmployeeDetails,
        actions: [
          Padding(
            padding: AppEdgeInsets.h10,
            child: CustomSvgAsset(
              imagePath: SvgIcons.deleteIcon,
              height: AppSize.size24,
              width: AppSize.size24,
              onTap: () {
                /// Show confirmation dialog for deleting employee.
                CustomDialog.confirmDialog(
                    message: AppStrings.confirmDeleteEmployee,
                    onConfirm: () {
                      context
                          .read<DeleteEmployeeCubit>()
                          .deleteEmployee(widget.id);
                      CustomDialog.closeDialog();
                      Navigator.of(context).pop();
                    });
              },
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: BlocBuilder<GetEmployeeDetailsCubit, PageState>(
                builder: (context, state) {
              if (state is PageLoadingState) {
                /// Show a loading indicator while fetching employee details.
                return const Center(child: CircularProgressIndicator());
              } else if (state is PageErrorState) {
                /// Show error message if fetching fails.
                return Center(child: Text(state.exception.message));
              } else if (state is PageSuccessState) {
                final employee = state.data as EmployeeModel;

                /// Prepopulate the text controllers with the employee's existing details.
                Future.microtask(() {
                  _nameController.text = employee.name;
                  _roleController.text = employee.role;
                  _startDateController.text =
                      DateOption.getTitleForDate(employee.startDate);
                  _endDateController.text =
                      DateOption.getTitleForDate(employee.endDate);
                });

                return ListView(
                  padding: AppEdgeInsets.a16,
                  children: [
                    const SBH10(),
                    CustomTextFormField(
                      controller: _nameController,
                      hintText: AppStrings.employeeNameHintText,
                      prefixIcon: const Padding(
                          padding: AppEdgeInsets.a5,
                          child:
                              CustomSvgAsset(imagePath: SvgIcons.personIcon)),
                    ),
                    const SBH20(),
                    CustomTextFormField(
                      hintText: AppStrings.selectRoleHintText,
                      controller: _roleController,
                      onTap: () {
                        /// Show bottom sheet for selecting role.
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
                        endDateController: _endDateController),
                    const SBH20(),
                  ],
                );
              } else {
                return const SizedBox.shrink();
              }
            }),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: BlocListener<UpdateEmployeeCubit, PageState>(
              listener: (context, state) {
                if (state is PageSuccessState) {
                  /// Show success message and pop the screen.
                  Snack.success(state.data.toString());
                  CustomDialog.closeDialog();
                  context.popPage();
                  context.read<GetAllEmployeeCubit>().getAllEmployees();
                } else if (state is PageErrorState) {
                  /// Show error message if update fails.
                  CustomDialog.closeDialog();
                  Snack.error(state.exception.message);
                } else if (state is PageLoadingState) {
                  /// Show loading dialog while updating.
                  CustomDialog.loading(message: 'Updating...');
                }
              },
              child: AddEmployyBottomWidget(
                onCancelPressed: () {
                  /// Cancel button to pop the screen.
                  context.popPage();
                },
                onSavePressed: () {
                  final model = EmployeeModel(
                      id: widget.id,
                      name: _nameController.text,
                      role: _roleController.text,
                      startDate: DateOption.getDateForTitle(
                          _startDateController.text)!,
                      endDate:
                          DateOption.getDateForTitle(_endDateController.text));
                  context.read<UpdateEmployeeCubit>().updateEmployee(model);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import '../../../../common/constants/app_strings_constants.dart';
import '../../../../common/constants/image_path_constants.dart';

import '../../../../common/extensions/context_extension.dart';
import '../../../../common/models/page_state.dart';

import '../../../../common/theme/app_colors.dart';
import '../../../../common/theme/app_font_size.dart';

import '../../../../common/theme/app_geometry.dart';
import '../../../../common/utils/snack_bars/custom_snack_bar.dart';
import '../../../../common/widgets/custom_app_bar.dart';
import '../../../../common/widgets/custom_sized_boxes.dart';
import '../../../../common/widgets/custom_text_widgets.dart';
import '../../../../common/widgets/images/custom_asset_image.dart';
import '../../../add_employee/data/model/employee_model.dart';

import '../../../add_employee/presentation/views/add_employee_view.dart';
import '../cubit/delete_employee_cubit.dart';
import '../cubit/get_employees_cubit.dart';
import '../widgets/employee_list_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  void initState() {
    super.initState();
    // Fetch all employees when the view is initialized
    context.read<GetAllEmployeeCubit>().getAllEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushPage(const AddEmployeeView());
        },
        child: const Icon(Icons.add),
      ),
      appBar: const CustomAppBar(
          showBackIcon: false, title: AppStrings.employeeList),
      body: const _HomePageBody(),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllEmployeeCubit, PageState>(
      builder: (context, state) {
        // Show loading indicator while the data is being fetched
        if (state is PageLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PageErrorState) {
          // Display an error message if there was an issue fetching the data
          return Center(
            child: TextRobo16W700(state.exception.message),
          );
        } else if (state is PageSuccessState) {
          log('state.data ${state.data}');

          // Check if the employee list is empty and show an appropriate image if no employees exist
          return (state.data as List<EmployeeModel>).isEmpty
              ? Center(
                  child: CustomAssetImage(
                  imagePath: PngImages.noEmployeeImage,
                  height: AppSize.size240,
                  width: AppSize.size240,
                ))
              : BlocListener<DeleteEmployeeCubit, PageState>(
                  listener: (context, state) {
                    // Show success or error message after deleting an employee
                    if (state is PageSuccessState) {
                      Snack.success(state.data);
                      context.read<GetAllEmployeeCubit>().getAllEmployees();
                    } else if (state is PageErrorState) {
                      Snack.error(state.exception.message);
                    }
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              // Display current employees section if there are any active employees
                              Visibility(
                                visible: (state.data as List<EmployeeModel>)
                                    .where((e) => e.endDate == null)
                                    .toList()
                                    .isNotEmpty,
                                replacement: const SizedBox.shrink(),
                                child: EmployeeListWidget(
                                  title: 'Current Employee',
                                  employeeList:
                                      (state.data as List<EmployeeModel>)
                                          .where((e) => e.endDate == null)
                                          .toList(),
                                ),
                              ),
                              // Display previous employees section if there are any employees with an end date
                              Visibility(
                                visible: (state.data as List<EmployeeModel>)
                                    .where((e) => e.endDate != null)
                                    .toList()
                                    .isNotEmpty,
                                replacement: const SizedBox.shrink(),
                                child: EmployeeListWidget(
                                  title: 'Previous Employee',
                                  employeeList:
                                      (state.data as List<EmployeeModel>)
                                          .where((e) => e.endDate != null)
                                          .toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: AppEdgeInsets.a10,
                        child: TextRobo14W500(
                          'Swipe left to delete',
                          color: AppColors.black.withOpacity(0.3),
                        ),
                      ),
                      const SBH30(),
                    ],
                  ),
                );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

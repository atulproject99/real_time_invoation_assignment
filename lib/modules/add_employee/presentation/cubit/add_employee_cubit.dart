import 'dart:developer';

import '../../../../common/constants/app_strings_constants.dart';
import '../../../../common/models/db_exception.dart';
import '../../../../common/models/page_state.dart';
import '../../data/helper/db_helper.dart';
import '../../data/model/employee_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEmployeeCubit extends Cubit<PageState> {
  AddEmployeeCubit() : super(PageInitState());

  Future<void> addEmployee(EmployeeModel employee) async {
    emit(PageLoadingState());

    /// Validate the employee details before adding
    if (employee.name.isEmpty) {
      emit(
          PageErrorState(exception: DbException(AppStrings.nameCannotBeEmpty)));
      return;
    } else if (employee.role.isEmpty) {
      emit(
          PageErrorState(exception: DbException(AppStrings.roleCannotBeEmpty)));
      return;
    } else if (employee.startDate == null) {
      emit(PageErrorState(
          exception: DbException(AppStrings.startDateCannotBeEmpty)));
      return;
    }

    /// Call the database helper to add the employee record
    final result = await DatabaseHelper.instance.addEmployee(employee);

    /// Handle the result of the add operation
    result.fold(
      // If an error occurs during the add operation, log the error and emit the error state
      (error) {
        log('Error ${error.message}');
        emit(PageErrorState(exception: error));
      },
      // If the add operation is successful, emit a success state with a success message
      (success) {
        emit(PageSuccessState(
            data: success > 0
                ? AppStrings.employeeAddedSuccessfully
                : AppStrings.somethingWentWrongWhileAddingEmployee));
      },
    );
  }

  // Log the state change whenever the state is updated
  @override
  void onChange(Change<PageState> change) {
    super.onChange(change);
    log('Change state $change');
  }
}

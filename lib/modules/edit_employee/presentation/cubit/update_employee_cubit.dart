import '../../../../common/constants/app_strings_constants.dart';
import '../../../../common/models/db_exception.dart';
import '../../../add_employee/data/helper/db_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../add_employee/data/model/employee_model.dart';
import '../../../../common/models/page_state.dart';

class UpdateEmployeeCubit extends Cubit<PageState> {
  UpdateEmployeeCubit() : super(PageInitState());

  Future<void> updateEmployee(EmployeeModel employee) async {
    /// Validate employee data before updating
    if (employee.name.isEmpty) {
      // Emit an error state if the name is empty
      emit(
          PageErrorState(exception: DbException(AppStrings.nameCannotBeEmpty)));
      return;
    } else if (employee.role.isEmpty) {
      // Emit an error state if the role is empty
      emit(
          PageErrorState(exception: DbException(AppStrings.roleCannotBeEmpty)));
      return;
    }

    emit(PageLoadingState());

    final result = await DatabaseHelper.instance.updateEmployee(employee);

    /// Handle the result of the update operation
    result.fold(
      // If an error occurs during the update, emit the error state with the exception message
      (error) {
        emit(PageErrorState(exception: error));
      },
      // If the update is successful, emit a success state with a message
      (updatedRows) {
        emit(PageSuccessState(
            data: updatedRows > 0
                ? AppStrings.employeeUpdatedSuccessfully
                : AppStrings.somethingWentWrongWhileUpdatingEmployee));
      },
    );
  }
}

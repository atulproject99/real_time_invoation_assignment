import '../../../add_employee/data/helper/db_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/models/page_state.dart';

class GetAllEmployeeCubit extends Cubit<PageState> {
  GetAllEmployeeCubit() : super(PageInitState());

  Future<void> getAllEmployees() async {
    emit(PageLoadingState());

    /// Call the database helper to fetch all employees
    final result = await DatabaseHelper.instance.getAllEmployees();

    /// Handle the result of fetching employees
    result.fold(
      /// If an error occurs during fetching, emit the error state with the exception message
      (error) {
        emit(PageErrorState(exception: error));
      },

      /// If employees are fetched successfully, emit the success state with the employee data
      (employees) {
        emit(PageSuccessState(data: employees));
      },
    );
  }
}

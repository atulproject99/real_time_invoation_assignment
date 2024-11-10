import '../../../../common/models/page_state.dart';
import '../../../add_employee/data/helper/db_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetEmployeeDetailsCubit extends Cubit<PageState> {
  GetEmployeeDetailsCubit() : super(PageInitState());

  Future<void> fetchEmployeeById(int id) async {
    /// Emit the loading state while fetching employee details
    emit(PageLoadingState());

    final result = await DatabaseHelper.instance.getEmployeeById(id);

    /// Handle the result of fetching employee details
    result.fold(
      /// If an error occurs during fetching, emit the error state with the exception message
      (error) => emit(PageErrorState(exception: error)),

      /// If employee details are fetched successfully, emit the success state with the employee data
      (employee) => emit(PageSuccessState(data: employee)),
    );
  }
}

import '../../../../common/models/page_state.dart';
import '../../../add_employee/data/helper/db_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteEmployeeCubit extends Cubit<PageState> {
  DeleteEmployeeCubit() : super(PageInitState());

  Future<void> deleteEmployee(int id) async {
    /// Emit the loading state while performing the deletion
    emit(PageLoadingState());

    /// Call the database helper to delete the employee
    final result = await DatabaseHelper.instance.deleteEmployee(id);

    /// Handle the result of the deletion
    result.fold(
      /// If an error occurs during deletion, emit the error state with the exception message
      (error) {
        emit(PageErrorState(exception: error));
      },

      /// If deletion is successful, emit the success state with the appropriate message
      (deletedRows) {
        emit(PageSuccessState(
            data: deletedRows > 0
                ? 'Employee deleted successfully' // If rows are deleted, success message
                : 'No employee found to delete.' // If no rows are deleted, inform that no employee was found
            ));
      },
    );
  }
}

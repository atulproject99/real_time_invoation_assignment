import 'db_exception.dart';

sealed class PageState {}

class PageInitState extends PageState {}

class PageLoadingState extends PageState {}

class PageSuccessState<T> extends PageState {
  final T? data;
  PageSuccessState({this.data});
}

class PageErrorState extends PageState {
  final DbException exception;
  PageErrorState({required this.exception});
}

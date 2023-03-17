import 'package:bloc/bloc.dart';

/// Class to controll the pages
class AppNavigatorState {
  /// Actual page
  final AppNavigatorPage page;

  /// Main constructor
  const AppNavigatorState(this.page);
}

/// Pages in navigator
enum AppNavigatorPage {
  /// form
  form,

  /// list
  list,

  /// detail
  detail,
}

/// Change the app navigator states
class AppNavigatorController extends Cubit<AppNavigatorState> {
  /// Main constructor
  AppNavigatorController()
      : super(const AppNavigatorState(AppNavigatorPage.form));

  /// Show form
  void showForm() => emit(const AppNavigatorState(AppNavigatorPage.form));

  /// Show list
  void showList() => emit(const AppNavigatorState(AppNavigatorPage.list));

  /// Show detail
  void showDetail() => emit(const AppNavigatorState(AppNavigatorPage.detail));
}

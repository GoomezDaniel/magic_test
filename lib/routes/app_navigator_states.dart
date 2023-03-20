import 'package:bloc/bloc.dart';

/// Class to controll the pages
class AppNavigatorState {
  /// Current page
  final AppNavigatorPage page;

  /// Main constructor
  const AppNavigatorState(this.page);
}

/// Pages in navigator
enum AppNavigatorPage {
  /// form page
  form,

  /// list page
  list,

  /// detail page
  detail,
}

/// Change the app navigator states
class AppNavigatorController extends Cubit<AppNavigatorState> {
  /// Main constructor
  AppNavigatorController()
      : super(const AppNavigatorState(AppNavigatorPage.form));

  /// Show form page
  void showForm() => emit(const AppNavigatorState(AppNavigatorPage.form));

  /// Show list page
  void showList() => emit(const AppNavigatorState(AppNavigatorPage.list));

  /// Show detail page
  void showDetail() => emit(const AppNavigatorState(AppNavigatorPage.detail));
}

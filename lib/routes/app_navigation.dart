import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_test/routes/app_navigator_states.dart';
import 'package:magic_test/screens/detail_page.dart';
import 'package:magic_test/screens/form_page.dart';
import 'package:magic_test/screens/list_page.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({super.key});

  static final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppNavigatorController, AppNavigatorState>(
      builder: (context, state) {
        return WillPopScope(
            onWillPop: () async {
              if (_navigatorKey.currentState!.canPop()) {
                _navigatorKey.currentState!.pop();
                return false;
              }
              return true;
            },
            child: Navigator(
              key: _navigatorKey,
              pages: [
                const MaterialPage(
                  key: ValueKey('FormPage'),
                  child: FormPage(),
                ),
                if (state.page == AppNavigatorPage.list) ...[
                  const MaterialPage(
                    key: ValueKey('ListPage'),
                    child: ListPage(),
                  ),
                ],
                if (state.page == AppNavigatorPage.detail) ...[
                  const MaterialPage(
                    key: ValueKey('DetailPage'),
                    child: DetailPage(),
                  ),
                ],
              ],
              onPopPage: (route, result) {
                if (!route.didPop(result)) {
                  return false;
                }
                if (state.page == AppNavigatorPage.list) {
                  context.read<AppNavigatorController>().showForm();
                }
                if (state.page == AppNavigatorPage.detail) {
                  context.read<AppNavigatorController>().showList();
                }

                return true;
              },
            ));
      },
    );
  }
}

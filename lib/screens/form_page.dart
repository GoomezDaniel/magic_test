import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_test/blocs/magic_bloc/magic_bloc.dart';
import 'package:magic_test/routes/app_navigator_states.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MagicBloc, MagicState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Form(
              child: Column(
                children: [
                  /// Name
                  TextFormField(),

                  /// Last name
                  TextFormField(),

                  /// Email
                  TextFormField(),

                  /// Date
                  TextFormField(),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: InkWell(
            onTap: () {
              if (state.magicData.isEmpty) {
                context.read<MagicBloc>().add(MagicLoadData());
              }
              context.read<AppNavigatorController>().showList();
            },
            child: const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.red,
              child: Text('Go'),
            ),
          ),
        );
      },
    );
  }
}

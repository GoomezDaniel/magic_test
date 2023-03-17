import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_test/blocs/magic_bloc/magic_bloc.dart';
import 'package:magic_test/routes/app_navigator_states.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: () {
          BlocProvider.of<MagicBloc>(context).add(MagicLoadData());
          BlocProvider.of<AppNavigatorController>(context).showList();
        },
        child: const CircleAvatar(
          radius: 40,
          backgroundColor: Colors.red,
          child: Text('Go'),
        ),
      ),
    );
  }
}

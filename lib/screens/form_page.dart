import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_test/blocs/magic_bloc/magic_bloc.dart';
import 'package:magic_test/screens/list_page.dart';

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
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ListPage()));
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

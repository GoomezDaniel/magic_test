import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/magic_bloc/magic_bloc.dart';
import '../utils/design/my_styles.dart';

class ReloadDataButton extends StatelessWidget {
  const ReloadDataButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<MagicBloc>(context).add(MagicLoadData());
      },
      child: Container(
        height: 60,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color(0x29000000),
              offset: Offset(0, 3),
              blurRadius: 6,
              spreadRadius: 0,
            )
          ],
        ),
        child: Center(
          child: Text(
            'Reload Data',
            style: MyStyles.title.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

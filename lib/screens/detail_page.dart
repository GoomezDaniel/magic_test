import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/magic_bloc/magic_bloc.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MagicBloc, MagicState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              children: [
                if (state.cardSelected!.imageUrl!.isNotEmpty) ...[
                  Image.network(state.cardSelected!.imageUrl!),
                ],
                Text(state.cardSelected!.name!),
                Text(state.cardSelected!.text!),
              ],
            ),
          ),
        );
      },
    );
  }
}

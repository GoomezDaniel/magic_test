import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../blocs/magic_bloc/magic_bloc.dart';
import '../widgets/list_container.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();

    return BlocConsumer<MagicBloc, MagicState>(
      listener: (context, state) {
        if (state.stateData.hasError) {
          Fluttertoast.showToast(
            msg: 'Error',
            gravity: ToastGravity.CENTER,
          );
        }
        if (state.countPage == 787) {
          Fluttertoast.showToast(
            msg: 'No more data available',
            gravity: ToastGravity.CENTER,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              fit: StackFit.expand,
              children: [
                ListView.builder(
                  controller: controller,
                  padding: const EdgeInsets.all(10),
                  itemCount: state.magicData.length,
                  itemBuilder: (context, index) {
                    final card = state.magicData[index];
                    if (index >= state.magicData.length - 10 &&
                        state.stateData.isSuccess) {
                      BlocProvider.of<MagicBloc>(context).add(MagicLoadData());
                    }
                    return ItemListContainer(card: card);
                  },
                ),
                if (state.stateData.isLoading) ...[
                  const Center(
                    child: CircularProgressIndicator(),
                  )
                ]
              ],
            ),
          ),
        );
      },
    );
  }
}

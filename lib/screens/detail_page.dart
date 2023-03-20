import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_test/utils/design/my_assets.dart';
import 'package:magic_test/utils/design/my_styles.dart';
import 'package:magic_test/widgets/type_and_mana_data.dart';
import 'package:sizer/sizer.dart';

import '../blocs/magic_bloc/magic_bloc.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MagicBloc, MagicState>(
      builder: (context, state) {
        final card = state.cardSelected!;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Magic Detail'),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Sizer(
              builder: (context, orientation, deviceType) {
                if (orientation == Orientation.landscape) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if (card.imageUrl != null) ...[
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: FadeInImage(
                              placeholder: const AssetImage(MyAssets.loading),
                              image: NetworkImage(
                                card.imageUrl!.replaceAll('http', 'https'),
                              ),
                            ),
                          ),
                        ],
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(card.name!, style: MyStyles.title),
                              const SizedBox(height: 10),
                              Text(card.text!, style: MyStyles.subtitle),
                              const SizedBox(height: 10),
                              TypeAndMcData(card: card),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }

                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (card.imageUrl != null) ...[
                        FadeInImage(
                          placeholder: const AssetImage(MyAssets.loading),
                          image: NetworkImage(
                            card.imageUrl!.replaceAll('http', 'https'),
                          ),
                        ),
                      ],
                      const SizedBox(height: 10),
                      Text(card.name!, style: MyStyles.title),
                      const SizedBox(height: 10),
                      Text(card.text!, style: MyStyles.subtitle),
                      const SizedBox(height: 10),
                      TypeAndMcData(card: card),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_test/utils/design/my_styles.dart';
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
          body: SafeArea(
            child: Sizer(
              builder: (context, orientation, deviceType) {
                if (orientation == Orientation.landscape) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if (card.imageUrl!.isNotEmpty) ...[
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: Image.network(card.imageUrl!)),
                        ],
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 10),
                              Text(card.name!, style: MyStyles.title),
                              const SizedBox(height: 10),
                              Text(card.text!, style: MyStyles.subtitle),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  if (card.type != null) ...[
                                    Flexible(
                                      child: RichText(
                                        overflow: TextOverflow.ellipsis,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Type: ',
                                              style: MyStyles.title,
                                            ),
                                            TextSpan(
                                              text: card.type,
                                              style: MyStyles.subtitle,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                  if (card.manaCost != null) ...[
                                    RichText(
                                      overflow: TextOverflow.ellipsis,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'MC: ',
                                            style: MyStyles.title,
                                          ),
                                          TextSpan(
                                            text: card.manaCost,
                                            style: MyStyles.subtitle,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ],
                              ),
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
                      if (card.imageUrl!.isNotEmpty) ...[
                        Image.network(card.imageUrl!),
                      ],
                      const SizedBox(height: 10),
                      Text(card.name!, style: MyStyles.title),
                      const SizedBox(height: 10),
                      Text(card.text!, style: MyStyles.subtitle),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (card.type != null) ...[
                            Flexible(
                              child: RichText(
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Type: ',
                                      style: MyStyles.title,
                                    ),
                                    TextSpan(
                                      text: card.type,
                                      style: MyStyles.subtitle,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                          if (card.manaCost != null) ...[
                            RichText(
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'MC: ',
                                    style: MyStyles.title,
                                  ),
                                  TextSpan(
                                    text: card.manaCost,
                                    style: MyStyles.subtitle,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
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

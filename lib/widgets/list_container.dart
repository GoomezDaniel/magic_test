import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/blocs/magic_bloc/magic_bloc.dart';

import '/routes/app_navigator_states.dart';

import '/models/card_model.dart';

import '/utils/design/my_styles.dart';

class ItemListContainer extends StatelessWidget {
  const ItemListContainer({
    super.key,
    required this.card,
  });

  final MagicCard card;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<MagicBloc>(context).add(SelectCard(card: card));
        BlocProvider.of<AppNavigatorController>(context).showDetail();
      },
      child: Container(
        height: 60,
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                card.name!,
                style: MyStyles.pequenia,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      'Type: ${card.type!}',
                      style: MyStyles.pequenia,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    'MC: ${card.manaCost!}',
                    style: MyStyles.pequenia,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

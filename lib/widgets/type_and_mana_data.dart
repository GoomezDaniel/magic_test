import 'package:flutter/material.dart';

import '../models/card_model.dart';
import '../utils/design/my_styles.dart';

class TypeAndMcData extends StatelessWidget {
  const TypeAndMcData({
    super.key,
    required this.card,
  });

  final MagicCard card;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

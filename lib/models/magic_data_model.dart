import 'card_model.dart';

/// The constructor of Magic API REST petition data
class MagicDataModel {
  /// Main constructor
  MagicDataModel({
    required this.cards,
  });

  /// List of Magic Cards of type [Card]
  List<MagicCard> cards;

  /// [JSON] to [MagicDataModel]
  factory MagicDataModel.fromJson(Map<String, dynamic> json) => MagicDataModel(
        cards: List<MagicCard>.from(
            json["cards"].map((x) => MagicCard.fromJson(x))),
      );
}

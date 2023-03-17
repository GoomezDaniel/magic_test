import 'card_model.dart';

/// The constructor of Magic API REST petition data
class MagicDataModel {
  /// Main constructor
  MagicDataModel({
    required this.cards,
  });

  /// List of Magic Cards of type [Card]
  List<Card> cards;

  /// [JSON] to [MagicDataModel]
  factory MagicDataModel.fromJson(Map<String, dynamic> json) => MagicDataModel(
        cards: List<Card>.from(json["cards"].map((x) => Card.fromJson(x))),
      );
}

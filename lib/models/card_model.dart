/// The Magic Card Model
class MagicCard {
  /// Main constructor
  MagicCard({
    this.name,
    this.manaCost,
    this.cmc,
    this.type,
    this.rarity,
    this.text,
    this.artist,
    this.number,
    this.power,
    this.toughness,
    this.loyalty,
    this.multiverseid,
    this.imageUrl,
    this.originalText,
    this.originalType,
    this.id,
    this.flavor,
  });

  /// The card name. For split, double-faced and flip cards, just the name of one side of the card. Basically each ‘sub-card’ has its own record.
  String? name;

  /// The card layout. Possible values: normal, split, flip, double-faced, token, plane, scheme, phenomenon, leveler, vanguard, aftermath
  String? manaCost;

  /// Converted mana cost. Always a number
  num? cmc;

  /// The card type. This is the type you would see on the card if printed today. Note: The dash is a UTF8 ‘long dash’ as per the MTG rules
  String? type;

  /// The rarity of the card. Examples: Common, Uncommon, Rare, Mythic Rare, Special, Basic Land
  Rarity? rarity;

  /// The oracle text of the card. May contain mana symbols and other symbols.
  String? text;

  /// The artist of the card. This may not match what is on the card as MTGJSON corrects many card misprints.
  String? artist;

  /// The card number. This is printed at the bottom-center of the card in small text. This is a string, not an integer, because some cards have letters in their numbers.
  String? number;

  /// The power of the card. This is only present for creatures. This is a string, not an integer, because some cards have powers like: “1+*”
  String? power;

  /// The toughness of the card. This is only present for creatures. This is a string, not an integer, because some cards have toughness like: “1+*”
  String? toughness;

  /// The loyalty of the card. This is only present for planeswalkers.
  Loyalty? loyalty;

  /// The multiverseid of the card on Wizard’s Gatherer web page. Cards from sets that do not exist on Gatherer will NOT have a multiverseid. Sets not on Gatherer are: ATH, ITP, DKM, RQS, DPA and all sets with a 4 letter code that starts with a lowercase ‘p’.
  String? multiverseid;

  /// The image url for a card. Only exists if the card has a multiverse id.
  String? imageUrl;

  /// The original text on the card at the time it was printed. This field is not available for promo cards.
  String? originalText;

  /// The original type on the card at the time it was printed. This field is not available for promo cards.
  String? originalType;

  /// A unique id for this card. It is made up by doing an SHA1 hash of setCode + cardName + cardImageName
  String? id;

  /// The flavor text of the card.
  String? flavor;

  /// [JSON] to [MagicCard]
  factory MagicCard.fromJson(Map<String, dynamic> json) => MagicCard(
        name: json["name"],
        manaCost: json["manaCost"],
        cmc: json["cmc"],
        type: json["type"],
        rarity: rarityValues.map[json["rarity"]]!,
        text: json["text"],
        artist: json["artist"],
        number: json["number"],
        power: json["power"],
        toughness: json["toughness"],
        loyalty: layoutValues.map[json["layout"]]!,
        multiverseid: json["multiverseid"],
        imageUrl: json["imageUrl"],
        originalText: json["originalText"],
        originalType: json["originalType"],
        id: json["id"],
        flavor: json["flavor"],
      );
}

enum Loyalty { normal }

final layoutValues = EnumValues({"normal": Loyalty.normal});

class LegalityElement {
  LegalityElement({
    this.format,
    this.legality,
  });

  Format? format;
  LegalityEnum? legality;

  /// [JSON] to [LegalityElement]
  factory LegalityElement.fromJson(Map<String, dynamic> json) =>
      LegalityElement(
        format: formatValues.map[json["format"]]!,
        legality: legalityEnumValues.map[json["legality"]]!,
      );
}

enum Format {
  commander,
  duel,
  legacy,
  modern,
  paupercommander,
  penny,
  predh,
  premodern,
  vintage,
  gladiator,
  historic,
  historicbrawl,
  pauper,
  pioneer,
  explorer,
  alchemy
}

final formatValues = EnumValues({
  "Alchemy": Format.alchemy,
  "Commander": Format.commander,
  "Duel": Format.duel,
  "Explorer": Format.explorer,
  "Gladiator": Format.gladiator,
  "Historic": Format.historic,
  "Historicbrawl": Format.historicbrawl,
  "Legacy": Format.legacy,
  "Modern": Format.modern,
  "Pauper": Format.pauper,
  "Paupercommander": Format.paupercommander,
  "Penny": Format.penny,
  "Pioneer": Format.pioneer,
  "Predh": Format.predh,
  "Premodern": Format.premodern,
  "Vintage": Format.vintage
});

enum LegalityEnum { legal, restricted }

final legalityEnumValues = EnumValues(
    {"Legal": LegalityEnum.legal, "Restricted": LegalityEnum.restricted});

enum Rarity { uncommon, common, rare }

final rarityValues = EnumValues({
  "Common": Rarity.common,
  "Rare": Rarity.rare,
  "Uncommon": Rarity.uncommon
});

class Ruling {
  Ruling({
    this.date,
    this.text,
  });

  DateTime? date;
  String? text;

  /// [JSON] to [Ruling]
  factory Ruling.fromJson(Map<String, dynamic> json) => Ruling(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        text: json["text"],
      );
}

enum Type { creature, sorcery, enchantment, instant }

final typeValues = EnumValues({
  "Creature": Type.creature,
  "Enchantment": Type.enchantment,
  "Instant": Type.instant,
  "Sorcery": Type.sorcery
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

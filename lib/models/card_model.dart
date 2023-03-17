/// The Magic Card Model
class Card {
  /// Main constructor
  Card({
    this.name,
    this.manaCost,
    this.cmc,
    this.colors,
    this.colorIdentity,
    this.type,
    this.types,
    this.subtypes,
    this.rarity,
    this.setName,
    this.text,
    this.artist,
    this.number,
    this.power,
    this.toughness,
    this.loyalty,
    this.multiverseid,
    this.imageUrl,
    this.variations,
    this.foreignNames,
    this.printings,
    this.originalText,
    this.originalType,
    this.legalities,
    this.id,
    this.flavor,
    this.rulings,
    this.supertypes,
  });

  /// The card name. For split, double-faced and flip cards, just the name of one side of the card. Basically each ‘sub-card’ has its own record.
  String? name;

  /// The card layout. Possible values: normal, split, flip, double-faced, token, plane, scheme, phenomenon, leveler, vanguard, aftermath
  String? manaCost;

  /// Converted mana cost. Always a number
  num? cmc;

  /// The card colors. Usually this is derived from the casting cost, but some cards are special (like the back of dual sided cards and Ghostfire).
  List<Color>? colors;

  /// The card’s color identity, by color code. [Red], [Blue] becomes [R], [U]. A card’s color identity includes colors from the card’s rules text.
  List<Color>? colorIdentity;

  /// The card type. This is the type you would see on the card if printed today. Note: The dash is a UTF8 ‘long dash’ as per the MTG rules
  String? type;

  /// The supertypes of the card. These appear to the far left of the card type. Example values: [Basic], [Legendary], [Snow], [World], [Ongoing]
  List<String>? supertypes;

  /// The types of the card. These appear to the left of the dash in a card type. Example values: [Instant], [Sorcery], [Artifact], [Creature], [Enchantment], [Land], [Planeswalker]
  List<Type>? types;

  /// The subtypes of the card. These appear to the right of the dash in a card type. Usually each word is its own subtype. Example values: [Trap], [Arcane], [Equipment], [Aura], [Human], [Rat], [Squirrel]
  List<String>? subtypes;

  /// The rarity of the card. Examples: Common, Uncommon, Rare, Mythic Rare, Special, Basic Land
  Rarity? rarity;

  /// The set the card belongs to.
  SetName? setName;

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

  /// The list variations of card
  List<String>? variations;

  /// Foreign language names for the card, if this card in this set was printed in another language. An array of objects, each object having ‘language’, ‘name’ and ‘multiverseid’ keys. Not available for all sets.
  List<ForeignName>? foreignNames;

  /// The sets that this card was printed in, expressed as an array of set codes.
  List<String>? printings;

  /// The original text on the card at the time it was printed. This field is not available for promo cards.
  String? originalText;

  /// The original type on the card at the time it was printed. This field is not available for promo cards.
  String? originalType;

  /// Which formats this card is legal, restricted or banned in. An array of objects, each object having ‘format’ and ‘legality’.
  List<LegalityElement>? legalities;

  /// A unique id for this card. It is made up by doing an SHA1 hash of setCode + cardName + cardImageName
  String? id;

  /// The flavor text of the card.
  String? flavor;

  /// The rulings for the card. An array of objects, each object having ‘date’ and ‘text’ keys.
  List<Ruling>? rulings;

  /// [JSON] to [Card]
  factory Card.fromJson(Map<String, dynamic> json) => Card(
        name: json["name"],
        manaCost: json["manaCost"],
        cmc: json["cmc"],
        colors: json["colors"] == null
            ? []
            : List<Color>.from(json["colors"]!.map((x) => colorValues.map[x]!)),
        colorIdentity: json["colorIdentity"] == null
            ? []
            : List<Color>.from(
                json["colorIdentity"]!.map((x) => colorValues.map[x]!)),
        type: json["type"],
        types: json["types"] == null
            ? []
            : List<Type>.from(json["types"]!.map((x) => typeValues.map[x]!)),
        subtypes: json["subtypes"] == null
            ? []
            : List<String>.from(json["subtypes"]!.map((x) => x)),
        rarity: rarityValues.map[json["rarity"]]!,
        setName: setNameValues.map[json["setName"]]!,
        text: json["text"],
        artist: json["artist"],
        number: json["number"],
        power: json["power"],
        toughness: json["toughness"],
        loyalty: layoutValues.map[json["layout"]]!,
        multiverseid: json["multiverseid"],
        imageUrl: json["imageUrl"],
        variations: json["variations"] == null
            ? []
            : List<String>.from(json["variations"]!.map((x) => x)),
        foreignNames: json["foreignNames"] == null
            ? []
            : List<ForeignName>.from(
                json["foreignNames"]!.map((x) => ForeignName.fromJson(x))),
        printings: json["printings"] == null
            ? []
            : List<String>.from(json["printings"]!.map((x) => x)),
        originalText: json["originalText"],
        originalType: json["originalType"],
        legalities: json["legalities"] == null
            ? []
            : List<LegalityElement>.from(
                json["legalities"]!.map((x) => LegalityElement.fromJson(x))),
        id: json["id"],
        flavor: json["flavor"],
        rulings: json["rulings"] == null
            ? []
            : List<Ruling>.from(
                json["rulings"]!.map((x) => Ruling.fromJson(x))),
        supertypes: json["supertypes"] == null
            ? []
            : List<String>.from(json["supertypes"]!.map((x) => x)),
      );
}

enum Color { W, U }

final colorValues = EnumValues({"U": Color.U, "W": Color.W});

class ForeignName {
  ForeignName({
    this.name,
    this.text,
    this.type,
    this.flavor,
    this.imageUrl,
    this.language,
    this.multiverseid,
  });

  String? name;
  String? text;
  String? type;
  String? flavor;
  String? imageUrl;
  Language? language;
  int? multiverseid;

  /// [JSON] to [ForeignName]
  factory ForeignName.fromJson(Map<String, dynamic> json) => ForeignName(
        name: json["name"],
        text: json["text"],
        type: json["type"],
        flavor: json["flavor"],
        imageUrl: json["imageUrl"],
        language: languageValues.map[json["language"]]!,
        multiverseid: json["multiverseid"],
      );
}

enum Language {
  german,
  spanish,
  french,
  italian,
  japanese,
  portuguese,
  russina,
  chinese
}

final languageValues = EnumValues({
  "Chinese Simplified": Language.chinese,
  "French": Language.french,
  "German": Language.german,
  "Italian": Language.italian,
  "Japanese": Language.japanese,
  "Portuguese (Brazil)": Language.portuguese,
  "Russian": Language.russina,
  "Spanish": Language.spanish
});

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

enum SetName { tenthedition }

final setNameValues = EnumValues({"Tenth Edition": SetName.tenthedition});

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

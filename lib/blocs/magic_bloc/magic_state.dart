part of 'magic_bloc.dart';

class MagicState {
  final List<Card> magicData;
  final Card? cardSelected;
  final int countPage;

  MagicState.initial()
      : magicData = [],
        cardSelected = null,
        countPage = 1;

  MagicState({
    required this.magicData,
    this.cardSelected,
    required this.countPage,
  });

  MagicState copyWith({
    List<Card>? magicData,
    Card? cardSelected,
    int? countPage,
  }) {
    return MagicState(
      magicData: magicData ?? this.magicData,
      cardSelected: cardSelected ?? this.cardSelected,
      countPage: countPage ?? this.countPage,
    );
  }
}

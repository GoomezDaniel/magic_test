part of 'magic_bloc.dart';

class MagicState {
  final List<Card> magicData;
  final Card? cardSelected;
  final int countPage;
  final ComState stateData;

  MagicState.initial()
      : magicData = [],
        cardSelected = null,
        countPage = 1,
        stateData = const ComState.idle();

  MagicState({
    this.magicData = const [],
    this.cardSelected,
    this.countPage = 1,
    this.stateData = const ComState.idle(),
  });

  MagicState copyWith({
    List<Card>? magicData,
    Card? cardSelected,
    int? countPage,
    ComState? stateData,
  }) {
    return MagicState(
      magicData: magicData ?? this.magicData,
      cardSelected: cardSelected ?? this.cardSelected,
      countPage: countPage ?? this.countPage,
      stateData: stateData ?? this.stateData,
    );
  }
}

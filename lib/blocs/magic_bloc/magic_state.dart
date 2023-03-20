part of 'magic_bloc.dart';

/// The values of magic bloc
class MagicState {
  /// The list of cards [MagicCard]
  final List<MagicCard> magicData;

  /// The card selected by list to show the detail information [MagicCard]
  final MagicCard? cardSelected;

  /// The pagination count
  final int countPage;

  /// The state of petition data
  final ComState stateData;

  /// Initial contructor
  MagicState.initial()
      : magicData = [],
        cardSelected = null,
        countPage = 1,
        stateData = const ComState.idle();

  /// Main constructor
  MagicState({
    this.magicData = const [],
    this.cardSelected,
    this.countPage = 1,
    this.stateData = const ComState.idle(),
  });

  /// Copy with function
  MagicState copyWith({
    List<MagicCard>? magicData,
    MagicCard? cardSelected,
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

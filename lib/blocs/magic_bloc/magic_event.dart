part of 'magic_bloc.dart';

abstract class MagicEvent {}

/// Event to load and update magic cards data
class MagicLoadData extends MagicEvent {}

/// Event to charge the card selected data
class SelectCard extends MagicEvent {
  /// Card selected when tap
  final Card card;

  /// Main constructor
  SelectCard({required this.card});
}

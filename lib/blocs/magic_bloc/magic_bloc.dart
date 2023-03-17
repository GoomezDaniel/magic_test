import 'package:bloc/bloc.dart';
import 'package:magic_test/models/card_model.dart';
import 'package:magic_test/providers/cards_data_provider.dart';

part 'magic_event.dart';
part 'magic_state.dart';

class MagicBloc extends Bloc<MagicEvent, MagicState> {
  MagicBloc() : super(MagicState.initial()) {
    on<MagicLoadData>((event, emit) async {
      /// Petition provider
      final provider = MagicProvider();

      /// Get the petition provider data
      final data = await provider.loadCardData(state.countPage);

      /// Update the bloc state data
      emit(state.copyWith(
        magicData: state.magicData..addAll(data.cards),
        countPage: state.countPage + 1,
      ));
    });

    on<SelectCard>((event, emit) {
      /// Update the bloc state data
      emit(state.copyWith(cardSelected: event.card));
    });
  }
}

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:magic_test/models/card_model.dart';
import 'package:magic_test/models/magic_data_model.dart';
import 'package:magic_test/providers/cards_data_provider.dart';
import 'package:magic_test/providers/com_state.dart';

part 'magic_event.dart';
part 'magic_state.dart';

class MagicBloc extends Bloc<MagicEvent, MagicState> {
  MagicBloc() : super(MagicState.initial()) {
    on<MagicLoadData>((event, emit) async {
      try {
        emit(state.copyWith(stateData: ComState.loading()));

        /// The limit of pages
        if (state.countPage <= 787) {
          /// Petition provider
          final provider = MagicProvider();

          /// Get the petition provider data
          final response = await provider.loadCardData(state.countPage);

          /// Prse the data
          final data = MagicDataModel.fromJson(jsonDecode(response.body));

          /// Update the bloc state data
          emit(state.copyWith(
            magicData: state.magicData..addAll(data.cards),
            countPage: state.countPage + 1,
            stateData: ComState.endSuccess(),
          ));
        }
      } catch (e, s) {
        emit(state.copyWith(stateData: ComState.unknownError(e, s)));
      }
    });

    on<SelectCard>((event, emit) {
      /// Update the bloc state data
      emit(state.copyWith(cardSelected: event.card));
    });
  }
}

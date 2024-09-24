import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kdigital_test/src/features/character/domain/enitity/character_result_entity.dart';
import 'package:kdigital_test/src/features/character/domain/repository/i_characters_repository.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  final ICharactersRepository _charactersRepository;

  MainPageBloc(super.initialState, this._charactersRepository) {
    on<GetTestDataOnMainPageEvent>(
      (event, emitter) => _getDataOnMainPageCasino(event, emitter),
    );
    on<DataLoadedOnMainPageEvent>(
      (event, emitter) => _dataLoadedOnMainPageCasino(event, emitter),
    );
    on<LoadingDataOnMainPageEvent>(
      (event, emitter) => emitter(LoadingMainPageState()),
    );
  }

  Future<void> _getDataOnMainPageCasino(
      GetTestDataOnMainPageEvent event, Emitter<MainPageState> emit) async {
    _charactersRepository.getAllCharacters(event.page).then((characters) {
      add(DataLoadedOnMainPageEvent(characters));
    });
  }

  Future<void> _dataLoadedOnMainPageCasino(
    DataLoadedOnMainPageEvent event,
    Emitter<MainPageState> emit,
  ) async {
    if (event.characters.characters.isNotEmpty) {
      emit(SuccessfulMainPageState(event.characters));
    } else {
      emit(UnSuccessfulMainPageState());
    }
  }
}

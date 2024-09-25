import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kdigital_test/src/features/character/domain/enitity/character_result_entity.dart';
import 'package:kdigital_test/src/features/character/domain/repository/i_characters_repository.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  final ICharactersRepository _charactersRepository;

  late int currentPage;
  late int maxPage;

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
    on<NextPageEvent>((event, emit) => _nextPage(event, emit));
    on<PrevPageEvent>((event, emit) => _prevPage(event, emit));
    on<RefreshPageEvent>((event, emit) => _refreshPage(event, emit));
  }

  Future<void> _getDataOnMainPageCasino(
    GetTestDataOnMainPageEvent event,
    Emitter<MainPageState> emit,
  ) async {
    emit(LoadingMainPageState());
    currentPage = event.page;
    CharacterResultEntity characters =
        await _charactersRepository.getAllCharacters(event.page);
    add(DataLoadedOnMainPageEvent(characters));
  }

  _refreshPage(RefreshPageEvent event, Emitter<MainPageState> emit) async {
    CharacterResultEntity characters =
        await _charactersRepository.getAllCharacters(currentPage);
    add(DataLoadedOnMainPageEvent(characters));
  }

  Future<void> _dataLoadedOnMainPageCasino(
    DataLoadedOnMainPageEvent event,
    Emitter<MainPageState> emit,
  ) async {
    if (event.characters.characters.isNotEmpty) {
      maxPage = event.characters.info.pages;
      emit(SuccessfulMainPageState(event.characters));
    } else {
      emit(UnSuccessfulMainPageState());
    }
  }

  _nextPage(NextPageEvent event, Emitter<MainPageState> emit) async {
    if (currentPage >= maxPage) return;
    CharacterResultEntity characters =
        await _charactersRepository.getAllCharacters(++currentPage);
    add(DataLoadedOnMainPageEvent(characters));
  }

  _prevPage(PrevPageEvent event, Emitter<MainPageState> emit) async {
    if (currentPage <= 1) return;
    CharacterResultEntity characters =
        await _charactersRepository.getAllCharacters(--currentPage);
    add(DataLoadedOnMainPageEvent(characters));
  }
}

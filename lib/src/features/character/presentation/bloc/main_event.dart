part of 'main_bloc.dart';

abstract class MainPageEvent {
  const MainPageEvent();
}

class GetTestDataOnMainPageEvent extends MainPageEvent {
  final int page;

  const GetTestDataOnMainPageEvent(this.page);
}

class LoadingDataOnMainPageEvent extends MainPageEvent {
  const LoadingDataOnMainPageEvent();
}

class DataLoadedOnMainPageEvent extends MainPageEvent {
  final List<CharacterEntity> characters;

  const DataLoadedOnMainPageEvent(this.characters);
}

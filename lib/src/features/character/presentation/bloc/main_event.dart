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
  final CharacterResultEntity characters;

  const DataLoadedOnMainPageEvent(this.characters);
}

class NextPageEvent extends MainPageEvent {}

class PrevPageEvent extends MainPageEvent {}

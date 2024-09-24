part of 'main_bloc.dart';

abstract class MainPageState {}

class InitialMainPageState extends MainPageState {}

class LoadingMainPageState extends MainPageState {}

class UnSuccessfulMainPageState extends MainPageState {}

class SuccessfulMainPageState extends MainPageState {
  final List<CharacterEntity> characters;

  SuccessfulMainPageState(this.characters);
}

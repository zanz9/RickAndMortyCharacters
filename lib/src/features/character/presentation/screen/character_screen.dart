import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kdigital_test/src/core/di/di_init.dart';
import 'package:kdigital_test/src/features/character/domain/enitity/character_result_entity.dart';
import 'package:kdigital_test/src/features/character/domain/repository/i_characters_repository.dart';
import 'package:kdigital_test/src/features/character/presentation/bloc/main_bloc.dart';
import 'package:kdigital_test/src/features/character/presentation/widgets/character_widget.dart';
import 'package:kdigital_test/src/features/character/presentation/widgets/loader.dart';

part '../widgets/bottom_nav_widget.dart';
part '../widgets/main_widget.dart';

@immutable
class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainPageBloc(
        InitialMainPageState(),
        getIt<ICharactersRepository>(),
      )..add(const GetTestDataOnMainPageEvent(1)),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: const Text('Rick and Morty Characters'),
        ),
        body: const MainWidget(),
        bottomNavigationBar: const BottomNavWidget(),
      ),
    );
  }
}

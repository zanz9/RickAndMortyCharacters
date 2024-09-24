import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kdigital_test/src/core/di/di_init.dart';
import 'package:kdigital_test/src/features/character/domain/repository/i_characters_repository.dart';
import 'package:kdigital_test/src/features/character/presentation/bloc/main_bloc.dart';
import 'package:kdigital_test/src/features/character/presentation/widgets/character_widget.dart';
import 'package:kdigital_test/src/features/character/presentation/widgets/loader.dart';

@immutable
class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => MainPageBloc(
          InitialMainPageState(),
          getIt<ICharactersRepository>(),
        )..add(const GetTestDataOnMainPageEvent(1)),
        child: BlocConsumer<MainPageBloc, MainPageState>(
          listener: (context, state) {},
          builder: (blocContext, state) {
            if (state is LoadingMainPageState) {
              return const Loader();
            } else if (state is SuccessfulMainPageState) {
              final result = state.characters;
              return ListView.builder(
                cacheExtent: double.infinity,
                itemCount: result.characters.length,
                itemBuilder: (context, index) {
                  return CharacterWidget(
                    character: result.characters[index],
                  );
                },
              );
            } else {
              return const Center(
                child: Text("Что-то пошло не так..."),
              );
            }
          },
        ),
      ),
    );
  }
}

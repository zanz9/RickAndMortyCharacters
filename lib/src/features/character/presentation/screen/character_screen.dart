import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kdigital_test/src/core/di/di_init.dart';
import 'package:kdigital_test/src/features/character/domain/enitity/character_entity.dart';
import 'package:kdigital_test/src/features/character/domain/repository/i_characters_repository.dart';
import 'package:kdigital_test/src/features/character/presentation/bloc/main_bloc.dart';

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
              return _loadingWidget(context);
            } else if (state is SuccessfulMainPageState) {
              return _successfulWidget(context, state);
            } else {
              return const Center(child: Text("error"));
            }
          },
        ),
      ),
    );
  }

  Widget _loadingWidget(BuildContext context) {
    return Center(
      child: Container(
        width: 50,
        height: 50,
        margin: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: const CircularProgressIndicator(),
      ),
    );
  }

  Widget _successfulWidget(
      BuildContext context, SuccessfulMainPageState state) {
    return ListView.builder(
      cacheExtent: double.infinity,
      itemCount: state.characters.length,
      itemBuilder: (context, index) {
        return CharacterWidget(
          character: state.characters[index],
        );
      },
    );
  }
}

class CharacterWidget extends StatelessWidget {
  const CharacterWidget({
    super.key,
    required this.character,
  });
  final CharacterEntity character;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.all(8),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: ShapeDecoration(
          color: const Color.fromARGB(120, 204, 255, 255),
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(character.name),
            ),
            Image.network(
              character.image,
              width: 50,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kdigital_test/src/core/di/di_init.dart';
import 'package:kdigital_test/src/features/character/domain/enitity/character_result_entity.dart';
import 'package:kdigital_test/src/features/character/domain/repository/i_characters_repository.dart';
import 'package:kdigital_test/src/features/character/presentation/bloc/main_bloc.dart';
import 'package:kdigital_test/src/features/character/presentation/widgets/character_widget.dart';
import 'package:kdigital_test/src/features/character/presentation/widgets/loader.dart';

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
        bottomNavigationBar: Builder(builder: (context) {
          return Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    context.read<MainPageBloc>().add(PrevPageEvent());
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                IconButton(
                  onPressed: () {
                    context.read<MainPageBloc>().add(NextPageEvent());
                  },
                  icon: const Icon(Icons.arrow_forward),
                ),
              ],
            ),
          );
        }),
        body: BlocConsumer<MainPageBloc, MainPageState>(
          listener: (context, state) {},
          builder: (blocContext, state) {
            if (state is LoadingMainPageState) {
              return const Loader();
            } else if (state is SuccessfulMainPageState) {
              final CharacterResultEntity result = state.characters;
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Что-то пошло не так...",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Проверьте подключение к интернету",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

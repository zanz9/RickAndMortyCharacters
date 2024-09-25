part of '../screen/character_screen.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    refreshPage() async {
      context.read<MainPageBloc>().add(RefreshPageEvent());
    }

    return RefreshIndicator(
      onRefresh: refreshPage,
      child: BlocConsumer<MainPageBloc, MainPageState>(
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
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Что-то пошло не так...",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Проверьте подключение к интернету",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: refreshPage,
                    child: const Text('Обновить страницу'),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

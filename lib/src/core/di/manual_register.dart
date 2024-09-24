import 'package:kdigital_test/src/core/di/di_init.dart';
import 'package:kdigital_test/src/features/character/data/repository/characters_repository_impl.dart';
import 'package:kdigital_test/src/features/character/domain/repository/i_characters_repository.dart';

void manualRegister() {
  getIt.registerLazySingleton<ICharactersRepository>(
    () => CharactersRepositoryImpl(),
  );
}

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:kdigital_test/src/core/di/manual_register.dart';

import 'di_init.config.dart';

GetIt getIt = GetIt.instance;

@InjectableInit(preferRelativeImports: false)
Future<void> configureDependencies() async {
  getIt.init();
  manualRegister();
}

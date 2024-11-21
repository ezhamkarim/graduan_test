import 'package:get_it/get_it.dart';
import 'package:graduan_test/src/service/service.dart';

final getIt = GetIt.instance;

void setup() {
  // Register AuthService as a lazy singleton
  getIt.registerLazySingleton<AuthService>(AuthService.new);
}

T getService<T extends Object>() {
  return getIt.get<T>();
}
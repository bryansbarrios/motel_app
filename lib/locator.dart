import 'package:get_it/get_it.dart';

import 'package:motel_app/core/viewmodels/viewmodels.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => MotelViewModel());
  locator.registerLazySingleton(() => FavoriteViewModel());
  locator.registerLazySingleton(() => UserViewModel());
  locator.registerLazySingleton(() => MotelTypeViewModel());
  locator.registerLazySingleton(() => RatingViewModel());
}
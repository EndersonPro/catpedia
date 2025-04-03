import 'package:catpedia/core/config/environment.dart';
import 'package:catpedia/data/adapters/logger.dart';
import 'package:catpedia/data/datasource/api/the_cat_api.dart';
import 'package:catpedia/data/repositories/the_cat_repository.dart';
import 'package:catpedia/domain/domain.dart';
import 'package:get_it/get_it.dart';

import 'data.dart';

final getIt = GetIt.instance;

void initializeDependencies() {
  getIt.registerSingleton<EnvironmentConfigInterface>(EnvironmentAppConfig());
  getIt.registerLazySingleton<LoggerInterface>(() => LoggerImpl());

  getIt.registerLazySingleton<HttpClientInterface>(
    () =>
        HttpClientImpl(environmentConfig: getIt<EnvironmentConfigInterface>()),
  );

  getIt.registerLazySingleton<TheCatApiInterface>(
    () => TheCatApiImpl(httpClient: getIt<HttpClientInterface>()),
  );

  getIt.registerLazySingleton<TheCatRepositoryInterface>(
    () => TheCatRepositoryImpl(
      api: getIt<TheCatApiInterface>(),
      logger: getIt<LoggerInterface>(),
    ),
  );
}

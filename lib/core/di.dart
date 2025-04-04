import 'package:catpedia/core/config/environment.dart';
import 'package:catpedia/domain/domain.dart';
import 'package:catpedia/infrastructure/infrastructure.dart';
import 'package:catpedia/presentation/home/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initializeDependencies() {
  getIt.registerSingleton<EnvironmentConfigInterface>(EnvironmentAppConfig());
  getIt.registerLazySingleton<LoggerInterface>(() => LoggerImpl());
  getIt.registerLazySingleton<HttpClientInterface>(
    () =>
        HttpClientImpl(environmentConfig: getIt<EnvironmentConfigInterface>()),
  );
  getIt.registerLazySingleton<TheCatApi>(
    () => TheCatApi(httpClient: getIt<HttpClientInterface>()),
  );
  getIt.registerLazySingleton<GetCatBreedsUseCase>(
    () => GetCatBreedsUseCase(breedPerform: getIt<TheCatApi>()),
  );
  getIt.registerLazySingleton<SearchCatBreedUseCase>(
    () => SearchCatBreedUseCase(breedPerform: getIt<TheCatApi>()),
  );

  getIt.registerSingleton<HomeBloc>(
    HomeBloc(
      getCatBreedsUseCase: getIt<GetCatBreedsUseCase>(),
      searchCatBreedUseCase: getIt<SearchCatBreedUseCase>(),
    )..fetchBreeds(),
  );
}

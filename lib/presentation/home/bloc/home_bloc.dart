import 'package:catpedia/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCatBreedsUseCase getCatBreedsUseCase;
  final SearchCatBreedUseCase searchCatBreedUseCase;

  HomeBloc({
    required this.getCatBreedsUseCase,
    required this.searchCatBreedUseCase,
  }) : super(
         HomeState(
           breeds: const [],
           hasError: false,
           isLoading: false,
           hasMorePage: true,
           page: 0,
           limit: 10,
         ),
       ) {
    on<FetchBreedsEvent>(_initialBreeds);
    on<LoadMoreEvent>(_loadMoreBreeds);
    on<SearchingEvent>(_searchBreeds);
    on<ClearSearchEvent>(_clearSearch);
  }

  Future<void> _searchBreeds(
    SearchingEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      debugPrint("SearchingEvent Called");
      final searchText = event.searchText;
      if (searchText.isEmpty) {
        return;
      }
      emit(state.copyWith(isLoading: true, hasError: false));
      final breeds = await searchCatBreedUseCase(searchText);
      emit(
        state.copyWith(
          isLoading: false,
          hasError: false,
          hasMorePage: true,
          breeds: breeds,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(isLoading: false, hasError: true, hasMorePage: false),
      );
    }
  }

  Future<void> _loadMoreBreeds(
    LoadMoreEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      debugPrint("LoadMoreEvent Called");
      if (state.hasMorePage) {
        final limit = state.limit;
        final page = state.page + 1;
        // emit(state.copyWith(isLoading: true, hasError: false));
        final breeds = await getCatBreedsUseCase(limit: limit, page: page);

        final hasMorePage = breeds.length == limit;

        emit(
          state.copyWith(
            hasMorePage: hasMorePage,
            limit: limit,
            page: page,
            breeds: [...state.breeds, ...breeds],
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(hasError: true, hasMorePage: false));
    }
  }

  Future<void> _initialBreeds(HomeEvent event, Emitter<HomeState> emit) async {
    try {
      debugPrint("FetchBreedsEvent Called");
      emit(state.copyWith(isLoading: true, hasError: false));
      final breeds = await getCatBreedsUseCase();
      emit(
        state.copyWith(
          isLoading: false,
          hasError: false,
          hasMorePage: true,
          breeds: breeds,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(isLoading: false, hasError: true, hasMorePage: false),
      );
    }
  }

  Future<void> _clearSearch(
    ClearSearchEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      debugPrint("ClearSearchEvent Called");
      emit(state.copyWith(isLoading: true, hasError: false));
      final breeds = await getCatBreedsUseCase();
      emit(
        state.copyWith(
          isLoading: false,
          hasError: false,
          hasMorePage: true,
          breeds: breeds,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(isLoading: false, hasError: true, hasMorePage: false),
      );
    }
  }

  Future<void> searchBreeds({required String searchText}) async {
    add(SearchingEvent(searchText: searchText));
  }

  void fetchBreeds() {
    add(FetchBreedsEvent(page: 0, limit: 10));
  }
}

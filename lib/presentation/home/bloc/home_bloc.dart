import 'package:bloc/bloc.dart';
import 'package:catpedia/domain/entities/breed.dart';
import 'package:catpedia/domain/repositories/the_cat_repository.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TheCatRepositoryInterface _theCatRepository;

  HomeBloc({required TheCatRepositoryInterface theCatRepository})
    : _theCatRepository = theCatRepository,
      super(
        HomeState(
          breeds: const [],
          hasError: false,
          isLoading: false,
          hasMorePage: true,
          page: 0,
          limit: 10,
        ),
      ) {
    on<HomeEvent>((event, emit) {
      debugPrint("Called");
    });
    on<FetchBreedsEvent>(_initialBreeds);
    on<LoadMoreEvent>(_loadMoreBreeds);
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
        final breeds = await _theCatRepository.getBreeds(
          limit: limit,
          page: page,
        );

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
      final breeds = await _theCatRepository.getBreeds();
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

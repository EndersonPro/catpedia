part of 'home_bloc.dart';

@immutable
class HomeState {
  const HomeState({
    required this.isLoading,
    required this.hasError,
    required this.hasMorePage,
    required this.breeds,
    required this.page,
    required this.limit,
  });

  final List<Breed> breeds;
  final bool isLoading;
  final bool hasError;
  final bool hasMorePage;
  final int page;
  final int limit;

  HomeState copyWith({
    List<Breed>? breeds,
    bool? isLoading,
    bool? hasError,
    bool? hasMorePage,
    int? page,
    int? limit,
  }) {
    return HomeState(
      breeds: breeds ?? this.breeds,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      hasMorePage: hasMorePage ?? this.hasMorePage,
      page: page ?? this.page,
      limit: limit ?? this.limit,
    );
  }
}

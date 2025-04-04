part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {
  const HomeEvent();
}

class SearchingEvent extends HomeEvent {
  final String searchText;
  const SearchingEvent({required this.searchText});
}

class LoadingEvent extends HomeEvent {
  const LoadingEvent();
}

class FetchBreedsEvent extends HomeEvent {
  const FetchBreedsEvent({required this.page, required this.limit});
  final int page;
  final int limit;
}

class LoadedEvent extends HomeEvent {
  final List<Breed> cats;
  const LoadedEvent({required this.cats});
}

class ErrorEvent extends HomeEvent {
  final String error;
  const ErrorEvent({required this.error});
}

class LoadMoreEvent extends HomeEvent {
  const LoadMoreEvent();
}

part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {
  const HomeEvent();
}

class SearchingEvent extends HomeEvent {
  final String searchText;
  const SearchingEvent({required this.searchText});
}

class FetchBreedsEvent extends HomeEvent {
  const FetchBreedsEvent({required this.page, required this.limit});
  final int page;
  final int limit;
}

class LoadMoreEvent extends HomeEvent {
  const LoadMoreEvent();
}

class ClearSearchEvent extends HomeEvent {
  const ClearSearchEvent();
}

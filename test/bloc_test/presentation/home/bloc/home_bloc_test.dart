import 'package:bloc_test/bloc_test.dart';
import 'package:catpedia/presentation/home/bloc/home_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}

final mockHomeBloc = MockHomeBloc();

void main() {
  group('HomeBloc test', () {
    blocTest(
      'emits [] when nothing is added',
      build: () => MockHomeBloc(),
      expect: () => [],
    );

    blocTest(
      'emits [loading: true, breeds: []] when SearchingEvent is added',
      build: () => MockHomeBloc(),
      act:
          (bloc) => bloc.add(
            SearchingEvent(searchText: 'busquedaextrañaquenoexiste'),
          ),
      expect: () => <HomeState>[],
    );

    blocTest(
      'emits [loading: false, breeds: [Breed]] when SearchingEvent is added',
      build: () => MockHomeBloc(),
      act: (bloc) => bloc.add(SearchingEvent(searchText: 'abys')),
      skip: 1,
      expect: () => <HomeState>[],
    );
  });
}

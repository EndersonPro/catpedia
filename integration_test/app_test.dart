import 'package:catpedia/main.dart' as app;
import 'package:catpedia/presentation/details/widgets_keys/details_page_keys.dart';
import 'package:catpedia/presentation/home/widget_keys/home_keys.dart';
import 'package:catpedia/presentation/presentation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('Search abys cat breed and view details', (tester) async {
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 4));

      expect(find.byType(HomePage), findsOneWidget);

      // Find the search field and enter "abys"
      final searchField = find.byKey(HomePageKeys.searchInput);
      await tester.enterText(searchField, 'abys');
      await tester.tap(find.byKey(HomePageKeys.findSearchInput));
      await tester.pumpAndSettle();

      // Verify that the search results are displayed
      expect(find.byKey(HomePageKeys.resultListView), findsOneWidget);
      expect(find.text('Abyssinian'), findsOneWidget);

      // Verify that the cat breed details are displayed
      await tester.tap(find.text('Abyssinian'));
      await tester.pumpAndSettle();
      expect(find.byType(CatBreedDetail), findsOneWidget);
      expect(find.byKey(DetailsPageWidgetKeys.image), findsOneWidget);
      expect(find.byKey(DetailsPageWidgetKeys.breed), findsOneWidget);
      expect(find.byKey(DetailsPageWidgetKeys.description), findsOneWidget);
      expect(find.byKey(DetailsPageWidgetKeys.intelligence), findsOneWidget);
    });
  });
}

import 'package:bgsearch/2_application/filters/filters.dart';
import 'package:bgsearch/2_application/filters/library/filter_int_ranges.dart';
import 'package:bgsearch/2_application/filters/library/filter_types.dart';
import 'package:bgsearch/2_application/state_manager.dart';
import 'package:bgsearch/3_presentation/pages/search/game_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

class MockStateManager extends Mock implements StateManager {}
class MockIsar extends Mock implements Isar {}

void main() {
  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows you to build and interact
  // with widgets in the test environment.
  testWidgets('Search Page displays and deletes filters', (tester) async {

    final mockIsar = MockIsar();
    final stateManager = StateManager(mockIsar);

    // initial filter elements
    stateManager.setSearchFilters([
      FilterString(filterType:  FilterEnum.nameContains),
      FilterInt(FilterEnum.age, OptionIntRange.age, 3, 10),
      FilterString(filterType:  FilterEnum.descriptionContains),
      FilterInt(FilterEnum.maxPlayers, OptionIntRange.maxPlayers, 2, 5),
    ]);



    await tester.pumpWidget(ChangeNotifierProvider<StateManager>(
        create: (context) => stateManager,
        child: const MaterialApp(home: GameSearch())),
    );

    // test initial filter element widgets are present
    expect(find.byType(RangeSlider), findsNWidgets(2));
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.text('Age'), findsOneWidget);
    expect(find.text('Name contains'), findsOneWidget);
    expect(find.text('Description contains'), findsOneWidget);
    expect(find.text('Max. Player Count'), findsOneWidget);
    expect(find.text('Playtime'), findsNothing);
    expect(find.text('Release Year'), findsNothing);

    // delete first filter (name)
    await tester.tap(find.byIcon(Icons.delete).first);
    await tester.pumpAndSettle();

    expect(find.byType(RangeSlider), findsNWidgets(2));
    expect(find.byType(TextFormField), findsNWidgets(1));
    expect(find.text('Age'), findsOneWidget);
    expect(find.text('Name contains'), findsNothing);
    expect(find.text('Description contains'), findsOneWidget);
    expect(find.text('Max. Player Count'), findsOneWidget);
    expect(find.text('Playtime'), findsNothing);
    expect(find.text('Release Year'), findsNothing);

    // delete second filter (age)
    await tester.tap(find.byIcon(Icons.delete).first);
    await tester.pumpAndSettle();

    expect(find.byType(RangeSlider), findsNWidgets(1));
    expect(find.byType(TextFormField), findsNWidgets(1));
    expect(find.text('Age'), findsNothing);
    expect(find.text('Name contains'), findsNothing);
    expect(find.text('Description contains'), findsOneWidget);
    expect(find.text('Max. Player Count'), findsOneWidget);
    expect(find.text('Playtime'), findsNothing);
    expect(find.text('Release Year'), findsNothing);

    // add new filter (Release Year)
    await tester.tap(find.byIcon(Icons.add).first);
    await tester.pumpAndSettle();

    expect(find.text('Select an Option'), findsOneWidget);

    await tester.tap(find.text("Release Year"));
    await tester.pumpAndSettle();

    expect(find.byType(RangeSlider), findsNWidgets(2));
    expect(find.byType(TextFormField), findsNWidgets(1));
    expect(find.text('Age'), findsNothing);
    expect(find.text('Name contains'), findsNothing);
    expect(find.text('Description contains'), findsOneWidget);
    expect(find.text('Max. Player Count'), findsOneWidget);
    expect(find.text('Playtime'), findsNothing);
    expect(find.text('Release Year'), findsOneWidget);


  });
}
import 'package:bgsearch/2_application/state_manager.dart';
import 'package:bgsearch/3_presentation/pages/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

class MockStateManager extends Mock implements StateManager {}

class MockIsar extends Mock implements Isar {}

void main() {
  testWidgets('Toggle selects correct theme mode ', (tester) async {
    final mockIsar = MockIsar();
    final stateManager = StateManager(mockIsar);

    stateManager.themeMode = ExtendedThemeMode.light;

    await tester.pumpWidget(
      ChangeNotifierProvider<StateManager>(
          create: (context) => stateManager,
          child: const MaterialApp(home: Settings())),
    );

    ToggleButtons buttonToggle = tester.widget(find.byType(ToggleButtons));

    expect(buttonToggle.isSelected, ExtendedThemeMode.light.themeModeToggle);
  });
}

import 'package:bgsearchapp/1_domain/favourite_list.dart';
import 'package:bgsearchapp/2_application/state_manager.dart';
import 'package:bgsearchapp/3_presentation/pages/settings/theme/global_theme_data.dart';
import 'package:bgsearchapp/3_presentation/home.dart';
import 'package:bgsearchapp/3_presentation/pages/settings/settings.dart';
import 'package:bgsearchapp/3_presentation/pages/settings/theme/util.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '1_domain/filter_set.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isar = await initializeDatabase();

  runApp(ChangeNotifierProvider(
    create: (BuildContext context) {
      return StateManager(isar);
    },
    child: Consumer<StateManager>(
      builder: (BuildContext context, StateManager sm, Widget? child) {
        TextTheme textTheme = createTextTheme(context, "ABeeZee", "ABeeZee");

        final theme = GlobalThemeData(textTheme);
        ExtendedThemeMode extThemeMode = context.watch<StateManager>().themeMode;

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'BoardGame Search',
          themeMode: extThemeMode.themeMode,
          theme:theme.light(),
          darkTheme: theme.dark(),
          home: Home(),
        );
      },
    ),
  ));
}

Future<Isar> initializeDatabase() async {
  final dir = await getApplicationDocumentsDirectory();
  return await Isar.open(
    [FavouriteListDBSchema, FilterSetSchema],
    directory: dir.path,
  );
}

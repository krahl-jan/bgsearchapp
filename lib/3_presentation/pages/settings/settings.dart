import 'package:bgsearchapp/1_domain/filter_set.dart';
import 'package:bgsearchapp/2_application/state_manager.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<StatefulWidget> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    Isar isar = context.read<StateManager>().isar;
    final ExtendedThemeMode extThemeMode =
        context.watch<StateManager>().themeMode;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                'Select theme',
              ),
              const SizedBox(height: 5),
              ToggleButtons(
                direction: Axis.horizontal,
                onPressed: (int index) =>
                    context.read<StateManager>().setThemeModeToggle(index),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                constraints: const BoxConstraints(
                  minHeight: 40.0,
                  minWidth: 80.0,
                ),
                isSelected: extThemeMode.themeModeToggle,
                children: extThemeMode.getIcons(),
              ),
              const SizedBox(height: 20),
              const Text(
                'Delete saved data',
              ),
              const SizedBox(height: 5),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                      const Color.fromRGBO(143, 6, 6, 0.95),
                    )),
                    onPressed: () => isar
                        .writeTxn(() => isar.filterSets.clear())
                        .whenComplete(() => ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              behavior: SnackBarBehavior.floating,
                              content: Center(child: Text("saved filters deleted")),
                              duration: Duration(milliseconds: 500),
                              width: 200,
                            ))),
                    child: const Text(
                      "Delete all Filters",
                      style: TextStyle(color: Colors.white),
                    )),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        const Color.fromRGBO(143, 6, 6, 0.95),
                      ),
                    ),
                    onPressed: () => context.read<StateManager>().clearFavourites()
                        .whenComplete(() => ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: Center(child: Text("favourites deleted")),
                      duration: Duration(milliseconds: 500),
                      width: 200,
                    ))),
                    child: const Text(
                      "Delete all Favourites",
                      style: TextStyle(color: Colors.white),
                    )),
              ])
            ],
          ),
        ),
      ),
    );
  }
}

enum ExtendedThemeMode {
  light(ThemeMode.light, 0, [true, false, false],
      Icon(Icons.light_mode_outlined), Icon(Icons.light_mode)),
  dark(ThemeMode.dark, 1, [false, true, false], Icon(Icons.dark_mode_outlined),
      Icon(Icons.dark_mode)),
  system(ThemeMode.system, 2, [false, false, true],
      Icon(Icons.settings_outlined), Icon(Icons.settings));

  const ExtendedThemeMode(this.themeMode, this.widgetIndex,
      this.themeModeToggle, this.themeModeWidget, this.themeModeWidgetSelected);

  ExtendedThemeMode getFromIndex(int index) {
    return switch (index) {
      1 => ExtendedThemeMode.dark,
      0 => ExtendedThemeMode.light,
      _ => ExtendedThemeMode.system,
    };
  }

  List<Widget> getIcons() {
    return ExtendedThemeMode.values
        .map((value) => value == this
            ? value.themeModeWidgetSelected
            : value.themeModeWidget)
        .toList();
  }

  final ThemeMode themeMode;
  final int widgetIndex;
  final List<bool> themeModeToggle;
  final Widget themeModeWidget;
  final Widget themeModeWidgetSelected;
}

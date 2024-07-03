import "package:flutter/material.dart";

class GlobalThemeData {
  final TextTheme textTheme;

  const GlobalThemeData(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4287646527),
      surfaceTint: Color(4287646527),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4294957780),
      onPrimaryContainer: Color(4281993476),
      secondary: Color(4286010961),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4294957780),
      onSecondaryContainer: Color(4281079057),
      tertiary: Color(4285488174),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4294697126),
      onTertiaryContainer: Color(4280621568),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294965494),
      onSurface: Color(4280490264),
      onSurfaceVariant: Color(4283646784),
      outline: Color(4286935920),
      outlineVariant: Color(4292395710),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281937452),
      inversePrimary: Color(4294948007),
      primaryFixed: Color(4294957780),
      onPrimaryFixed: Color(4281993476),
      primaryFixedDim: Color(4294948007),
      onPrimaryFixedVariant: Color(4285740074),
      secondaryFixed: Color(4294957780),
      onSecondaryFixed: Color(4281079057),
      secondaryFixedDim: Color(4293377461),
      onSecondaryFixedVariant: Color(4284301114),
      tertiaryFixed: Color(4294697126),
      onTertiaryFixed: Color(4280621568),
      tertiaryFixedDim: Color(4292723852),
      onTertiaryFixedVariant: Color(4283843865),
      surfaceDim: Color(4293449427),
      surfaceBright: Color(4294965494),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963438),
      surfaceContainer: Color(4294765287),
      surfaceContainerHigh: Color(4294436065),
      surfaceContainerHighest: Color(4294041563),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4285411366),
      surfaceTint: Color(4287646527),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4289355859),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4284037942),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4287589478),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4283580693),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4287066690),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965494),
      onSurface: Color(4280490264),
      onSurfaceVariant: Color(4283383613),
      outline: Color(4285291352),
      outlineVariant: Color(4287199091),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281937452),
      inversePrimary: Color(4294948007),
      primaryFixed: Color(4289355859),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4287449149),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4287589478),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4285879374),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4287066690),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4285356588),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4293449427),
      surfaceBright: Color(4294965494),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963438),
      surfaceContainer: Color(4294765287),
      surfaceContainerHigh: Color(4294436065),
      surfaceContainerHighest: Color(4294041563),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4282650633),
      surfaceTint: Color(4287646527),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4285411366),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281605143),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4284037942),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4281147392),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283580693),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965494),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4281213215),
      outline: Color(4283383613),
      outlineVariant: Color(4283383613),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281937452),
      inversePrimary: Color(4294961123),
      primaryFixed: Color(4285411366),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4283505426),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4284037942),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4282394145),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4283580693),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4281936642),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4293449427),
      surfaceBright: Color(4294965494),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963438),
      surfaceContainer: Color(4294765287),
      surfaceContainerHigh: Color(4294436065),
      surfaceContainerHighest: Color(4294041563),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294948007),
      surfaceTint: Color(4294948007),
      onPrimary: Color(4283833877),
      primaryContainer: Color(4285740074),
      onPrimaryContainer: Color(4294957780),
      secondary: Color(4293377461),
      onSecondary: Color(4282657061),
      secondaryContainer: Color(4284301114),
      onSecondaryContainer: Color(4294957780),
      tertiary: Color(4292723852),
      onTertiary: Color(4282199556),
      tertiaryContainer: Color(4283843865),
      onTertiaryContainer: Color(4294697126),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279898384),
      onSurface: Color(4294041563),
      onSurfaceVariant: Color(4292395710),
      outline: Color(4288711817),
      outlineVariant: Color(4283646784),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4294041563),
      inversePrimary: Color(4287646527),
      primaryFixed: Color(4294957780),
      onPrimaryFixed: Color(4281993476),
      primaryFixedDim: Color(4294948007),
      onPrimaryFixedVariant: Color(4285740074),
      secondaryFixed: Color(4294957780),
      onSecondaryFixed: Color(4281079057),
      secondaryFixedDim: Color(4293377461),
      onSecondaryFixedVariant: Color(4284301114),
      tertiaryFixed: Color(4294697126),
      onTertiaryFixed: Color(4280621568),
      tertiaryFixedDim: Color(4292723852),
      onTertiaryFixedVariant: Color(4283843865),
      surfaceDim: Color(4279898384),
      surfaceBright: Color(4282529589),
      surfaceContainerLowest: Color(4279503883),
      surfaceContainerLow: Color(4280490264),
      surfaceContainer: Color(4280753436),
      surfaceContainerHigh: Color(4281477158),
      surfaceContainerHighest: Color(4282200624),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294949550),
      surfaceTint: Color(4294948007),
      onPrimary: Color(4281533698),
      primaryContainer: Color(4291591021),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4293706170),
      onSecondary: Color(4280684556),
      secondaryContainer: Color(4289628289),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4293052560),
      onTertiary: Color(4280161536),
      tertiaryContainer: Color(4289039963),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279898384),
      onSurface: Color(4294965752),
      onSurfaceVariant: Color(4292658882),
      outline: Color(4289961627),
      outlineVariant: Color(4287790972),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4294041563),
      inversePrimary: Color(4285805867),
      primaryFixed: Color(4294957780),
      onPrimaryFixed: Color(4281074176),
      primaryFixedDim: Color(4294948007),
      onPrimaryFixedVariant: Color(4284359707),
      secondaryFixed: Color(4294957780),
      onSecondaryFixed: Color(4280290056),
      secondaryFixedDim: Color(4293377461),
      onSecondaryFixedVariant: Color(4283117354),
      tertiaryFixed: Color(4294697126),
      onTertiaryFixed: Color(4279767040),
      tertiaryFixedDim: Color(4292723852),
      onTertiaryFixedVariant: Color(4282659849),
      surfaceDim: Color(4279898384),
      surfaceBright: Color(4282529589),
      surfaceContainerLowest: Color(4279503883),
      surfaceContainerLow: Color(4280490264),
      surfaceContainer: Color(4280753436),
      surfaceContainerHigh: Color(4281477158),
      surfaceContainerHighest: Color(4282200624),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294965752),
      surfaceTint: Color(4294948007),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4294949550),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294965752),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4293706170),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294966006),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4293052560),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279898384),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294965752),
      outline: Color(4292658882),
      outlineVariant: Color(4292658882),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4294041563),
      inversePrimary: Color(4283308048),
      primaryFixed: Color(4294959323),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4294949550),
      onPrimaryFixedVariant: Color(4281533698),
      secondaryFixed: Color(4294959323),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4293706170),
      onSecondaryFixedVariant: Color(4280684556),
      tertiaryFixed: Color(4294960298),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4293052560),
      onTertiaryFixedVariant: Color(4280161536),
      surfaceDim: Color(4279898384),
      surfaceBright: Color(4282529589),
      surfaceContainerLowest: Color(4279503883),
      surfaceContainerLow: Color(4280490264),
      surfaceContainer: Color(4280753436),
      surfaceContainerHigh: Color(4281477158),
      surfaceContainerHighest: Color(4282200624),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}

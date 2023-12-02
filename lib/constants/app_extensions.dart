import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  bool get isDarkEnabled => theme.brightness == Brightness.dark;
  Color get primaryColor => colorScheme.primary;
  Color get scaffoldBackgroundColor => theme.scaffoldBackgroundColor;
  Brightness get iconBrightness =>
      isDarkEnabled ? Brightness.light : Brightness.dark;
  Color get onSurface => colorScheme.onSurface;
}

extension MaterialStateHelpers on Iterable<MaterialState> {
  bool get isHovered => contains(MaterialState.hovered);
  bool get isFocused => contains(MaterialState.focused);
  bool get isPressed => contains(MaterialState.pressed);
  bool get isDragged => contains(MaterialState.dragged);
  bool get isSelected => contains(MaterialState.selected);
  bool get isScrolledUnder => contains(MaterialState.scrolledUnder);
  bool get isDisabled => contains(MaterialState.disabled);
  bool get isError => contains(MaterialState.error);
}

extension IterableExtensions on Iterable {
  bool containsAny(Iterable<Object?> other) => other.any((e) => contains(e));
}

extension DurationExtension on int {
  Duration get ms => Duration(milliseconds: this);
  Duration get s => Duration(seconds: this);
  Duration get m => Duration(minutes: this);
  Duration get d => Duration(days: this);
}

extension TimeExtension on TimeOfDay {
  String customFormat(BuildContext context) {
    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);

    final String formattedTime = localizations.formatTimeOfDay(this);
    final String formattedHour = formattedTime.split(':')[0].padLeft(2, '0');
    final String formattedMinutes = formattedTime.split(':')[1];

    return '$formattedHour:$formattedMinutes';
  }
}

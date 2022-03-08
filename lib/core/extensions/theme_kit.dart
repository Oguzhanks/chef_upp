import 'package:flutter/material.dart';

extension ThemeKit on BuildContext {
  ThemeData get _theme => Theme.of(this);
  ThemeData get theme => _theme;

  TextStyle get headline1 => _theme.textTheme.headline1!;
  TextStyle get headline2 => _theme.textTheme.headline2!;
  TextStyle get headline3 => _theme.textTheme.headline3!;
  TextStyle get headline4 => _theme.textTheme.headline4!;
  TextStyle get headline5 => _theme.textTheme.headline5!;
  TextStyle get headline6 => _theme.textTheme.headline6!;
  TextStyle get subtitle1 => _theme.textTheme.subtitle1!;
  TextStyle get subtitle2 => _theme.textTheme.subtitle2!;
  TextStyle get button => _theme.textTheme.button!;
  TextStyle get bodyText1 => _theme.textTheme.bodyText1!;
  TextStyle get bodyText2 => _theme.textTheme.bodyText2!;
  TextStyle get caption => _theme.textTheme.caption!;
  TextStyle get overline => _theme.textTheme.overline!;
}

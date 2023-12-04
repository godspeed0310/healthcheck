import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kcPrimary = Color(0xFF10217D);
const Color kcPrimaryDark = Color(0xFF6673F0);
const Color kcSecondary = Color(0xFF1BA9B5);
const Color kcWhite = Color(0xFFFFFFFF);
const Color kcAltPrimary = Color(0xFF2F80ED);

ThemeData kThLight = FlexColorScheme.light(
  colors: FlexSchemeColor.from(primary: kcPrimary),
  fontFamily: GoogleFonts.inter().fontFamily,
  appBarStyle: FlexAppBarStyle.scaffoldBackground,
  useMaterial3: true,
  lightIsWhite: true,
).toTheme;
ThemeData kThDark = FlexColorScheme.dark(
  colors: FlexSchemeColor.from(primary: kcPrimaryDark),
  fontFamily: GoogleFonts.inter().fontFamily,
  appBarStyle: FlexAppBarStyle.scaffoldBackground,
  useMaterial3: true,
).toTheme;

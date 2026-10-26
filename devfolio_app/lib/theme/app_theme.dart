import 'package:flutter/material.dart';

/// Paleta e tema central do DevFolio.
/// Mantenha as cores aqui para facilitar ajustes em todo o aplicativo.
class AppTheme {
  AppTheme._();

  static const Color fundo = Color(0xFF0B1019);
  static const Color superficie = Color(0xFF161F2E);
  static const Color superficieElevada = Color(0xFF1C293B);
  static const Color borda = Color(0xFF304055);
  static const Color azul = Color(0xFF3E7DFF);
  static const Color azulClaro = Color(0xFF7AA6FF);
  static const Color verde = Color(0xFF44D7B6);
  static const Color texto = Color(0xFFF4F7FD);
  static const Color textoSecundario = Color(0xFFB1BED1);

  static ThemeData get temaEscuro {
    final esquema = ColorScheme.fromSeed(
      seedColor: azul,
      brightness: Brightness.dark,
    ).copyWith(
      primary: azul,
      onPrimary: Colors.white,
      surface: superficie,
      onSurface: texto,
      outline: borda,
      secondary: verde,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: esquema,
      scaffoldBackgroundColor: fundo,
      fontFamily: 'Roboto',
      appBarTheme: const AppBarTheme(
        backgroundColor: fundo,
        foregroundColor: texto,
        scrolledUnderElevation: 0,
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        color: superficie,
        elevation: 4,
        shadowColor: Colors.black.withValues(alpha: 0.24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: borda, width: 0.8),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: azul,
          foregroundColor: Colors.white,
          minimumSize: const Size(0, 48),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: texto,
          minimumSize: const Size(0, 48),
          side: const BorderSide(color: borda),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: superficieElevada,
        contentTextStyle: const TextStyle(color: texto),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: superficie,
        indicatorColor: azul.withValues(alpha: 0.20),
        labelTextStyle: WidgetStateProperty.all(
          const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.w800,
          color: texto,
          letterSpacing: -1.0,
        ),
        headlineMedium: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w800,
          color: texto,
          letterSpacing: -0.6,
        ),
        titleLarge: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w700,
          color: texto,
        ),
        bodyLarge: TextStyle(color: textoSecundario, height: 1.55),
        bodyMedium: TextStyle(color: textoSecundario, height: 1.5),
        labelLarge: TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}

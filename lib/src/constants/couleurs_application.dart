import 'package:flutter/material.dart';

/// Constantes des couleurs de l'application
/// Centralise toutes les couleurs utilisées dans l'interface
class CouleursApplication {
  CouleursApplication._(); // Constructeur privé pour empêcher l'instanciation

  /// Couleur primaire de l'application
  static const MaterialColor primaire = Colors.blue;

  /// Couleur secondaire de l'application
  static const MaterialColor secondaire = Colors.blueGrey;

  /// Couleurs de surface
  static const Color surfaceClaire = Color(0xFFFAFAFA);
  static const Color surfaceSombre = Color(0xFF121212);

  /// Couleurs de texte
  static const Color textePrimaire = Color(0xFF212121);
  static const Color texteSecondaire = Color(0xFF757575);
  static const Color texteSurSombre = Color(0xFFFFFFFF);

  /// Couleurs d'état
  static const Color succes = Color(0xFF4CAF50);
  static const Color erreur = Color(0xFFF44336);
  static const Color avertissement = Color(0xFFFF9800);
  static const Color information = Color(0xFF2196F3);

  /// Couleurs de bordure
  static const Color bordureClaire = Color(0xFFE0E0E0);
  static const Color bordureSombre = Color(0xFF424242);
} 
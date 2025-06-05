import 'package:flutter/material.dart';

/// Constantes des couleurs de l'application "Mon Jardin Idéal"
/// Palette élégante et luxueuse pour une expérience premium
class CouleursApplication {
  CouleursApplication._(); // Constructeur privé pour empêcher l'instanciation

  /// === COULEURS PRINCIPALES ===
  
  /// Vert profond chic - Couleur principale de l'application
  /// Utilisé pour : fond AppBar, fond Drawer, éléments principaux
  static const Color vertProfondChic = Color(0xFF1F3D2A);
  
  /// Or élégant - Couleur d'accent premium
  /// Utilisé pour : titres importants, icônes de navigation, highlights
  static const Color orElegant = Color(0xFFC9A64D);
  
  /// Vert olive - Couleur secondaire naturelle
  /// Utilisé pour : boutons, accents, éléments interactifs
  static const Color vertOlive = Color(0xFF8A9A5B);
  
  /// Crème beige luxe - Fond clair premium
  /// Utilisé pour : arrière-plans clairs, surfaces élégantes
  static const Color cremeBeigeLuxe = Color(0xFFF6F1EB);
  
  /// Blanc pur - Contraste maximum
  /// Utilisé pour : texte sur fond foncé, éléments de première importance
  static const Color blancPur = Color(0xFFFFFFFF);

  /// === COULEURS DÉRIVÉES POUR L'INTERFACE ===
  
  /// Couleur primaire MaterialColor pour le thème Flutter
  static const MaterialColor primaire = MaterialColor(
    0xFF1F3D2A,
    <int, Color>{
      50: Color(0xFFE8F0EA),
      100: Color(0xFFC5DACA),
      200: Color(0xFF9FC2A7),
      300: Color(0xFF79AA84),
      400: Color(0xFF5C976A),
      500: Color(0xFF1F3D2A), // Couleur principale
      600: Color(0xFF1B3726),
      700: Color(0xFF172F21),
      800: Color(0xFF13271C),
      900: Color(0xFF0B1912),
    },
  );

  /// === COULEURS DE SURFACE ===
  
  /// Surface principale claire
  static const Color surfaceClaire = cremeBeigeLuxe;
  
  /// Surface foncée élégante
  static const Color surfaceSombre = vertProfondChic;
  
  /// Surface d'accent doré
  static const Color surfaceAccent = Color(0xFFF5EFE1); // Crème plus doré

  /// === COULEURS DE TEXTE ===
  
  /// Texte principal sur fond clair
  static const Color textePrimaire = vertProfondChic;
  
  /// Texte secondaire avec contraste réduit
  static const Color texteSecondaire = Color(0xFF4A5D4F); // Vert profond plus clair
  
  /// Texte sur fond sombre
  static const Color texteSurSombre = blancPur;
  
  /// Texte accent doré
  static const Color texteAccent = orElegant;

  /// === COULEURS D'ÉTAT ===
  
  /// Succès - Vert naturel
  static const Color succes = Color(0xFF6B8E5A);
  
  /// Erreur - Rouge terre
  static const Color erreur = Color(0xFFB85450);
  
  /// Avertissement - Orange automnal
  static const Color avertissement = Color(0xFFD4954A);
  
  /// Information - Bleu-vert apaisant
  static const Color information = Color(0xFF5B8A8F);

  /// === COULEURS DE BORDURE ===
  
  /// Bordure claire subtile
  static const Color bordureClaire = Color(0xFFE5DDD4);
  
  /// Bordure foncée élégante
  static const Color bordureSombre = Color(0xFF3A5240);
  
  /// Bordure accent dorée
  static const Color bordureAccent = Color(0xFFDAC087);

  /// === COULEURS SPÉCIALES JARDIN ===
  
  /// Vert feuillage jeune
  static const Color vertFeuillage = Color(0xFF7BA05B);
  
  /// Vert mousse naturel
  static const Color vertMousse = Color(0xFF9CAF88);
  
  /// Terre riche
  static const Color terreRiche = Color(0xFF8B6F47);
  
  /// Fleur dorée
  static const Color fleurDoree = Color(0xFFE8C770);

  /// === DÉGRADÉS PRÉDÉFINIS ===
  
  /// Dégradé principal pour les en-têtes
  static const LinearGradient degradePrincipal = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      vertProfondChic,
      Color(0xFF2A4F35), // Vert profond plus clair
    ],
  );
  
  /// Dégradé doré pour les accents
  static const LinearGradient degradeDore = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      orElegant,
      Color(0xFFB8955A), // Or plus sombre
    ],
  );
  
  /// Dégradé naturel pour les fonds
  static const LinearGradient degradeNaturel = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      cremeBeigeLuxe,
      Color(0xFFEFE7DB), // Beige plus sombre
    ],
  );
} 
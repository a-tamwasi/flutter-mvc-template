import 'package:flutter/material.dart';
import 'couleurs_application.dart';

/// Constantes des styles de texte de l'application
/// Centralise tous les styles typographiques
class StylesTexte {
  StylesTexte._(); // Constructeur privé pour empêcher l'instanciation

  /// Famille de police par défaut
  static const String famillePolice = 'Roboto';

  /// Titres
  static const TextStyle titrePrincipal = TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.bold,
    color: CouleursApplication.textePrimaire,
    fontFamily: famillePolice,
  );

  static const TextStyle titreSecondaire = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w600,
    color: CouleursApplication.textePrimaire,
    fontFamily: famillePolice,
  );

  static const TextStyle sousTitre = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w500,
    color: CouleursApplication.textePrimaire,
    fontFamily: famillePolice,
  );

  /// Corps de texte
  static const TextStyle corpsTexte = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: CouleursApplication.textePrimaire,
    fontFamily: famillePolice,
  );

  static const TextStyle corpsTexteSecondaire = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: CouleursApplication.texteSecondaire,
    fontFamily: famillePolice,
  );

  /// Textes spéciaux
  static const TextStyle bouton = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: CouleursApplication.texteSurSombre,
    fontFamily: famillePolice,
  );

  static const TextStyle libelle = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    color: CouleursApplication.texteSecondaire,
    fontFamily: famillePolice,
  );

  static const TextStyle lien = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: CouleursApplication.primaire,
    decoration: TextDecoration.underline,
    fontFamily: famillePolice,
  );
} 
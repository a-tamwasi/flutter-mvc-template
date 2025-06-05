import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'couleurs_application.dart';

/// Constantes des styles de texte de l'application "Mon Jardin Idéal"
/// Typographie premium avec polices Playfair Display et Lora
class StylesTexte {
  StylesTexte._(); // Constructeur privé pour empêcher l'instanciation

  /// === TITRES PRINCIPAUX ===
  
  /// Titre principal - Pour les en-têtes d'écran et sections importantes
  static TextStyle get titrePrincipal => GoogleFonts.playfairDisplay(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: CouleursApplication.vertProfondChic,
    letterSpacing: 0.5,
    height: 1.2,
  );

  /// Titre principal doré - Pour les moments spéciaux et highlights
  static TextStyle get titrePrincipalDore => GoogleFonts.playfairDisplay(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: CouleursApplication.orElegant,
    letterSpacing: 0.5,
    height: 1.2,
  );

  /// Titre secondaire - Pour les sous-sections
  static TextStyle get titreSecondaire => GoogleFonts.playfairDisplay(
    fontSize: 26.0,
    fontWeight: FontWeight.w600,
    color: CouleursApplication.vertProfondChic,
    letterSpacing: 0.3,
    height: 1.3,
  );

  /// Sous-titre élégant - Avec accent doré
  static TextStyle get sousTitre => GoogleFonts.playfairDisplay(
    fontSize: 22.0,
    fontWeight: FontWeight.w500,
    color: CouleursApplication.texteAccent,
    letterSpacing: 0.2,
    height: 1.4,
  );

  /// === CORPS DE TEXTE ===
  
  /// Corps de texte principal - Lecture confortable
  static TextStyle get corpsTexte => GoogleFonts.lora(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: CouleursApplication.textePrimaire,
    height: 1.6, // Interligne optimal pour la lisibilité
    letterSpacing: 0.1,
  );

  /// Corps de texte secondaire - Information complémentaire
  static TextStyle get corpsTexteSecondaire => GoogleFonts.lora(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: CouleursApplication.texteSecondaire,
    height: 1.5,
    letterSpacing: 0.1,
  );

  /// === TEXTES SPÉCIAUX INTERFACE ===
  
  /// Style pour les boutons - Lisible et impactant
  static TextStyle get bouton => GoogleFonts.lora(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: CouleursApplication.texteSurSombre,
    letterSpacing: 0.8,
    height: 1.2,
  );

  /// Style pour les boutons avec accent vert olive
  static TextStyle get boutonAccent => GoogleFonts.lora(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: CouleursApplication.vertOlive,
    letterSpacing: 0.8,
    height: 1.2,
  );

  /// Libellé - Pour les champs et petites indications
  static TextStyle get libelle => GoogleFonts.lora(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    color: CouleursApplication.texteSecondaire,
    letterSpacing: 0.5,
    height: 1.3,
  );

  /// Libellé doré - Pour les éléments premium
  static TextStyle get libelleDore => GoogleFonts.lora(
    fontSize: 12.0,
    fontWeight: FontWeight.w600,
    color: CouleursApplication.orElegant,
    letterSpacing: 0.8,
    height: 1.3,
  );

  /// === TEXTES NAVIGATION ===
  
  /// Menu drawer - Élégant et doré
  static TextStyle get menuDrawer => GoogleFonts.lora(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: CouleursApplication.orElegant,
    letterSpacing: 0.3,
    height: 1.4,
  );

  /// Menu drawer sélectionné - Mis en évidence
  static TextStyle get menuDrawerSelectionne => GoogleFonts.lora(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: CouleursApplication.orElegant,
    letterSpacing: 0.3,
    height: 1.4,
  );

  /// AppBar titre - Élégant sur fond sombre
  static TextStyle get appBarTitre => GoogleFonts.playfairDisplay(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    color: CouleursApplication.texteSurSombre,
    letterSpacing: 0.3,
    height: 1.2,
  );

  /// === TEXTES SPÉCIALISÉS JARDIN ===
  
  /// Nom de plante - Style naturel avec Playfair Display
  static TextStyle get nomPlante => GoogleFonts.playfairDisplay(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    color: CouleursApplication.vertFeuillage,
    fontStyle: FontStyle.italic,
    letterSpacing: 0.2,
    height: 1.4,
  );

  /// Conseil jardinage - Chaleureux et accessible avec Lora
  static TextStyle get conseilJardinage => GoogleFonts.lora(
    fontSize: 15.0,
    fontWeight: FontWeight.normal,
    color: CouleursApplication.terreRiche,
    height: 1.7,
    letterSpacing: 0.1,
  );

  /// Citation jardin - Style éditorial élégant
  static TextStyle get citationJardin => GoogleFonts.playfairDisplay(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: CouleursApplication.vertOlive,
    fontStyle: FontStyle.italic,
    height: 1.6,
    letterSpacing: 0.2,
  );

  /// === TEXTES D'ÉTAT ===
  
  /// Succès - Vert naturel
  static TextStyle get succes => GoogleFonts.lora(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: CouleursApplication.succes,
    height: 1.4,
  );

  /// Erreur - Rouge terre
  static TextStyle get erreur => GoogleFonts.lora(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: CouleursApplication.erreur,
    height: 1.4,
  );

  /// Avertissement - Orange automnal
  static TextStyle get avertissement => GoogleFonts.lora(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: CouleursApplication.avertissement,
    height: 1.4,
  );

  /// Information - Bleu-vert apaisant
  static TextStyle get information => GoogleFonts.lora(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: CouleursApplication.information,
    height: 1.4,
  );

  /// === LIENS ET INTERACTIONS ===
  
  /// Lien élégant avec soulignement
  static TextStyle get lien => GoogleFonts.lora(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: CouleursApplication.orElegant,
    decoration: TextDecoration.underline,
    decorationColor: CouleursApplication.orElegant,
    height: 1.5,
  );

  /// Lien subtil sans soulignement
  static TextStyle get lienSubtil => GoogleFonts.lora(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: CouleursApplication.vertOlive,
    height: 1.4,
  );

  /// === STYLES AVANCÉS PREMIUM ===
  
  /// Titre de section premium - Pour les zones importantes
  static TextStyle get titreSectionPremium => GoogleFonts.playfairDisplay(
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
    color: CouleursApplication.orElegant,
    letterSpacing: 1.0,
    height: 1.3,
  );

  /// Texte descriptif premium - Pour les descriptions produits
  static TextStyle get texteDescriptifPremium => GoogleFonts.lora(
    fontSize: 15.0,
    fontWeight: FontWeight.w400,
    color: CouleursApplication.texteSecondaire,
    height: 1.8,
    letterSpacing: 0.2,
  );

  /// Badge premium - Pour les éléments de statut
  static TextStyle get badgePremium => GoogleFonts.lora(
    fontSize: 11.0,
    fontWeight: FontWeight.w700,
    color: CouleursApplication.texteSurSombre,
    letterSpacing: 1.2,
    height: 1.0,
  );

  /// Prix premium - Style spécial pour les prix
  static TextStyle get prixPremium => GoogleFonts.playfairDisplay(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    color: CouleursApplication.orElegant,
    letterSpacing: 0.5,
    height: 1.2,
  );
} 
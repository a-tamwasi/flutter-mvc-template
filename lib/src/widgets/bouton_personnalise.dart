import 'package:flutter/material.dart';
import '../constants/couleurs_application.dart';
import '../constants/dimensions_application.dart';
import '../constants/styles_texte.dart';

/// Widget de bouton personnalisé réutilisable avec design élégant
/// Respecte la nouvelle palette de couleurs premium de l'application
class BoutonPersonnalise extends StatelessWidget {
  /// Texte affiché sur le bouton
  final String texte;

  /// Callback appelé lors du tap
  final VoidCallback? surTap;

  /// Type de bouton (primaire, secondaire, etc.)
  final TypeBouton type;

  /// Taille du bouton
  final TailleBouton taille;

  /// Indique si le bouton est en cours de chargement
  final bool estEnChargement;

  /// Indique si le bouton est activé
  final bool estActive;

  /// Icône optionnelle
  final IconData? icone;

  const BoutonPersonnalise({
    super.key,
    required this.texte,
    this.surTap,
    this.type = TypeBouton.primaire,
    this.taille = TailleBouton.moyenne,
    this.estEnChargement = false,
    this.estActive = true,
    this.icone,
  });

  @override
  Widget build(BuildContext context) {
    final couleurBouton = _obtenirCouleurBouton();
    final couleurTexte = _obtenirCouleurTexte();
    final hauteur = _obtenirHauteur();
    final style = _obtenirStyleTexte().copyWith(color: couleurTexte);

    return SizedBox(
      height: hauteur,
      child: ElevatedButton(
        onPressed: (estActive && !estEnChargement) ? surTap : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: couleurBouton,
          foregroundColor: couleurTexte,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DimensionsApplication.rayonMoyen),
            side: _obtenirBordure(),
          ),
          elevation: _obtenirElevation(),
          shadowColor: couleurBouton.withValues(alpha: 0.3),
        ),
        child: estEnChargement
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(couleurTexte),
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icone != null) ...[
                    Icon(icone, color: couleurTexte, size: 18),
                    const SizedBox(width: DimensionsApplication.espacementPetit),
                  ],
                  Text(texte, style: style),
                ],
              ),
      ),
    );
  }

  /// Obtient la couleur de fond du bouton selon son type
  Color _obtenirCouleurBouton() {
    switch (type) {
      case TypeBouton.primaire:
        return CouleursApplication.vertProfondChic;
      case TypeBouton.secondaire:
        return CouleursApplication.vertOlive;
      case TypeBouton.accent:
        return CouleursApplication.orElegant;
      case TypeBouton.succes:
        return CouleursApplication.succes;
      case TypeBouton.erreur:
        return CouleursApplication.erreur;
      case TypeBouton.transparent:
        return Colors.transparent;
    }
  }

  /// Obtient la couleur du texte selon le type de bouton
  Color _obtenirCouleurTexte() {
    switch (type) {
      case TypeBouton.transparent:
        return CouleursApplication.orElegant;
      case TypeBouton.accent:
        return CouleursApplication.vertProfondChic;
      default:
        return CouleursApplication.texteSurSombre;
    }
  }

  /// Obtient la bordure selon le type de bouton
  BorderSide _obtenirBordure() {
    switch (type) {
      case TypeBouton.transparent:
        return const BorderSide(
          color: CouleursApplication.orElegant,
          width: 2,
        );
      case TypeBouton.accent:
        return const BorderSide(
          color: CouleursApplication.bordureAccent,
          width: 1,
        );
      default:
        return BorderSide.none;
    }
  }

  /// Obtient l'élévation selon le type de bouton
  double _obtenirElevation() {
    switch (type) {
      case TypeBouton.transparent:
        return 0;
      case TypeBouton.accent:
        return DimensionsApplication.hauteurElevation * 2;
      default:
        return DimensionsApplication.hauteurElevation;
    }
  }

  /// Obtient la hauteur selon la taille du bouton
  double _obtenirHauteur() {
    switch (taille) {
      case TailleBouton.petite:
        return 36.0;
      case TailleBouton.moyenne:
        return DimensionsApplication.hauteurBouton;
      case TailleBouton.grande:
        return 56.0;
    }
  }

  /// Obtient le style de texte selon la taille
  TextStyle _obtenirStyleTexte() {
    switch (taille) {
      case TailleBouton.petite:
        return StylesTexte.libelle;
      case TailleBouton.moyenne:
      case TailleBouton.grande:
        return type == TypeBouton.accent 
            ? StylesTexte.boutonAccent 
            : StylesTexte.bouton;
    }
  }
}

/// Types de boutons disponibles avec la nouvelle palette
enum TypeBouton {
  /// Bouton principal - Vert profond chic
  primaire,
  
  /// Bouton secondaire - Vert olive
  secondaire,
  
  /// Bouton accent - Or élégant
  accent,
  
  /// Bouton de succès - Vert naturel
  succes,
  
  /// Bouton d'erreur - Rouge terre
  erreur,
  
  /// Bouton transparent avec bordure dorée
  transparent,
}

/// Tailles de boutons disponibles
enum TailleBouton {
  petite,
  moyenne,
  grande,
} 
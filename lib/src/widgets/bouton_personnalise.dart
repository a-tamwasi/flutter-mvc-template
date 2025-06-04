import 'package:flutter/material.dart';
import '../constants/couleurs_application.dart';
import '../constants/dimensions_application.dart';
import '../constants/styles_texte.dart';

/// Widget de bouton personnalisé réutilisable
/// Respecte les conventions visuelles de l'application
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
    Key? key,
    required this.texte,
    this.surTap,
    this.type = TypeBouton.primaire,
    this.taille = TailleBouton.moyenne,
    this.estEnChargement = false,
    this.estActive = true,
    this.icone,
  }) : super(key: key);

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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DimensionsApplication.rayonMoyen),
          ),
          elevation: type == TypeBouton.primaire ? DimensionsApplication.hauteurElevation : 0,
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
        return CouleursApplication.primaire;
      case TypeBouton.secondaire:
        return CouleursApplication.secondaire;
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
        return CouleursApplication.primaire;
      default:
        return CouleursApplication.texteSurSombre;
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
        return StylesTexte.bouton;
    }
  }
}

/// Types de boutons disponibles
enum TypeBouton {
  primaire,
  secondaire,
  succes,
  erreur,
  transparent,
}

/// Tailles de boutons disponibles
enum TailleBouton {
  petite,
  moyenne,
  grande,
} 
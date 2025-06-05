import 'package:flutter/material.dart';
import '../models/element_menu.dart';
import '../constants/couleurs_application.dart';
import '../constants/dimensions_application.dart';
import '../constants/styles_texte.dart';

/// Widget pour afficher un élément du menu drawer
/// Supporte les éléments simples et les sous-menus expansibles
class ElementMenuDrawerWidget extends StatelessWidget {
  /// Élément de menu à afficher
  final ElementMenu element;
  
  /// Callback lors de la sélection d'un élément
  final Function(String) surSelection;
  
  /// Callback lors du basculement d'expansion
  final Function(String) surBasculementExpansion;
  
  /// Niveau d'indentation (pour les sous-menus)
  final int niveauIndentation;

  /// Constructeur du widget d'élément de menu
  const ElementMenuDrawerWidget({
    super.key,
    required this.element,
    required this.surSelection,
    required this.surBasculementExpansion,
    this.niveauIndentation = 0,
  });

  @override
  Widget build(BuildContext context) {
    if (element.aSousElements) {
      return _construireElementAvecSousMenu(context);
    } else {
      return _construireElementSimple(context);
    }
  }

  /// Construit un élément simple du menu
  Widget _construireElementSimple(BuildContext context) {
    final estSelectionne = element.estSelectionne;
    final couleurIcone = element.couleurIcone ?? 
        (estSelectionne ? CouleursApplication.orElegant : CouleursApplication.vertOlive);

    return Container(
      margin: EdgeInsets.only(
        left: niveauIndentation * DimensionsApplication.espacementGrand,
        right: DimensionsApplication.espacementPetit,
        bottom: DimensionsApplication.espacementTresPetit,
      ),
      decoration: BoxDecoration(
        color: estSelectionne 
            ? CouleursApplication.orElegant.withValues(alpha: 0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(DimensionsApplication.rayonMoyen),
        border: estSelectionne 
            ? Border.all(
                color: CouleursApplication.orElegant.withValues(alpha: 0.3),
                width: 1.0,
              )
            : null,
      ),
      child: ListTile(
        dense: niveauIndentation > 0,
        leading: _construireIconeElement(couleurIcone),
        title: _construireTitreElement(context, estSelectionne),
        trailing: _construireBadge(),
        onTap: () => surSelection(element.id),
        contentPadding: EdgeInsets.symmetric(
          horizontal: DimensionsApplication.espacementMoyen,
          vertical: niveauIndentation > 0 
              ? DimensionsApplication.espacementTresPetit 
              : DimensionsApplication.espacementPetit,
        ),
      ),
    );
  }

  /// Construit un élément avec sous-menu
  Widget _construireElementAvecSousMenu(BuildContext context) {
    final estSelectionne = element.estSelectionne;
    final estExpanse = element.estExpanse;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Élément principal
        Container(
          margin: EdgeInsets.only(
            left: niveauIndentation * DimensionsApplication.espacementGrand,
            right: DimensionsApplication.espacementPetit,
            bottom: DimensionsApplication.espacementTresPetit,
          ),
          decoration: BoxDecoration(
            color: estSelectionne 
                ? CouleursApplication.orElegant.withValues(alpha: 0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(DimensionsApplication.rayonMoyen),
          ),
          child: ListTile(
            leading: _construireIconeElement(
              estSelectionne ? CouleursApplication.orElegant : CouleursApplication.vertOlive,
            ),
            title: _construireTitreElement(context, estSelectionne),
            trailing: _construireIconeExpansion(estExpanse),
            onTap: () => surBasculementExpansion(element.id),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: DimensionsApplication.espacementMoyen,
              vertical: DimensionsApplication.espacementPetit,
            ),
          ),
        ),
        
        // Sous-éléments (si expansé)
        if (estExpanse && element.sousElements != null)
          ...element.sousElements!.map((sousElement) {
            return ElementMenuDrawerWidget(
              element: sousElement,
              surSelection: surSelection,
              surBasculementExpansion: surBasculementExpansion,
              niveauIndentation: niveauIndentation + 1,
            );
          }),
      ],
    );
  }

  /// Construit l'icône de l'élément
  Widget _construireIconeElement(Color couleur) {
    return Container(
      width: DimensionsApplication.iconeGrande,
      height: DimensionsApplication.iconeGrande,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DimensionsApplication.rayonPetit),
      ),
      child: Icon(
        element.icone,
        color: couleur,
        size: DimensionsApplication.iconeMoyenne,
      ),
    );
  }

  /// Construit le titre de l'élément avec son sous-titre
  Widget _construireTitreElement(BuildContext context, bool estSelectionne) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Titre principal
        Text(
          element.titre,
          style: niveauIndentation > 0
              ? StylesTexte.corpsTexte.copyWith(
                  color: estSelectionne 
                      ? CouleursApplication.orElegant 
                      : CouleursApplication.cremeBeigeLuxe,
                  fontWeight: estSelectionne ? FontWeight.w600 : FontWeight.w500,
                )
              : StylesTexte.menuDrawer.copyWith(
                  color: estSelectionne 
                      ? CouleursApplication.orElegant 
                      : CouleursApplication.cremeBeigeLuxe,
                  fontWeight: estSelectionne ? FontWeight.w700 : FontWeight.w600,
                ),
        ),
        
        // Sous-titre descriptif (si présent)
        if (element.sousTitre != null) ...[
          const SizedBox(height: 2),
          Text(
            element.sousTitre!,
            style: StylesTexte.libelle.copyWith(
              color: estSelectionne 
                  ? CouleursApplication.orElegant.withValues(alpha: 0.8)
                  : CouleursApplication.vertOlive.withValues(alpha: 0.7),
              fontWeight: FontWeight.w400,
              fontSize: niveauIndentation > 0 ? 11 : 12,
            ),
          ),
        ],
      ],
    );
  }

  /// Construit le badge (si présent)
  Widget? _construireBadge() {
    if (element.badge == null) return null;
    
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: DimensionsApplication.espacementPetit,
        vertical: DimensionsApplication.espacementTresPetit,
      ),
      decoration: BoxDecoration(
        color: CouleursApplication.orElegant,
        borderRadius: BorderRadius.circular(DimensionsApplication.rayonPetit),
      ),
      child: Text(
        element.badge!,
        style: StylesTexte.libelle.copyWith(
          color: CouleursApplication.texteSurSombre,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// Construit l'icône d'expansion
  Widget _construireIconeExpansion(bool estExpanse) {
    return Icon(
      estExpanse ? Icons.expand_less : Icons.expand_more,
      color: CouleursApplication.vertOlive,
      size: DimensionsApplication.iconeMoyenne,
    );
  }
} 
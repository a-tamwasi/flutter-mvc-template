import 'package:flutter/material.dart';

/// Modèle représentant un élément du menu drawer
/// Supporte les éléments simples et les menus déroulants avec sous-éléments
class ElementMenu {
  /// Identifiant unique de l'élément
  final String id;
  
  /// Titre affiché dans le menu
  final String titre;
  
  /// Sous-titre descriptif de l'élément
  final String? sousTitre;
  
  /// Icône de l'élément de menu
  final IconData icone;
  
  /// Route de navigation (optionnelle pour les éléments avec sous-menu)
  final String? route;
  
  /// Sous-éléments du menu (pour les menus déroulants)
  final List<ElementMenu>? sousElements;
  
  /// Indique si l'élément est actuellement sélectionné
  final bool estSelectionne;
  
  /// Indique si le menu déroulant est ouvert
  final bool estExpanse;
  
  /// Badge de notification (optionnel)
  final String? badge;
  
  /// Couleur personnalisée de l'icône (optionnelle)
  final Color? couleurIcone;

  /// Constructeur de l'élément de menu
  ElementMenu({
    required this.id,
    required this.titre,
    required this.icone,
    this.sousTitre,
    this.route,
    this.sousElements,
    this.estSelectionne = false,
    this.estExpanse = false,
    this.badge,
    this.couleurIcone,
  });

  /// Crée une copie de l'élément avec les propriétés modifiées
  ElementMenu copierAvec({
    String? id,
    String? titre,
    IconData? icone,
    String? sousTitre,
    String? route,
    List<ElementMenu>? sousElements,
    bool? estSelectionne,
    bool? estExpanse,
    String? badge,
    Color? couleurIcone,
  }) {
    return ElementMenu(
      id: id ?? this.id,
      titre: titre ?? this.titre,
      icone: icone ?? this.icone,
      sousTitre: sousTitre ?? this.sousTitre,
      route: route ?? this.route,
      sousElements: sousElements ?? this.sousElements,
      estSelectionne: estSelectionne ?? this.estSelectionne,
      estExpanse: estExpanse ?? this.estExpanse,
      badge: badge ?? this.badge,
      couleurIcone: couleurIcone ?? this.couleurIcone,
    );
  }

  /// Vérifie si l'élément a des sous-éléments
  bool get aSousElements => sousElements != null && sousElements!.isNotEmpty;

  /// Vérifie si l'élément est navigable (a une route)
  bool get estNavigable => route != null;

  /// Récupère tous les éléments de menu de façon récursive
  List<ElementMenu> get tousLesElements {
    final List<ElementMenu> elements = [this];
    if (aSousElements) {
      for (final sousElement in sousElements!) {
        elements.addAll(sousElement.tousLesElements);
      }
    }
    return elements;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ElementMenu && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'ElementMenu(id: $id, titre: $titre)';
}

/// Classe utilitaire pour créer les éléments de menu de l'application
class FabriqueElementsMenu {
  FabriqueElementsMenu._(); // Constructeur privé

  /// Crée la liste complète des éléments de menu pour le drawer
  static List<ElementMenu> creerMenuComplet() {
    return [
      // Accueil
      ElementMenu(
        id: 'accueil',
        titre: 'Accueil',
        sousTitre: 'Tableau de bord principal',
        icone: Icons.home_outlined,
        route: '/accueil',
      ),

      // Nos réalisations
      ElementMenu(
        id: 'realisations',
        titre: 'Nos réalisations',
        sousTitre: 'Portfolio de nos créations',
        icone: Icons.photo_library_outlined,
        route: '/realisations',
      ),

      // Nos services avec sous-menu
      ElementMenu(
        id: 'services',
        titre: 'Nos services',
        sousTitre: 'Expertise professionnelle',
        icone: Icons.build_outlined,
        sousElements: [
          ElementMenu(
            id: 'conception-jardin',
            titre: 'Conception de jardin',
            sousTitre: 'Design sur mesure',
            icone: Icons.park_outlined,
            route: '/services/conception-jardin',
          ),
          ElementMenu(
            id: 'piscines-terrasses',
            titre: 'Piscines & Terrasses',
            sousTitre: 'Espaces de détente',
            icone: Icons.pool_outlined,
            route: '/services/piscines-terrasses',
          ),
          ElementMenu(
            id: 'amenagement-paysager',
            titre: 'Aménagement paysager',
            sousTitre: 'Harmonie naturelle',
            icone: Icons.landscape_outlined,
            route: '/services/amenagement-paysager',
          ),
        ],
      ),

      // Demander un devis
      ElementMenu(
        id: 'devis',
        titre: 'Demander un devis',
        sousTitre: 'Estimation personnalisée',
        icone: Icons.request_quote_outlined,
        route: '/devis',
        badge: 'Gratuit',
      ),


    ];
  }
} 
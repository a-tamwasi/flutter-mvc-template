import 'package:flutter/material.dart';
import '../models/element_menu.dart';

/// Contrôleur pour gérer l'état du drawer et la navigation
/// Responsable de l'expansion des menus et de la logique de navigation
class DrawerControleur extends ChangeNotifier {
  /// Liste des éléments de menu avec leur état
  List<ElementMenu> _elementsMenu = [];
  
  /// Élément actuellement sélectionné
  String? _elementSelectionne;

  /// Constructeur du contrôleur
  DrawerControleur() {
    _initialiserElementsMenu();
  }

  /// Getters publics
  List<ElementMenu> get elementsMenu => _elementsMenu;
  String? get elementSelectionne => _elementSelectionne;

  /// Initialise les éléments de menu avec les données de la fabrique
  void _initialiserElementsMenu() {
    _elementsMenu = FabriqueElementsMenu.creerMenuComplet();
    notifyListeners();
  }

  /// Sélectionne un élément de menu et gère la navigation
  void selectionnerElement(String idElement, BuildContext context) {
    // Vérifie si l'élément a des sous-éléments
    final element = _trouverElementParId(idElement);
    
    if (element != null && element.aSousElements) {
      // Si l'élément a des sous-éléments, bascule juste l'expansion
      basculerExpansion(idElement);
      return;
    }
    
    // Met à jour la sélection
    _elementSelectionne = idElement;
    _mettreAJourSelectionElements(idElement);
    
    // Ferme le drawer
    Navigator.of(context).pop();
    
    // Navigue vers la page appropriée
    _naviguerVersPage(idElement, context);
    
    notifyListeners();
  }

  /// Bascule l'expansion d'un élément de menu avec sous-éléments
  void basculerExpansion(String idElement) {
    _elementsMenu = _elementsMenu.map((element) {
      if (element.id == idElement) {
        return element.copierAvec(estExpanse: !element.estExpanse);
      }
      return element;
    }).toList();
    
    notifyListeners();
  }

  /// Met à jour la sélection de tous les éléments
  void _mettreAJourSelectionElements(String idElementSelectionne) {
    _elementsMenu = _elementsMenu.map((element) {
      // Désélectionne tous les éléments principaux
      final elementPrincipalMisAJour = element.copierAvec(
        estSelectionne: element.id == idElementSelectionne,
      );
      
      // Met à jour les sous-éléments si présents
      if (element.sousElements != null) {
        final sousElementsMisAJour = element.sousElements!.map((sousElement) {
          return sousElement.copierAvec(
            estSelectionne: sousElement.id == idElementSelectionne,
          );
        }).toList();
        
        return elementPrincipalMisAJour.copierAvec(
          sousElements: sousElementsMisAJour,
        );
      }
      
      return elementPrincipalMisAJour;
    }).toList();
  }

  /// Navigue vers la page correspondant à l'élément sélectionné
  void _naviguerVersPage(String idElement, BuildContext context) {
    switch (idElement) {
      case 'accueil':
        // Déjà sur la page d'accueil, ne fait rien
        break;
        
      case 'realisations':
        Navigator.pushNamed(context, '/realisations');
        break;
        
      case 'services':
        // Les services ont des sous-menus, ne ferme pas le drawer mais bascule l'expansion
        // Note: Cette logique sera gérée dans le surBasculementExpansion directement
        break;
        
      case 'conception-jardin':
        Navigator.pushNamed(context, '/services/conception-jardin');
        break;
        
      case 'piscines-terrasses':
        Navigator.pushNamed(context, '/services/piscines-terrasses');
        break;
        
      case 'amenagement-paysager':
        Navigator.pushNamed(context, '/services/amenagement-paysager');
        break;
        
      case 'devis':
        Navigator.pushNamed(context, '/devis');
        break;
        
      default:
        // Page non implémentée
        _afficherMessagePageNonImplementee(context, idElement);
        break;
    }
  }

  /// Affiche un message pour les pages non implémentées
  void _afficherMessagePageNonImplementee(BuildContext context, String idElement) {
    final element = _trouverElementParId(idElement);
    final nom = element?.titre ?? 'Page inconnue';
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Navigation vers: $nom'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  /// Trouve un élément par son ID dans la liste complète
  ElementMenu? _trouverElementParId(String id) {
    for (final element in _elementsMenu) {
      if (element.id == id) return element;
      
      if (element.sousElements != null) {
        for (final sousElement in element.sousElements!) {
          if (sousElement.id == id) return sousElement;
        }
      }
    }
    return null;
  }

  /// Réinitialise l'état du contrôleur
  void reinitialiser() {
    _elementSelectionne = null;
    _initialiserElementsMenu();
  }


} 
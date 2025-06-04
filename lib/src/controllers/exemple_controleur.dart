import 'controleur_base.dart';
import '../models/exemple_modele.dart';

/// Exemple de contrôleur concret héritant de ControleurBase
/// À remplacer par vos contrôleurs métier spécifiques
class ExempleControleur extends ControleurBase {
  /// Liste des éléments gérés par ce contrôleur
  List<ExempleModele> _elements = [];

  /// Getter pour accéder aux éléments en lecture seule
  List<ExempleModele> get elements => List.unmodifiable(_elements);

  /// Élément actuellement sélectionné
  ExempleModele? _elementSelectionne;

  /// Getter pour l'élément sélectionné
  ExempleModele? get elementSelectionne => _elementSelectionne;

  @override
  void initialiser() {
    super.initialiser();
    // Initialisation spécifique du contrôleur
    _chargerElements();
  }

  /// Charge les éléments (simulation d'un appel à un service)
  Future<void> _chargerElements() async {
    try {
      definirChargement(true);
      effacerErreur();

      // Simulation d'un chargement asynchrone
      await Future.delayed(const Duration(milliseconds: 500));

      // Données d'exemple
      _elements = [
        ExempleModele(
          id: '1',
          nom: 'Premier élément',
          description: 'Description du premier élément',
        ),
        ExempleModele(
          id: '2',
          nom: 'Second élément',
          description: 'Description du second élément',
        ),
      ];

      notifierChangement();
    } catch (erreur) {
      definirErreur('Erreur lors du chargement des éléments: $erreur');
    } finally {
      definirChargement(false);
    }
  }

  /// Sélectionne un élément
  void selectionnerElement(ExempleModele element) {
    _elementSelectionne = element;
    notifierChangement();
  }

  /// Ajoute un nouvel élément
  Future<void> ajouterElement(String nom, String description) async {
    try {
      definirChargement(true);
      effacerErreur();

      final nouvelElement = ExempleModele(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        nom: nom,
        description: description,
      );

      _elements.add(nouvelElement);
      notifierChangement();
    } catch (erreur) {
      definirErreur('Erreur lors de l\'ajout: $erreur');
    } finally {
      definirChargement(false);
    }
  }

  /// Supprime un élément
  Future<void> supprimerElement(String id) async {
    try {
      definirChargement(true);
      effacerErreur();

      _elements.removeWhere((element) => element.id == id);
      
      if (_elementSelectionne?.id == id) {
        _elementSelectionne = null;
      }

      notifierChangement();
    } catch (erreur) {
      definirErreur('Erreur lors de la suppression: $erreur');
    } finally {
      definirChargement(false);
    }
  }

  /// Rafraîchit les données
  Future<void> rafraichir() async {
    await _chargerElements();
  }
} 
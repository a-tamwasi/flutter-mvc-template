import 'service_base.dart';
import '../models/exemple_modele.dart';

/// Exemple de service concret héritant de ServiceBase
/// À remplacer par vos services métier spécifiques
class ExempleService extends ServiceBase {
  /// Instance singleton du service
  static final ExempleService _instance = ExempleService._internal();
  
  /// Factory constructor pour retourner toujours la même instance
  factory ExempleService() => _instance;
  
  /// Constructeur privé
  ExempleService._internal();

  /// Données simulées en mémoire
  final List<ExempleModele> _donneesEnMemoire = [];

  @override
  Future<void> surInitialisation() async {
    // Initialisation spécifique du service
    await _chargerDonneesInitiales();
  }

  /// Charge les données initiales (simulation)
  Future<void> _chargerDonneesInitiales() async {
    await executerAvecGestionErreur(() async {
      // Simulation d'un chargement depuis une source externe
      await Future.delayed(const Duration(milliseconds: 300));
      
      _donneesEnMemoire.clear();
      _donneesEnMemoire.addAll([
        ExempleModele(
          id: 'service_1',
          nom: 'Élément du service 1',
          description: 'Chargé depuis le service',
        ),
        ExempleModele(
          id: 'service_2',
          nom: 'Élément du service 2',
          description: 'Autre élément du service',
        ),
      ]);
    }, 'chargement des données initiales');
  }

  /// Récupère tous les éléments
  Future<List<ExempleModele>> obtenirTousLesElements() async {
    return await executerAvecGestionErreur(() async {
      // Simulation d'un appel réseau
      await Future.delayed(const Duration(milliseconds: 200));
      
      return List.from(_donneesEnMemoire);
    }, 'récupération de tous les éléments');
  }

  /// Récupère un élément par son ID
  Future<ExempleModele?> obtenirElementParId(String id) async {
    return await executerAvecGestionErreur(() async {
      await Future.delayed(const Duration(milliseconds: 100));
      
      return _donneesEnMemoire.firstWhere(
        (element) => element.id == id,
        orElse: () => throw Exception('Élément non trouvé avec l\'ID: $id'),
      );
    }, 'récupération de l\'élément par ID');
  }

  /// Ajoute un nouvel élément
  Future<ExempleModele> ajouterElement(String nom, String description) async {
    return await executerAvecGestionErreur(() async {
      await Future.delayed(const Duration(milliseconds: 300));
      
      final nouvelElement = ExempleModele(
        id: 'service_${DateTime.now().millisecondsSinceEpoch}',
        nom: nom,
        description: description,
      );
      
      _donneesEnMemoire.add(nouvelElement);
      return nouvelElement;
    }, 'ajout d\'un nouvel élément');
  }

  /// Met à jour un élément existant
  Future<ExempleModele> mettreAJourElement(ExempleModele element) async {
    return await executerAvecGestionErreur(() async {
      await Future.delayed(const Duration(milliseconds: 200));
      
      final index = _donneesEnMemoire.indexWhere((e) => e.id == element.id);
      if (index == -1) {
        throw Exception('Élément non trouvé pour la mise à jour');
      }
      
      _donneesEnMemoire[index] = element;
      return element;
    }, 'mise à jour de l\'élément');
  }

  /// Supprime un élément
  Future<void> supprimerElement(String id) async {
    await executerAvecGestionErreur(() async {
      await Future.delayed(const Duration(milliseconds: 150));
      
      final index = _donneesEnMemoire.indexWhere((e) => e.id == id);
      if (index == -1) {
        throw Exception('Élément non trouvé pour la suppression');
      }
      
      _donneesEnMemoire.removeAt(index);
    }, 'suppression de l\'élément');
  }

  /// Recherche des éléments par nom
  Future<List<ExempleModele>> rechercherParNom(String terme) async {
    return await executerAvecGestionErreur(() async {
      await Future.delayed(const Duration(milliseconds: 100));
      
      return _donneesEnMemoire
          .where((element) => element.nom.toLowerCase().contains(terme.toLowerCase()))
          .toList();
    }, 'recherche par nom');
  }

  /// Compte le nombre total d'éléments
  Future<int> compterElements() async {
    return await executerAvecGestionErreur(() async {
      await Future.delayed(const Duration(milliseconds: 50));
      return _donneesEnMemoire.length;
    }, 'comptage des éléments');
  }

  @override
  Future<void> dispose() async {
    _donneesEnMemoire.clear();
    await super.dispose();
  }
} 
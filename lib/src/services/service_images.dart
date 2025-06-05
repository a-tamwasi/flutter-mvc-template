import 'service_base.dart';

/// Service de gestion des images de l'application
/// Centralise la logique de chargement et de validation des assets
class ServiceImages extends ServiceBase {
  /// Instance singleton du service
  static final ServiceImages _instance = ServiceImages._();
  
  /// Factory pour récupérer l'instance singleton
  factory ServiceImages() => _instance;
  
  /// Constructeur privé pour le pattern singleton
  ServiceImages._();

  /// Chemins des images de jardins disponibles
  static const List<String> _cheminsjardins = [
    'assets/jardin 1.jpeg',
    'assets/jardin 2.jpeg',
    'assets/jardin 3.jpeg',
    'assets/jardin 4.jpeg',
    'assets/jardin 5.jpeg',
  ];

  /// Chemins des images de piscines disponibles
  static const List<String> _cheminsPiscines = [
    'assets/piscine 1.jpeg',
    'assets/piscine 2.jpeg',
    'assets/piscine 3.jpeg',
    'assets/piscine 4.jpeg',
    'assets/piscine 5.jpeg',
  ];

  /// Récupère tous les chemins d'images de jardins
  List<String> get imagesJardins => List.unmodifiable(_cheminsjardins);

  /// Récupère tous les chemins d'images de piscines
  List<String> get imagesPiscines => List.unmodifiable(_cheminsPiscines);

  /// Récupère toutes les images de réalisations
  List<String> get toutesLesImages => [
    ..._cheminsjardins,
    ..._cheminsPiscines,
  ];

  /// Récupère une image aléatoire de jardin
  String get imageJardinAleatoire {
    final index = DateTime.now().millisecondsSinceEpoch % _cheminsjardins.length;
    return _cheminsjardins[index];
  }

  /// Récupère une image aléatoire de piscine
  String get imagePiscineAleatoire {
    final index = DateTime.now().millisecondsSinceEpoch % _cheminsPiscines.length;
    return _cheminsPiscines[index];
  }

  /// Récupère l'image hero par défaut (première image de jardin)
  String get imageHeroDefaut => _cheminsjardins.first;

  /// Récupère les images pour la galerie d'accueil (sélection optimisée)
  List<String> get imagesGalerieAccueil => [
    _cheminsjardins[1], // jardin 2.jpeg - Jardin paysager élégant
    _cheminsPiscines[0], // piscine 1.jpeg - Piscine intégrée moderne
  ];

  /// Vérifie si un chemin d'image est valide
  bool estImageValide(String chemin) {
    return toutesLesImages.contains(chemin);
  }

  /// Récupère une image par catégorie et index
  String? obtenirImage({
    required TypeImage type,
    int index = 0,
  }) {
    switch (type) {
      case TypeImage.jardin:
        return index < _cheminsjardins.length ? _cheminsjardins[index] : null;
      case TypeImage.piscine:
        return index < _cheminsPiscines.length ? _cheminsPiscines[index] : null;
    }
  }

  @override
  Future<void> initialiser() async {
    // Logique d'initialisation si nécessaire
    // Par ex: validation de l'existence des fichiers
  }

  @override
  Future<void> dispose() async {
    // Nettoyage des ressources si nécessaire
  }
}

/// Énumération des types d'images disponibles
enum TypeImage {
  /// Images de jardins
  jardin,
  
  /// Images de piscines
  piscine,
} 
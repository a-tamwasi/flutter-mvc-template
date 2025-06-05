import 'controleur_base.dart';
import '../models/service_jardin.dart';
import '../services/service_images.dart';

/// Contrôleur pour la page d'accueil premium
/// Gère l'affichage des services, réalisations et interactions utilisateur
class AccueilControleur extends ControleurBase {
  /// Service de gestion des images
  final ServiceImages _serviceImages = ServiceImages();

  /// Index de l'image hero actuellement affichée
  int _indexImageHero = 0;

  /// Services disponibles de l'entreprise
  List<ServiceJardin> get services => ServiceJardin.servicesDisponibles;

  /// Images des réalisations (lecture seule)
  List<String> get imagesRealisations => _serviceImages.toutesLesImages;

  /// Image hero actuelle
  String get imageHero {
    final images = _serviceImages.toutesLesImages;
    if (_indexImageHero >= 0 && _indexImageHero < images.length) {
      return images[_indexImageHero];
    }
    return _serviceImages.imageHeroDefaut;
  }

  /// Images pour la section "Nos Réalisations" (2 images sélectionnées)
  List<String> get imagesGalerieAccueil => _serviceImages.imagesGalerieAccueil;

  /// Témoignage client affiché sur la page d'accueil
  Map<String, String> get temoignageClient {
    return {
      'citation': 'Des experts à l\'écoute qui transforment nos idées en un magnifique jardin!',
      'auteur': 'Marie Dupont',
      'statut': 'cliente satisfaite',
    };
  }

  /// Change l'image hero (optionnel pour un carrousel futur)
  void changerImageHero(int nouvelIndex) {
    final images = _serviceImages.toutesLesImages;
    if (nouvelIndex >= 0 && nouvelIndex < images.length) {
      _indexImageHero = nouvelIndex;
      notifierChangement();
    }
  }

  /// Action appelée quand l'utilisateur clique sur "Commencez"
  /// Navigue vers la page de demande de devis
  void commencerDemande() {
    naviguerVers('/demander-devis');
  }

  /// Action appelée quand l'utilisateur sélectionne un service
  /// Navigue vers une page temporaire de service en attendant l'implémentation spécifique
  void selectionnerService(ServiceJardin service) {
    naviguerVers('/service-temporaire');
  }

  /// Action appelée quand l'utilisateur clique sur une réalisation
  /// Navigue vers la galerie complète des réalisations
  void voirRealisation(String cheminImage) {
    naviguerVers('/nos-realisations');
  }

  /// Obtient les statistiques de l'entreprise (pour affichage optionnel)
  Map<String, dynamic> get statistiquesEntreprise {
    return {
      'projetsRealises': 250,
      'clientsSatisfaits': 98,
      'anneesExperience': 15,
      'garantieAns': 5,
    };
  }

  /// Messages promotionnels rotatifs (pour affichage optionnel)
  List<String> get messagesPromo {
    return [
      'Devis gratuit sous 48h',
      'Garantie satisfaction 100%',
      'Équipe certifiée paysagiste',
      'Suivi personnalisé de A à Z',
    ];
  }
} 
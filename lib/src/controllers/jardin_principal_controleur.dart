import 'controleur_base.dart';
import '../models/element_menu.dart';

/// Contrôleur principal de l'application jardin
/// Gère la navigation dans le drawer et les interactions utilisateur
class JardinPrincipalControleur extends ControleurBase {
  /// Identifiant de l'élément de menu actuellement sélectionné
  String _idElementSelectionne = 'accueil';
  
  /// Titre de la page actuelle
  String _titrePageActuelle = 'Accueil';

  /// Liste des éléments de menu du drawer
  late List<ElementMenu> _elementsMenu;

  /// Map des éléments expansés (pour les sous-menus)
  final Map<String, bool> _elementsExpanses = {};

  /// Constructeur
  JardinPrincipalControleur() {
    _initialiserMenu();
  }

  /// Identifiant de l'élément sélectionné
  String get idElementSelectionne => _idElementSelectionne;

  /// Titre dynamique de la page selon la section sélectionnée
  String get titrePage => _titrePageActuelle;

  /// Initialise le menu avec la structure complète
  void _initialiserMenu() {
    _elementsMenu = FabriqueElementsMenu.creerMenuComplet();
    _marquerElementSelectionne(_idElementSelectionne);
  }

  /// Getter pour les éléments du menu
  List<ElementMenu> get elementsMenu => List.unmodifiable(_elementsMenu);

  /// Vérifie si un élément est expansé
  bool estExpanse(String idElement) {
    return _elementsExpanses[idElement] ?? false;
  }

  /// Bascule l'état d'expansion d'un élément de menu
  void basculerExpansion(String idElement) {
    _elementsExpanses[idElement] = !(_elementsExpanses[idElement] ?? false);
    _mettreAJourMenu();
    notifierChangement();
  }

  /// Sélectionne un élément du menu et met à jour l'interface
  void selectionnerElementMenu(String idElement) {
    if (_trouverElementParId(idElement) != null) {
      _idElementSelectionne = idElement;
      _marquerElementSelectionne(idElement);
      _mettreAJourTitrePage(idElement);
      notifierChangement();
    }
  }

  /// Met à jour le titre de la page selon l'élément sélectionné
  void _mettreAJourTitrePage(String idElement) {
    final element = _trouverElementParId(idElement);
    if (element != null) {
      _titrePageActuelle = element.titre;
    }
  }

  /// Marque un élément comme sélectionné et déselectionne les autres
  void _marquerElementSelectionne(String idElement) {
    _elementsMenu = _elementsMenu.map((element) {
      if (element.aSousElements) {
        final sousElementsModifies = element.sousElements!.map((sousElement) {
          return sousElement.copierAvec(
            estSelectionne: sousElement.id == idElement,
          );
        }).toList();
        return element.copierAvec(
          estSelectionne: element.id == idElement,
          sousElements: sousElementsModifies,
        );
      } else {
        return element.copierAvec(
          estSelectionne: element.id == idElement,
        );
      }
    }).toList();
  }

  /// Met à jour l'état d'expansion dans la liste des éléments
  void _mettreAJourMenu() {
    _elementsMenu = _elementsMenu.map((element) {
      if (element.aSousElements) {
        return element.copierAvec(
          estExpanse: estExpanse(element.id),
        );
      }
      return element;
    }).toList();
  }

  /// Trouve un élément par son identifiant
  ElementMenu? _trouverElementParId(String idElement) {
    for (final element in _elementsMenu) {
      if (element.id == idElement) {
        return element;
      }
      if (element.aSousElements) {
        for (final sousElement in element.sousElements!) {
          if (sousElement.id == idElement) {
            return sousElement;
          }
        }
      }
    }
    return null;
  }

  /// Obtient le contenu à afficher selon la section sélectionnée
  String obtenirContenuPage() {
    switch (_idElementSelectionne) {
      case 'accueil':
        return 'Bienvenue dans votre jardin idéal ! Découvrez nos services de conception et d\'aménagement paysager premium.';
      case 'realisations':
        return 'Explorez notre galerie de réalisations exceptionnelles. Chaque projet reflète notre expertise et notre passion pour l\'art paysager.';
      case 'conception-jardin':
        return 'Conception de jardins sur-mesure. Nous créons des espaces verts uniques qui reflètent votre personnalité et s\'harmonisent avec votre environnement.';
      case 'piscines-terrasses':
        return 'Piscines et terrasses de luxe. Transformez votre extérieur en véritable oasis de détente avec nos aménagements haut de gamme.';
      case 'amenagement-paysager':
        return 'Aménagement paysager complet. De la conception à la réalisation, nous donnons vie à vos rêves d\'espaces verts.';
      case 'devis':
        return 'Demandez votre devis gratuit et personnalisé. Nos experts vous accompagnent dans la concrétisation de votre projet.';
      case 'mon-projet':
        return 'Suivez l\'avancement de votre projet en temps réel. Accédez aux plans, photos et étapes de réalisation.';
      case 'a-propos':
        return 'Découvrez notre histoire et notre passion pour l\'art paysager. Une équipe d\'experts à votre service depuis plus de 15 ans.';
      case 'contact':
        return 'Contactez nos experts pour discuter de votre projet. Nous sommes à votre écoute pour créer ensemble votre jardin idéal.';
      case 'faq-support':
        return 'Questions fréquentes et support technique. Trouvez rapidement les réponses à vos questions ou contactez notre équipe.';
      default:
        return 'Sélectionnez une section dans le menu pour découvrir nos services de jardinage premium.';
    }
  }
} 
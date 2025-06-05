import 'package:flutter/material.dart';
import 'vue_base.dart';
import '../controllers/accueil_controleur.dart';
import '../constants/couleurs_application.dart';
import '../constants/dimensions_application.dart';
import '../constants/styles_texte.dart';
import '../models/service_jardin.dart';
import '../models/element_menu.dart';
import '../widgets/bouton_personnalise.dart';
import '../widgets/image_securisee.dart';
import '../widgets/drawer_stateful_widget.dart';

/// Vue de la page d'accueil premium pour le service de jardinage haut de gamme
/// Design moderne inspiré de l'univers paysager méditerranéen et provençal
class AccueilVue extends VueBase<AccueilControleur> {
  const AccueilVue({
    super.key,
    required super.controleur,
  });

  @override
  PreferredSizeWidget? construireBarreApplication(BuildContext context, AccueilControleur controleur) {
    return AppBar(
      title: Text(
        'Mon Jardin Idéal',
        style: StylesTexte.appBarTitre,
      ),
      backgroundColor: CouleursApplication.vertProfondChic,
      foregroundColor: CouleursApplication.texteSurSombre,
      elevation: 0, // AppBar sans ombre pour un look moderne
      centerTitle: true,
      // Le bouton de menu est ajouté automatiquement par Flutter quand un drawer est présent
      iconTheme: const IconThemeData(
        color: CouleursApplication.orElegant, // Couleur dorée pour l'icône de menu
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          color: CouleursApplication.orElegant,
          onPressed: () => _afficherRecherche(context),
        ),
      ],
    );
  }

  @override
  Widget? construireDrawer(BuildContext context, AccueilControleur controleur) {
    // Utilise la fabrique pour créer les éléments de menu
    final elementsMenu = FabriqueElementsMenu.creerMenuComplet();
    
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              CouleursApplication.vertProfondChic,
              Color(0xFF1A2F1F), // Nuance plus sombre pour la profondeur
            ],
          ),
        ),
        child: Column(
          children: [
            // En-tête du drawer avec style premium
            _construireEnteteDrawer(context),
            
            // Liste des éléments de menu
            _construireListeMenuDrawer(context, elementsMenu),
            
            // Pied du drawer avec liens utiles
            _construirePiedDrawer(context),
          ],
        ),
      ),
    );
  }

  @override
  Widget construireContenu(BuildContext context, AccueilControleur controleur) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Section Hero avec image et titre principal
          _construireSectionHero(context, controleur),
          
          // Section "Nos Réalisations"
          _construireSectionRealisations(context, controleur),
          
          // Section "Nos Services"
          _construireSectionServices(context, controleur),
          
          // Section Témoignage
          _construireSectionTemoignage(context, controleur),
          
          // Espacement final
          const SizedBox(height: DimensionsApplication.espacementGrand),
        ],
      ),
    );
  }

  /// Construit la section hero avec image de fond et appel à l'action
  Widget _construireSectionHero(BuildContext context, AccueilControleur controleur) {
    return ImageHero(
      cheminImage: controleur.imageHero,
      hauteur: 400.0,
      gradientOverlay: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.transparent,
          CouleursApplication.vertProfondChic.withValues(alpha: 0.7),
        ],
      ),
      enfant: Padding(
        padding: const EdgeInsets.all(DimensionsApplication.margeEcran),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Titre principal en overlay
            Text(
              'Créez Votre\nJardin de Rêve',
              style: StylesTexte.titrePrincipalDore.copyWith(
                color: CouleursApplication.texteSurSombre,
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    offset: const Offset(0, 2),
                    blurRadius: 4,
                    color: CouleursApplication.vertProfondChic.withValues(alpha: 0.8),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: DimensionsApplication.espacementGrand),
            
            // Bouton d'appel à l'action
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: 200,
                child: BoutonPersonnalise(
                  texte: 'COMMENCEZ',
                  type: TypeBouton.accent,
                  taille: TailleBouton.grande,
                  surTap: () => controleur.commencerDemande(),
                ),
              ),
            ),
            
            const SizedBox(height: DimensionsApplication.espacementMoyen),
          ],
        ),
      ),
    );
  }

  /// Construit la section "Nos Réalisations"
  Widget _construireSectionRealisations(BuildContext context, AccueilControleur controleur) {
    return Container(
      padding: const EdgeInsets.all(DimensionsApplication.margeEcran),
      color: CouleursApplication.cremeBeigeLuxe,
      child: Column(
        children: [
          // Titre de section
          Text(
            'Nos Réalisations',
            style: StylesTexte.titreSectionPremium.copyWith(
              color: CouleursApplication.vertProfondChic,
              fontSize: 28.0,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: DimensionsApplication.espacementGrand),
          
          // Galerie d'images (2 colonnes)
          Row(
            children: [
              // Première réalisation
              Expanded(
                child: _construireCarteRealisation(
                  controleur.imagesGalerieAccueil[0],
                  onTap: () => controleur.voirRealisation(controleur.imagesGalerieAccueil[0]),
                ),
              ),
              
              const SizedBox(width: DimensionsApplication.espacementMoyen),
              
              // Deuxième réalisation
              Expanded(
                child: _construireCarteRealisation(
                  controleur.imagesGalerieAccueil[1],
                  onTap: () => controleur.voirRealisation(controleur.imagesGalerieAccueil[1]),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Construit une carte de réalisation
  Widget _construireCarteRealisation(String cheminImage, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(DimensionsApplication.rayonMoyen),
          boxShadow: [
            BoxShadow(
              color: CouleursApplication.vertProfondChic.withValues(alpha: 0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ImageSecurisee(
          cheminImage: cheminImage,
          hauteur: 180,
          fit: BoxFit.cover,
          rayonCoin: DimensionsApplication.rayonMoyen,
        ),
      ),
    );
  }

  /// Construit la section "Nos Services"
  Widget _construireSectionServices(BuildContext context, AccueilControleur controleur) {
    return Container(
      padding: const EdgeInsets.all(DimensionsApplication.margeEcran),
      child: Column(
        children: [
          // Titre de section
          Text(
            'Nos Services',
            style: StylesTexte.titreSectionPremium.copyWith(
              color: CouleursApplication.vertProfondChic,
              fontSize: 28.0,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: DimensionsApplication.espacementGrand),
          
          // Services en ligne (3 colonnes)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: controleur.services.map((service) {
              return Expanded(
                child: _construireCarteService(
                  service,
                  onTap: () => controleur.selectionnerService(service),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  /// Construit une carte de service circulaire
  Widget _construireCarteService(ServiceJardin service, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: DimensionsApplication.espacementPetit),
        child: Column(
          children: [
            // Icône circulaire
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: CouleursApplication.orElegant,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: CouleursApplication.orElegant.withValues(alpha: 0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(
                service.icone,
                color: CouleursApplication.texteSurSombre,
                size: 40,
              ),
            ),
            
            const SizedBox(height: DimensionsApplication.espacementMoyen),
            
            // Nom du service
            Text(
              service.nom,
              style: StylesTexte.corpsTexte.copyWith(
                fontWeight: FontWeight.w600,
                color: CouleursApplication.vertProfondChic,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  /// Construit la section témoignage client
  Widget _construireSectionTemoignage(BuildContext context, AccueilControleur controleur) {
    final temoignage = controleur.temoignageClient;
    
    return Container(
      margin: const EdgeInsets.all(DimensionsApplication.margeEcran),
      padding: const EdgeInsets.all(DimensionsApplication.espacementGrand),
      decoration: BoxDecoration(
        color: CouleursApplication.surfaceClaire,
        borderRadius: BorderRadius.circular(DimensionsApplication.rayonGrand),
        border: Border.all(
          color: CouleursApplication.bordureAccent,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          // Icône guillemets
          Icon(
            Icons.format_quote,
            size: 48,
            color: CouleursApplication.orElegant,
          ),
          
          const SizedBox(height: DimensionsApplication.espacementMoyen),
          
          // Citation
          Text(
            '"${temoignage['citation']}"',
            style: StylesTexte.citationJardin.copyWith(
              fontSize: 18.0,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: DimensionsApplication.espacementMoyen),
          
          // Auteur
          Text(
            '${temoignage['auteur']}, ${temoignage['statut']}',
            style: StylesTexte.corpsTexteSecondaire.copyWith(
              fontWeight: FontWeight.w600,
              color: CouleursApplication.vertProfondChic,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  /// Affiche la recherche avec délégué personnalisé
  void _afficherRecherche(BuildContext context) {
    showSearch(
      context: context,
      delegate: _RechercheJardinDelegate(),
    );
  }

  /// Construit l'en-tête du drawer avec style premium
  Widget _construireEnteteDrawer(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            CouleursApplication.vertProfondChic,
            Color(0xFF2A4D32), // Nuance plus claire
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icône principale avec accent doré
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: CouleursApplication.orElegant.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(DimensionsApplication.rayonGrand),
              border: Border.all(
                color: CouleursApplication.orElegant,
                width: 2,
              ),
            ),
            child: const Icon(
              Icons.eco,
              size: DimensionsApplication.iconeTresGrande,
              color: CouleursApplication.orElegant,
            ),
          ),
          
          const SizedBox(height: DimensionsApplication.espacementMoyen),
          
          // Titre principal
          Text(
            'Mon Jardin Idéal',
            style: StylesTexte.titrePrincipalDore.copyWith(
              color: CouleursApplication.texteSurSombre,
              fontSize: 22.0,
            ),
          ),
          
          // Sous-titre élégant
          Text(
            'Cultivez votre passion',
            style: StylesTexte.corpsTexteSecondaire.copyWith(
              color: CouleursApplication.orElegant.withValues(alpha: 0.9),
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  /// Construit la liste des éléments du menu drawer
  Widget _construireListeMenuDrawer(BuildContext context, List<ElementMenu> elementsMenu) {
    // Utilise le widget stateful pour gérer l'état du drawer
    return const Expanded(
      child: DrawerStatefulWidget(),
    );
  }

  /// Construit le pied du drawer avec liens utiles
  Widget _construirePiedDrawer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(DimensionsApplication.margeEcran),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: CouleursApplication.bordureAccent,
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(
              Icons.help_outline,
              color: CouleursApplication.orElegant,
              size: DimensionsApplication.iconeMoyenne,
            ),
            title: Text(
              'Aide & Support',
              style: StylesTexte.lienSubtil.copyWith(
                color: CouleursApplication.texteSurSombre,
              ),
            ),
            onTap: () => _afficherAide(context),
          ),
          
          ListTile(
            leading: const Icon(
              Icons.info_outline,
              color: CouleursApplication.orElegant,
              size: DimensionsApplication.iconeMoyenne,
            ),
            title: Text(
              'À propos',
              style: StylesTexte.lienSubtil.copyWith(
                color: CouleursApplication.texteSurSombre,
              ),
            ),
            onTap: () => _afficherAPropos(context),
          ),
        ],
      ),
    );
  }



  /// Affiche l'aide
  void _afficherAide(BuildContext context) {
    Navigator.of(context).pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Aide & Support'),
        content: const Text('Besoin d\'aide ? Consultez notre guide ou contactez notre équipe de support.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Fermer'),
          ),
        ],
      ),
    );
  }

  /// Affiche les informations à propos
  void _afficherAPropos(BuildContext context) {
    Navigator.of(context).pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('À propos'),
        content: const Text('Mon Jardin Idéal v1.0\n\nUne application premium pour gérer et concevoir votre jardin avec passion.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Fermer'),
          ),
        ],
      ),
    );
  }
}

/// Délégué de recherche spécialisé pour l'application jardin
class _RechercheJardinDelegate extends SearchDelegate<String> {
  /// Suggestions de recherche prédéfinies
  final List<String> _suggestions = [
    'Conception de jardin',
    'Piscines et terrasses',
    'Aménagement paysager',
    'Plantation d\'arbres',
    'Entretien pelouse',
    'Arrosage automatique',
    'Débroussaillage',
    'Taille de haies',
  ];

  @override
  String get searchFieldLabel => 'Rechercher dans nos services...';

  @override
  TextStyle get searchFieldStyle => StylesTexte.corpsTexte;

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: CouleursApplication.vertProfondChic,
        foregroundColor: CouleursApplication.texteSurSombre,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: CouleursApplication.vertOlive),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
        tooltip: 'Effacer la recherche',
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, ''),
      tooltip: 'Retour',
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final resultats = _suggestions
        .where((suggestion) => suggestion.toLowerCase().contains(query.toLowerCase()))
        .toList();

    if (resultats.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              size: 64,
              color: CouleursApplication.texteSecondaire,
            ),
            const SizedBox(height: DimensionsApplication.espacementMoyen),
            Text(
              'Aucun résultat pour "$query"',
              style: StylesTexte.titreSecondaire.copyWith(
                color: CouleursApplication.texteSecondaire,
              ),
            ),
            const SizedBox(height: DimensionsApplication.espacementPetit),
            Text(
              'Essayez avec d\'autres mots-clés',
              style: StylesTexte.corpsTexteSecondaire,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: resultats.length,
      padding: const EdgeInsets.all(DimensionsApplication.margeEcran),
      itemBuilder: (context, index) {
        final resultat = resultats[index];
        return Card(
          margin: const EdgeInsets.only(bottom: DimensionsApplication.espacementPetit),
          child: ListTile(
            leading: Container(
              padding: const EdgeInsets.all(DimensionsApplication.espacementPetit),
              decoration: BoxDecoration(
                color: CouleursApplication.orElegant.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(DimensionsApplication.rayonPetit),
              ),
              child: const Icon(
                Icons.eco,
                color: CouleursApplication.orElegant,
              ),
            ),
            title: Text(
              resultat,
              style: StylesTexte.corpsTexte,
            ),
            subtitle: Text(
              'Service de jardinage professionnel',
              style: StylesTexte.corpsTexteSecondaire,
            ),
            onTap: () {
              close(context, resultat);
              // Ici on pourrait naviguer vers la page du service
            },
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty
        ? _suggestions.take(5).toList()
        : _suggestions
            .where((suggestion) => suggestion.toLowerCase().contains(query.toLowerCase()))
            .take(5)
            .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      padding: const EdgeInsets.all(DimensionsApplication.margeEcran),
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          leading: const Icon(
            Icons.search,
            color: CouleursApplication.vertOlive,
          ),
          title: RichText(
            text: TextSpan(
              text: suggestion.substring(0, query.length),
              style: StylesTexte.corpsTexte.copyWith(
                fontWeight: FontWeight.bold,
                color: CouleursApplication.vertProfondChic,
              ),
              children: [
                TextSpan(
                  text: suggestion.substring(query.length),
                  style: StylesTexte.corpsTexte,
                ),
              ],
            ),
          ),
          onTap: () {
            query = suggestion;
            showResults(context);
          },
        );
      },
    );
  }
} 
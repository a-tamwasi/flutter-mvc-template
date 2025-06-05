import 'package:flutter/material.dart';
import 'vue_base.dart';
import '../controllers/jardin_principal_controleur.dart';
import '../constants/couleurs_application.dart';
import '../constants/dimensions_application.dart';
import '../constants/styles_texte.dart';
import '../widgets/element_menu_drawer.dart';


/// Vue principale de l'application jardin avec drawer de navigation
/// Interface élégante utilisant la palette de couleurs premium
class JardinPrincipalVue extends VueBase<JardinPrincipalControleur> {
  const JardinPrincipalVue({
    super.key,
    required super.controleur,
  });

  @override
  PreferredSizeWidget? construireBarreApplication(BuildContext context, JardinPrincipalControleur controleur) {
    return AppBar(
      title: Text(
        controleur.titrePage,
        style: StylesTexte.appBarTitre,
      ),
      backgroundColor: CouleursApplication.vertProfondChic,
      foregroundColor: CouleursApplication.texteSurSombre,
      elevation: DimensionsApplication.hauteurElevation,
      centerTitle: false,
      iconTheme: const IconThemeData(
        color: CouleursApplication.orElegant, // Icônes dorées
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          tooltip: 'Rechercher dans le jardin',
          color: CouleursApplication.orElegant,
          onPressed: () => _afficherRecherche(context, controleur),
        ),
        IconButton(
          icon: const Icon(Icons.more_vert),
          tooltip: 'Plus d\'options',
          color: CouleursApplication.orElegant,
          onPressed: () => _afficherMenuOptions(context, controleur),
        ),
      ],
    );
  }

  @override
  Widget? construireDrawer(BuildContext context, JardinPrincipalControleur controleur) {
    return Drawer(
      backgroundColor: CouleursApplication.vertProfondChic,
      child: Column(
        children: [
          // En-tête du drawer
          _construireEnTeteDrawer(context, controleur),
          
          // Éléments du menu
          Expanded(
            child: _construireListeMenu(context, controleur),
          ),
          
          // Pied du drawer
          _construirePiedDrawer(context, controleur),
        ],
      ),
    );
  }

  @override
  Widget construireContenu(BuildContext context, JardinPrincipalControleur controleur) {
    return Container(
      decoration: const BoxDecoration(
        gradient: CouleursApplication.degradeNaturel,
      ),
      child: _construireCorpsPage(context, controleur),
    );
  }

  /// Construit l'en-tête du drawer avec le nouveau design élégant
  Widget _construireEnTeteDrawer(BuildContext context, JardinPrincipalControleur controleur) {
    return DrawerHeader(
      decoration: const BoxDecoration(
        gradient: CouleursApplication.degradePrincipal,
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

  /// Construit la liste des éléments du menu avec le nouveau style
  Widget _construireListeMenu(BuildContext context, JardinPrincipalControleur controleur) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        vertical: DimensionsApplication.espacementPetit,
      ),
      itemCount: controleur.elementsMenu.length,
      itemBuilder: (context, index) {
        final element = controleur.elementsMenu[index];
        
        return ElementMenuDrawerWidget(
          element: element,
          surSelection: (String idElement) {
            controleur.selectionnerElementMenu(idElement);
            Navigator.of(context).pop();
          },
          surBasculementExpansion: (String idElement) {
            controleur.basculerExpansion(idElement);
          },
        );
      },
    );
  }

  /// Construit le pied du drawer avec style élégant
  Widget _construirePiedDrawer(BuildContext context, JardinPrincipalControleur controleur) {
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
              size: DimensionsApplication.iconePetite,
            ),
            title: Text(
              'Aide & Support',
              style: StylesTexte.lienSubtil.copyWith(
                color: CouleursApplication.texteSurSombre,
              ),
            ),
            onTap: () => _afficherAide(context, controleur),
          ),
          
          ListTile(
            leading: const Icon(
              Icons.info_outline,
              color: CouleursApplication.orElegant,
              size: DimensionsApplication.iconePetite,
            ),
            title: Text(
              'À propos',
              style: StylesTexte.lienSubtil.copyWith(
                color: CouleursApplication.texteSurSombre,
              ),
            ),
            onTap: () => _afficherAPropos(context, controleur),
          ),
        ],
      ),
    );
  }

  /// Construit le corps principal avec le nouveau design
  Widget _construireCorpsPage(BuildContext context, JardinPrincipalControleur controleur) {
    return Container(
      padding: const EdgeInsets.all(DimensionsApplication.margeEcran),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Indicateur de section élégant
          _construireIndicateurSection(context, controleur),
          
          const SizedBox(height: DimensionsApplication.espacementGrand),
          
          // Contenu principal
          Expanded(
            child: _construireContenuPrincipal(context, controleur),
          ),
        ],
      ),
    );
  }

  /// Construit l'indicateur de section avec le nouveau style  
  Widget _construireIndicateurSection(BuildContext context, JardinPrincipalControleur controleur) {
    // Trouve l'élément sélectionné par son ID
    final elementCourant = controleur.elementsMenu.firstWhere(
      (element) => element.id == controleur.idElementSelectionne,
      orElse: () => controleur.elementsMenu.first,
    );
    
    return Container(
      padding: const EdgeInsets.all(DimensionsApplication.espacementGrand),
      decoration: BoxDecoration(
        color: CouleursApplication.surfaceClaire,
        borderRadius: BorderRadius.circular(DimensionsApplication.rayonGrand),
        border: Border.all(
          color: CouleursApplication.bordureAccent,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: CouleursApplication.vertProfondChic.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icône avec fond coloré
          Container(
            padding: const EdgeInsets.all(DimensionsApplication.espacementMoyen),
            decoration: BoxDecoration(
              color: CouleursApplication.orElegant.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(DimensionsApplication.rayonMoyen),
            ),
            child: Icon(
              elementCourant.icone,
              color: CouleursApplication.orElegant,
              size: DimensionsApplication.iconeMoyenne,
            ),
          ),
          
          const SizedBox(width: DimensionsApplication.espacementGrand),
          
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  elementCourant.titre,
                  style: StylesTexte.titrePrincipal.copyWith(
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(height: DimensionsApplication.espacementTresPetit),
                Text(
                  'Section active',
                  style: StylesTexte.conseilJardinage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Construit le contenu principal selon la section sélectionnée
  Widget _construireContenuPrincipal(BuildContext context, JardinPrincipalControleur controleur) {
    final idElementSelectionne = controleur.idElementSelectionne;
    
    // Gestion spécifique pour chaque section
    switch (idElementSelectionne) {
      case 'accueil':
        return _construireContenuAccueil(context, controleur);
      case 'nos-realisations':
        return _construireContenuRealisations(context, controleur);
      case 'nos-services':
        return _construireContenuServices(context, controleur);
      case 'conception-jardin':
      case 'piscines-terrasses':
      case 'amenagement-paysager':
        return _construireContenuService(context, controleur, idElementSelectionne);
      case 'demander-devis':
        return _construireContenuDevis(context, controleur);
      default:
        return _construireContenuDefaut(context, controleur);
    }
  }

  /// Construit le contenu pour la section Accueil
  Widget _construireContenuAccueil(BuildContext context, JardinPrincipalControleur controleur) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(DimensionsApplication.margeEcran),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Message de bienvenue
          Container(
            padding: const EdgeInsets.all(DimensionsApplication.espacementGrand),
            decoration: BoxDecoration(
              gradient: CouleursApplication.degradePrincipal,
              borderRadius: BorderRadius.circular(DimensionsApplication.rayonGrand),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bienvenue dans Mon Jardin Idéal',
                  style: StylesTexte.titrePrincipalDore.copyWith(
                    color: CouleursApplication.texteSurSombre,
                  ),
                ),
                const SizedBox(height: DimensionsApplication.espacementMoyen),
                Text(
                  'Votre tableau de bord pour gérer et planifier votre espace vert avec expertise.',
                  style: StylesTexte.corpsTexte.copyWith(
                    color: CouleursApplication.orElegant.withValues(alpha: 0.9),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: DimensionsApplication.espacementGrand),
          
          // Actions rapides
          Text(
            'Actions Rapides',
            style: StylesTexte.titreSecondaire,
          ),
          const SizedBox(height: DimensionsApplication.espacementMoyen),
          
          Row(
            children: [
              Expanded(
                child: _construireBoutonActionRapide(
                  'Demander un Devis',
                  Icons.request_quote,
                  CouleursApplication.orElegant,
                  () => controleur.selectionnerElementMenu('demander-devis'),
                ),
              ),
              const SizedBox(width: DimensionsApplication.espacementMoyen),
              Expanded(
                child: _construireBoutonActionRapide(
                  'Nos Réalisations',
                  Icons.photo_library,
                  CouleursApplication.vertOlive,
                  () => controleur.selectionnerElementMenu('nos-realisations'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Construit un bouton d'action rapide
  Widget _construireBoutonActionRapide(String titre, IconData icone, Color couleur, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(DimensionsApplication.espacementGrand),
        decoration: BoxDecoration(
          color: couleur.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(DimensionsApplication.rayonMoyen),
          border: Border.all(
            color: couleur.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icone,
              size: DimensionsApplication.iconeTresGrande,
              color: couleur,
            ),
            const SizedBox(height: DimensionsApplication.espacementPetit),
            Text(
              titre,
              style: StylesTexte.corpsTexte.copyWith(
                fontWeight: FontWeight.w600,
                color: couleur,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  /// Construit le contenu pour la section Réalisations
  Widget _construireContenuRealisations(BuildContext context, JardinPrincipalControleur controleur) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(DimensionsApplication.espacementGrand),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.photo_library,
              size: 80,
              color: CouleursApplication.orElegant,
            ),
            const SizedBox(height: DimensionsApplication.espacementGrand),
            Text(
              'Portfolio de nos Créations',
              style: StylesTexte.titreSecondaire,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: DimensionsApplication.espacementMoyen),
            Text(
              'Découvrez nos projets réalisés avec passion et expertise.\nNaviguez vers "Nos réalisations" pour voir la galerie complète.',
              style: StylesTexte.corpsTexte,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  /// Construit le contenu pour la section Services
  Widget _construireContenuServices(BuildContext context, JardinPrincipalControleur controleur) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(DimensionsApplication.espacementGrand),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.build,
              size: 80,
              color: CouleursApplication.vertOlive,
            ),
            const SizedBox(height: DimensionsApplication.espacementGrand),
            Text(
              'Nos Services d\'Excellence',
              style: StylesTexte.titreSecondaire,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: DimensionsApplication.espacementMoyen),
            Text(
              'Explorez nos services spécialisés :\n• Conception de jardin\n• Piscines & Terrasses\n• Aménagement paysager',
              style: StylesTexte.corpsTexte,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  /// Construit le contenu pour un service spécifique
  Widget _construireContenuService(BuildContext context, JardinPrincipalControleur controleur, String serviceId) {
    Map<String, Map<String, dynamic>> servicesInfo = {
      'conception-jardin': {
        'titre': 'Conception de Jardin',
        'icone': Icons.design_services,
        'description': 'Design sur mesure pour créer votre jardin idéal selon vos goûts et contraintes.',
        'couleur': CouleursApplication.vertOlive,
      },
      'piscines-terrasses': {
        'titre': 'Piscines & Terrasses',
        'icone': Icons.pool,
        'description': 'Création d\'espaces de détente avec piscines et terrasses élégantes.',
        'couleur': CouleursApplication.information,
      },
      'amenagement-paysager': {
        'titre': 'Aménagement Paysager',
        'icone': Icons.landscape,
        'description': 'Harmonie naturelle pour transformer votre espace extérieur.',
        'couleur': CouleursApplication.orElegant,
      },
    };

    final serviceInfo = servicesInfo[serviceId] ?? servicesInfo['conception-jardin']!;

    return Center(
      child: Container(
        padding: const EdgeInsets.all(DimensionsApplication.espacementGrand),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              serviceInfo['icone'],
              size: 80,
              color: serviceInfo['couleur'],
            ),
            const SizedBox(height: DimensionsApplication.espacementGrand),
            Text(
              serviceInfo['titre'],
              style: StylesTexte.titreSecondaire,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: DimensionsApplication.espacementMoyen),
            Text(
              serviceInfo['description'],
              style: StylesTexte.corpsTexte,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: DimensionsApplication.espacementGrand),
            ElevatedButton.icon(
              onPressed: () => controleur.selectionnerElementMenu('demander-devis'),
              icon: const Icon(Icons.request_quote),
              label: const Text('Demander un devis'),
              style: ElevatedButton.styleFrom(
                backgroundColor: serviceInfo['couleur'],
                foregroundColor: CouleursApplication.texteSurSombre,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Construit le contenu pour la section Devis
  Widget _construireContenuDevis(BuildContext context, JardinPrincipalControleur controleur) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(DimensionsApplication.espacementGrand),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.request_quote,
              size: 80,
              color: CouleursApplication.orElegant,
            ),
            const SizedBox(height: DimensionsApplication.espacementGrand),
            Text(
              'Demande de Devis Gratuit',
              style: StylesTexte.titreSecondaire,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: DimensionsApplication.espacementMoyen),
            Text(
              'Obtenez une estimation personnalisée pour votre projet.\nGratuit et sans engagement.',
              style: StylesTexte.corpsTexte,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  /// Construit le contenu par défaut
  Widget _construireContenuDefaut(BuildContext context, JardinPrincipalControleur controleur) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(DimensionsApplication.espacementGrand),
        decoration: BoxDecoration(
          color: CouleursApplication.surfaceClaire.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(DimensionsApplication.rayonGrand),
          border: Border.all(
            color: CouleursApplication.bordureClaire,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icône principale avec effet élégant
            Container(
              padding: const EdgeInsets.all(DimensionsApplication.espacementGrand),
              decoration: BoxDecoration(
                gradient: CouleursApplication.degradeDore,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: CouleursApplication.orElegant.withValues(alpha: 0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Icon(
                controleur.elementsMenu.firstWhere(
                  (element) => element.id == controleur.idElementSelectionne,
                  orElse: () => controleur.elementsMenu.first,
                ).icone,
                size: 60,
                color: CouleursApplication.texteSurSombre,
              ),
            ),
            
            const SizedBox(height: DimensionsApplication.espacementGrand),
            
            // Texte de contenu avec style élégant
            Text(
              controleur.obtenirContenuPage(),
              style: StylesTexte.conseilJardinage.copyWith(
                fontSize: 16.0,
                height: 1.6,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  /// Affiche la fonction de recherche
  void _afficherRecherche(BuildContext context, JardinPrincipalControleur controleur) {
    showSearch(
      context: context,
      delegate: _RechercheDelegate(),
    );
  }

  /// Affiche le menu d'options
  void _afficherMenuOptions(BuildContext context, JardinPrincipalControleur controleur) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(DimensionsApplication.margeEcran),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.notifications_outlined),
              title: const Text('Notifications'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.share_outlined),
              title: const Text('Partager'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  /// Affiche l'aide
  void _afficherAide(BuildContext context, JardinPrincipalControleur controleur) {
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
  void _afficherAPropos(BuildContext context, JardinPrincipalControleur controleur) {
    Navigator.of(context).pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('À propos'),
        content: const Text('Mon Jardin Idéal v1.0\n\nUne application pour gérer votre jardin avec passion.'),
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

/// Délégué pour la recherche
class _RechercheDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, ''),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text('Recherche pour: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('Tapez pour rechercher dans votre jardin...'),
    );
  }
} 
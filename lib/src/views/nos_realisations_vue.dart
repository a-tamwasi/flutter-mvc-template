import 'package:flutter/material.dart';
import '../constants/couleurs_application.dart';
import '../constants/dimensions_application.dart';
import '../constants/styles_texte.dart';

/// Vue pour afficher le portfolio des réalisations
/// Présente les projets réalisés avec galerie d'images
class NosRealisationsVue extends StatelessWidget {
  /// Constructeur de la vue des réalisations
  const NosRealisationsVue({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CouleursApplication.surfaceClaire,
      appBar: _construireAppBar(context),
      body: _construireCorps(context),
    );
  }

  /// Construit la barre d'application
  PreferredSizeWidget _construireAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        'Nos Réalisations',
        style: StylesTexte.appBarTitre.copyWith(
          color: CouleursApplication.texteSurSombre,
        ),
      ),
      backgroundColor: CouleursApplication.vertProfondChic,
      foregroundColor: CouleursApplication.texteSurSombre,
      elevation: 0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              CouleursApplication.vertProfondChic,
              Color(0xFF2A4D32),
            ],
          ),
        ),
      ),
    );
  }

  /// Construit le corps principal
  Widget _construireCorps(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(DimensionsApplication.margeEcran),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _construireEntete(),
          const SizedBox(height: DimensionsApplication.espacementGrand),
          _construireGalerieRealisations(context),
        ],
      ),
    );
  }

  /// Construit l'en-tête de la page
  Widget _construireEntete() {
    return Container(
      padding: const EdgeInsets.all(DimensionsApplication.espacementGrand),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            CouleursApplication.vertProfondChic,
            Color(0xFF2A4D32),
          ],
        ),
        borderRadius: BorderRadius.circular(DimensionsApplication.rayonGrand),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(DimensionsApplication.espacementMoyen),
                decoration: BoxDecoration(
                  color: CouleursApplication.orElegant.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(DimensionsApplication.rayonMoyen),
                ),
                child: const Icon(
                  Icons.photo_library,
                  color: CouleursApplication.orElegant,
                  size: DimensionsApplication.iconeTresGrande,
                ),
              ),
              const SizedBox(width: DimensionsApplication.espacementMoyen),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Portfolio de nos Créations',
                      style: StylesTexte.titrePrincipalDore.copyWith(
                        color: CouleursApplication.texteSurSombre,
                      ),
                    ),
                    const SizedBox(height: DimensionsApplication.espacementPetit),
                    Text(
                      'Découvrez nos projets réalisés avec passion et expertise',
                      style: StylesTexte.corpsTexteSecondaire.copyWith(
                        color: CouleursApplication.orElegant.withValues(alpha: 0.9),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Construit la galerie des réalisations
  Widget _construireGalerieRealisations(BuildContext context) {
    final realisations = [
      {
        'titre': 'Jardin Méditerranéen Moderne',
        'description': 'Aménagement paysager complet avec terrasses et massifs colorés',
        'image': 'assets/jardin 1.jpeg',
        'categorie': 'Aménagement Paysager',
        'superficie': '300 m²',
        'duree': '4 semaines',
        'budget': '15 000 - 20 000 €',
        'style': 'Méditerranéen moderne',
        'details': 'Création de terrasses en pierre naturelle, plantation de végétaux méditerranéens résistants, installation d\'un système d\'irrigation automatique et aménagement de zones d\'ombre avec pergolas.',
      },
      {
        'titre': 'Espace Aquatique de Luxe',
        'description': 'Piscine à débordement avec aménagement paysager haut de gamme',
        'image': 'assets/piscine 1.jpeg',
        'categorie': 'Piscines & Terrasses',
        'superficie': '450 m²',
        'duree': '8 semaines',
        'budget': '45 000 - 60 000 €',
        'style': 'Contemporain luxe',
        'details': 'Piscine à débordement avec cascade, terrasses en travertin, éclairage LED subaquatique, espace détente avec mobilier design et végétation tropicale.',
      },
      {
        'titre': 'Jardin Zen Minimaliste',
        'description': 'Conception épurée alliant sérénité et élégance moderne',
        'image': 'assets/jardin 2.jpeg',
        'categorie': 'Conception de Jardin',
        'superficie': '180 m²',
        'duree': '3 semaines',
        'budget': '8 000 - 12 000 €',
        'style': 'Zen minimaliste',
        'details': 'Jardin épuré avec bassin d\'ornement, chemins en gravier japonais, bambous et érables du Japon, banc en bois exotique et éclairage tamisé.',
      },
      {
        'titre': 'Oasis Tropicale Privée',
        'description': 'Transformation en paradis tropical avec piscine naturelle',
        'image': 'assets/piscine 2.jpeg',
        'categorie': 'Piscines & Terrasses',
        'superficie': '380 m²',
        'duree': '6 semaines',
        'budget': '35 000 - 45 000 €',
        'style': 'Tropical exotique',
        'details': 'Piscine aux formes organiques, cascade naturelle, végétation tropicale dense, terrasses en bois exotique et salon de jardin sous pergola végétalisée.',
      },
      {
        'titre': 'Jardin Familial Fonctionnel',
        'description': 'Espace polyvalent pour toute la famille avec zones de jeux',
        'image': 'assets/jardin 3.jpeg',
        'categorie': 'Aménagement Paysager',
        'superficie': '250 m²',
        'duree': '3 semaines',
        'budget': '10 000 - 15 000 €',
        'style': 'Familial moderne',
        'details': 'Pelouse centrale pour les jeux, massifs de plantes colorées, terrasse couverte, potager surélevé et espace barbecue avec rangements intégrés.',
      },
      {
        'titre': 'Spa Extérieur Premium',
        'description': 'Espace bien-être avec jacuzzi et végétation luxuriante',
        'image': 'assets/piscine 3.jpeg',
        'categorie': 'Piscines & Terrasses',
        'superficie': '220 m²',
        'duree': '5 semaines',
        'budget': '28 000 - 35 000 €',
        'style': 'Spa contemporain',
        'details': 'Jacuzzi encastré, douche extérieure, végétation dense pour l\'intimité, éclairage d\'ambiance et terrasses en pierre reconstituée.',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nos Projets Réalisés',
          style: StylesTexte.titreSecondaire,
        ),
        const SizedBox(height: DimensionsApplication.espacementMoyen),
        
        ...realisations.map((realisation) => Container(
          margin: const EdgeInsets.only(bottom: DimensionsApplication.espacementGrand),
          decoration: BoxDecoration(
                         color: CouleursApplication.blancPur,
            borderRadius: BorderRadius.circular(DimensionsApplication.rayonGrand),
            boxShadow: [
              BoxShadow(
                color: CouleursApplication.vertProfondChic.withValues(alpha: 0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image du projet
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(DimensionsApplication.rayonGrand),
                    topRight: Radius.circular(DimensionsApplication.rayonGrand),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(DimensionsApplication.rayonGrand),
                    topRight: Radius.circular(DimensionsApplication.rayonGrand),
                  ),
                  child: Image.asset(
                    realisation['image']!,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 200,
                        color: CouleursApplication.vertOlive.withValues(alpha: 0.1),
                        child: const Center(
                          child: Icon(
                            Icons.landscape,
                            size: 64,
                            color: CouleursApplication.vertOlive,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              
              // Contenu du projet
              Padding(
                padding: const EdgeInsets.all(DimensionsApplication.espacementGrand),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Catégorie
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: DimensionsApplication.espacementMoyen,
                        vertical: DimensionsApplication.espacementPetit,
                      ),
                      decoration: BoxDecoration(
                        color: CouleursApplication.orElegant.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(DimensionsApplication.rayonPetit),
                        border: Border.all(
                          color: CouleursApplication.orElegant.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Text(
                        realisation['categorie']!,
                        style: StylesTexte.libelle.copyWith(
                          color: CouleursApplication.orElegant,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: DimensionsApplication.espacementMoyen),
                    
                    // Titre du projet
                    Text(
                      realisation['titre']!,
                      style: StylesTexte.titreSecondaire.copyWith(
                        fontSize: 20,
                      ),
                    ),
                    
                    const SizedBox(height: DimensionsApplication.espacementPetit),
                    
                    // Description
                    Text(
                      realisation['description']!,
                      style: StylesTexte.corpsTexte,
                    ),
                    
                    const SizedBox(height: DimensionsApplication.espacementMoyen),
                    
                    // Bouton voir plus
                    ElevatedButton.icon(
                      onPressed: () => _voirDetailsProjet(context, realisation['titre']!),
                      icon: const Icon(Icons.visibility),
                      label: const Text('Voir les détails'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CouleursApplication.orElegant,
                        foregroundColor: CouleursApplication.texteSurSombre,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(DimensionsApplication.rayonMoyen),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }

  /// Affiche les détails d'un projet avec dialogue modal élégant
  void _voirDetailsProjet(BuildContext context, String titreProjet) {
    // Récupération des données du projet
    final projetsData = {
      'Jardin Méditerranéen Moderne': {
        'image': 'assets/jardin 1.jpeg',
        'superficie': '300 m²',
        'duree': '4 semaines',
        'budget': '15 000 - 20 000 €',
        'style': 'Méditerranéen moderne',
        'details': 'Création de terrasses en pierre naturelle, plantation de végétaux méditerranéens résistants, installation d\'un système d\'irrigation automatique et aménagement de zones d\'ombre avec pergolas.',
      },
      'Espace Aquatique de Luxe': {
        'image': 'assets/piscine 1.jpeg',
        'superficie': '450 m²',
        'duree': '8 semaines',
        'budget': '45 000 - 60 000 €',
        'style': 'Contemporain luxe',
        'details': 'Piscine à débordement avec cascade, terrasses en travertin, éclairage LED subaquatique, espace détente avec mobilier design et végétation tropicale.',
      },
      'Jardin Zen Minimaliste': {
        'image': 'assets/jardin 2.jpeg',
        'superficie': '180 m²',
        'duree': '3 semaines',
        'budget': '8 000 - 12 000 €',
        'style': 'Zen minimaliste',
        'details': 'Jardin épuré avec bassin d\'ornement, chemins en gravier japonais, bambous et érables du Japon, banc en bois exotique et éclairage tamisé.',
      },
      'Oasis Tropicale Privée': {
        'image': 'assets/piscine 2.jpeg',
        'superficie': '380 m²',
        'duree': '6 semaines',
        'budget': '35 000 - 45 000 €',
        'style': 'Tropical exotique',
        'details': 'Piscine aux formes organiques, cascade naturelle, végétation tropicale dense, terrasses en bois exotique et salon de jardin sous pergola végétalisée.',
      },
      'Jardin Familial Fonctionnel': {
        'image': 'assets/jardin 3.jpeg',
        'superficie': '250 m²',
        'duree': '3 semaines',
        'budget': '10 000 - 15 000 €',
        'style': 'Familial moderne',
        'details': 'Pelouse centrale pour les jeux, massifs de plantes colorées, terrasse couverte, potager surélevé et espace barbecue avec rangements intégrés.',
      },
      'Spa Extérieur Premium': {
        'image': 'assets/piscine 3.jpeg',
        'superficie': '220 m²',
        'duree': '5 semaines',
        'budget': '28 000 - 35 000 €',
        'style': 'Spa contemporain',
        'details': 'Jacuzzi encastré, douche extérieure, végétation dense pour l\'intimité, éclairage d\'ambiance et terrasses en pierre reconstituée.',
      },
    };

    final projetInfo = projetsData[titreProjet] ?? projetsData.values.first;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 500,
              maxHeight: 600, // Limite la hauteur
            ),
            decoration: BoxDecoration(
              color: CouleursApplication.blancPur,
              borderRadius: BorderRadius.circular(DimensionsApplication.rayonGrand),
              boxShadow: [
                BoxShadow(
                  color: CouleursApplication.vertProfondChic.withValues(alpha: 0.2),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // En-tête du dialogue
                Container(
                  padding: const EdgeInsets.all(DimensionsApplication.espacementGrand),
                  decoration: const BoxDecoration(
                    gradient: CouleursApplication.degradePrincipal,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(DimensionsApplication.rayonGrand),
                      topRight: Radius.circular(DimensionsApplication.rayonGrand),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(DimensionsApplication.espacementMoyen),
                        decoration: BoxDecoration(
                          color: CouleursApplication.orElegant.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(DimensionsApplication.rayonMoyen),
                        ),
                        child: const Icon(
                          Icons.info_outline,
                          color: CouleursApplication.orElegant,
                          size: DimensionsApplication.iconeGrande,
                        ),
                      ),
                      const SizedBox(width: DimensionsApplication.espacementMoyen),
                      Expanded(
                        child: Text(
                          'Détails du Projet',
                          style: StylesTexte.titrePrincipalDore.copyWith(
                            color: CouleursApplication.texteSurSombre,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(
                          Icons.close,
                          color: CouleursApplication.orElegant,
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Contenu du dialogue avec scroll
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(DimensionsApplication.espacementGrand),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Titre du projet
                        Text(
                          titreProjet,
                          style: StylesTexte.titreSecondaire.copyWith(
                            color: CouleursApplication.vertProfondChic,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        
                        const SizedBox(height: DimensionsApplication.espacementMoyen),
                        
                        // Image du projet (plus petite)
                        Container(
                          height: 120,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(DimensionsApplication.rayonMoyen),
                            border: Border.all(
                              color: CouleursApplication.vertOlive.withValues(alpha: 0.3),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(DimensionsApplication.rayonMoyen),
                            child: Image.asset(
                              projetInfo['image']!,
                              height: 120,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: 120,
                                  color: CouleursApplication.vertOlive.withValues(alpha: 0.1),
                                  child: const Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.landscape,
                                          size: 48,
                                          color: CouleursApplication.vertOlive,
                                        ),
                                        SizedBox(height: DimensionsApplication.espacementTresPetit),
                                        Text(
                                          'Image du projet',
                                          style: TextStyle(
                                            color: CouleursApplication.vertOlive,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: DimensionsApplication.espacementMoyen),
                        
                        // Informations détaillées
                        Container(
                          padding: const EdgeInsets.all(DimensionsApplication.espacementMoyen),
                          decoration: BoxDecoration(
                            color: CouleursApplication.surfaceClaire,
                            borderRadius: BorderRadius.circular(DimensionsApplication.rayonMoyen),
                            border: Border.all(
                              color: CouleursApplication.bordureClaire,
                              width: 1,
                            ),
                          ),
                          child: Column(
                            children: [
                              _construireInfoProjetAmeliore('Superficie', projetInfo['superficie']!, Icons.square_foot),
                              const Divider(height: DimensionsApplication.espacementMoyen),
                              _construireInfoProjetAmeliore('Durée du projet', projetInfo['duree']!, Icons.schedule),
                              const Divider(height: DimensionsApplication.espacementMoyen),
                              _construireInfoProjetAmeliore('Budget', projetInfo['budget']!, Icons.euro),
                              const Divider(height: DimensionsApplication.espacementMoyen),
                              _construireInfoProjetAmeliore('Style', projetInfo['style']!, Icons.palette),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: DimensionsApplication.espacementMoyen),
                        
                        // Description (plus compacte)
                        Container(
                          padding: const EdgeInsets.all(DimensionsApplication.espacementMoyen),
                          decoration: BoxDecoration(
                            color: CouleursApplication.information.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(DimensionsApplication.rayonPetit),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Description du projet',
                                style: StylesTexte.corpsTexte.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: CouleursApplication.information,
                                ),
                              ),
                              const SizedBox(height: DimensionsApplication.espacementPetit),
                              Text(
                                projetInfo['details']!,
                                style: StylesTexte.corpsTexte.copyWith(
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: DimensionsApplication.espacementMoyen),
                        
                        // Boutons d'action
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pushNamed('/demander-devis');
                                },
                                label: const Text('Devis Similaire'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: CouleursApplication.orElegant,
                                  foregroundColor: CouleursApplication.texteSurSombre,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(DimensionsApplication.rayonMoyen),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: DimensionsApplication.espacementMoyen),
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () => Navigator.of(context).pop(),
                                icon: const Icon(Icons.close),
                                label: const Text('Fermer'),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: CouleursApplication.vertProfondChic,
                                  side: const BorderSide(
                                    color: CouleursApplication.bordureClaire,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(DimensionsApplication.rayonMoyen),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Construit une ligne d'information pour le projet (version améliorée)
  Widget _construireInfoProjetAmeliore(String label, String valeur, IconData icone) {
    return Row(
      children: [
        // Icône
        Container(
          padding: const EdgeInsets.all(DimensionsApplication.espacementPetit),
          decoration: BoxDecoration(
            color: CouleursApplication.vertOlive.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(DimensionsApplication.rayonPetit),
          ),
          child: Icon(
            icone,
            size: DimensionsApplication.iconeMoyenne,
            color: CouleursApplication.vertOlive,
          ),
        ),
        
        const SizedBox(width: DimensionsApplication.espacementMoyen),
        
        // Contenu
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: StylesTexte.libelle.copyWith(
                  color: CouleursApplication.texteSecondaire,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                valeur,
                style: StylesTexte.corpsTexte.copyWith(
                  fontWeight: FontWeight.w600,
                  color: CouleursApplication.vertProfondChic,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }


} 
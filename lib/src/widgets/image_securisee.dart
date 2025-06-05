import 'package:flutter/material.dart';
import '../constants/couleurs_application.dart';
import '../constants/dimensions_application.dart';

/// Widget sécurisé pour l'affichage d'images avec gestion d'erreur
/// Inclut un état de chargement et une image de fallback
class ImageSecurisee extends StatelessWidget {
  /// Chemin de l'image à afficher
  final String cheminImage;
  
  /// Largeur de l'image (optionnelle)
  final double? largeur;
  
  /// Hauteur de l'image (optionnelle)
  final double? hauteur;
  
  /// Ajustement de l'image
  final BoxFit fit;
  
  /// Rayon des coins arrondis
  final double rayonCoin;
  
  /// Icône de fallback en cas d'erreur
  final IconData iconeFallback;
  
  /// Couleur de l'icône de fallback
  final Color couleurIconeFallback;
  
  /// Afficher l'indicateur de chargement
  final bool afficherChargement;

  /// Constructeur du widget d'image sécurisée
  const ImageSecurisee({
    super.key,
    required this.cheminImage,
    this.largeur,
    this.hauteur,
    this.fit = BoxFit.cover,
    this.rayonCoin = DimensionsApplication.rayonMoyen,
    this.iconeFallback = Icons.image_not_supported_outlined,
    this.couleurIconeFallback = CouleursApplication.vertOlive,
    this.afficherChargement = true,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(rayonCoin),
      child: Container(
        width: largeur,
        height: hauteur,
        decoration: BoxDecoration(
          color: CouleursApplication.cremeBeigeLuxe,
          borderRadius: BorderRadius.circular(rayonCoin),
        ),
        child: Image.asset(
          cheminImage,
          width: largeur,
          height: hauteur,
          fit: fit,
          errorBuilder: _construireWidgetErreur,
        ),
      ),
    );
  }



  /// Construit le widget d'erreur avec icône de fallback
  Widget _construireWidgetErreur(
    BuildContext context,
    Object error,
    StackTrace? stackTrace,
  ) {
    debugPrint('Erreur de chargement d\'image: $cheminImage - $error');
    
    return Container(
      width: largeur,
      height: hauteur,
      decoration: BoxDecoration(
        color: CouleursApplication.cremeBeigeLuxe,
        borderRadius: BorderRadius.circular(rayonCoin),
        border: Border.all(
                        color: CouleursApplication.vertOlive.withValues(alpha: 0.3),
          width: 1.0,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconeFallback,
              size: 48.0,
              color: couleurIconeFallback.withValues(alpha: 0.6),
            ),
            const SizedBox(height: DimensionsApplication.espacementPetit),
            Text(
              'Image indisponible',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: CouleursApplication.vertProfondChic.withValues(alpha: 0.7),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

/// Widget spécialisé pour les images hero avec overlay de texte
class ImageHero extends StatelessWidget {
  /// Chemin de l'image hero
  final String cheminImage;
  
  /// Hauteur de l'image hero
  final double hauteur;
  
  /// Widget enfant à superposer (généralement du texte)
  final Widget? enfant;
  
  /// Gradient d'overlay (optionnel)
  final Gradient? gradientOverlay;

  /// Constructeur de l'image hero
  const ImageHero({
    super.key,
    required this.cheminImage,
    this.hauteur = 400.0,
    this.enfant,
    this.gradientOverlay,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image de fond
        ImageSecurisee(
          cheminImage: cheminImage,
          hauteur: hauteur,
          largeur: double.infinity,
          fit: BoxFit.cover,
          rayonCoin: 0.0, // Hero images sans coins arrondis
        ),
        
        // Overlay de gradient si fourni
        if (gradientOverlay != null)
          Container(
            height: hauteur,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: gradientOverlay,
            ),
          ),
        
        // Contenu superposé
        if (enfant != null)
          Positioned.fill(
            child: enfant!,
          ),
      ],
    );
  }
} 
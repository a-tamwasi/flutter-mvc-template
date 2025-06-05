import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'src/constants/couleurs_application.dart';
import 'src/views/accueil_vue.dart';
import 'src/views/nos_realisations_vue.dart';
import 'src/views/demander_devis_vue.dart';
import 'src/controllers/accueil_controleur.dart';

void main() => runApp(const MonApp());

/// Application principale "Mon Jardin Idéal"
/// Service premium de conception & rénovation de jardins haut de gamme
class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon Jardin Idéal - Jardins Premium',
      theme: _construireThemePremium(),
      initialRoute: '/',
      routes: _construireRoutes(),
      debugShowCheckedModeBanner: false, // Masquer le banner debug pour un look plus propre
    );
  }

  /// Construit les routes de navigation de l'application
  Map<String, WidgetBuilder> _construireRoutes() {
    return {
      '/': (context) => AccueilVue(controleur: AccueilControleur()),
      '/realisations': (context) => const NosRealisationsVue(),
      '/nos-realisations': (context) => const NosRealisationsVue(),
      '/demander-devis': (context) => const DemanderDevisVue(),
      '/devis': (context) => const DemanderDevisVue(), // Alias pour compatibilité
      '/services/conception-jardin': (context) => const ServiceTemporaireVue(titre: 'Conception de Jardin'),
      '/services/piscines-terrasses': (context) => const ServiceTemporaireVue(titre: 'Piscines & Terrasses'),
      '/services/amenagement-paysager': (context) => const ServiceTemporaireVue(titre: 'Aménagement Paysager'),
      '/service-temporaire': (context) => const ServiceTemporaireVue(titre: 'Service en développement'),
    };
  }

  /// Construit le thème premium avec les polices Google Fonts
  ThemeData _construireThemePremium() {
    return ThemeData(
      // Couleur primaire de l'application
      primarySwatch: CouleursApplication.primaire,
      primaryColor: CouleursApplication.vertProfondChic,
      
      // Typographie premium avec Google Fonts
      textTheme: GoogleFonts.loraTextTheme().copyWith(
        // Titres avec Playfair Display
        displayLarge: GoogleFonts.playfairDisplay(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
          color: CouleursApplication.vertProfondChic,
        ),
        displayMedium: GoogleFonts.playfairDisplay(
          fontSize: 28.0,
          fontWeight: FontWeight.w600,
          color: CouleursApplication.vertProfondChic,
        ),
        displaySmall: GoogleFonts.playfairDisplay(
          fontSize: 24.0,
          fontWeight: FontWeight.w500,
          color: CouleursApplication.orElegant,
        ),
        
        // Corps de texte avec Lora
        bodyLarge: GoogleFonts.lora(
          fontSize: 16.0,
          color: CouleursApplication.textePrimaire,
          height: 1.6,
        ),
        bodyMedium: GoogleFonts.lora(
          fontSize: 14.0,
          color: CouleursApplication.texteSecondaire,
          height: 1.5,
        ),
        
        // Titres AppBar avec Playfair Display
        titleLarge: GoogleFonts.playfairDisplay(
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
          color: CouleursApplication.texteSurSombre,
        ),
      ),
      
      // Couleurs de surface
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: CouleursApplication.primaire,
      ).copyWith(
        surface: CouleursApplication.surfaceClaire,
        onSurface: CouleursApplication.textePrimaire,
        secondary: CouleursApplication.orElegant,
        onSecondary: CouleursApplication.vertProfondChic,
      ),
      
      // Configuration de l'AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: CouleursApplication.vertProfondChic,
        foregroundColor: CouleursApplication.texteSurSombre,
        titleTextStyle: GoogleFonts.playfairDisplay(
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
          color: CouleursApplication.texteSurSombre,
        ),
        iconTheme: const IconThemeData(
          color: CouleursApplication.orElegant,
        ),
        elevation: 0, // AppBar moderne sans ombre
      ),
      
      // Configuration des boutons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: CouleursApplication.vertProfondChic,
          foregroundColor: CouleursApplication.texteSurSombre,
          textStyle: GoogleFonts.lora(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

/// Page temporaire pour les services en cours de développement
class ServiceTemporaireVue extends StatelessWidget {
  /// Titre du service
  final String titre;

  /// Constructeur
  const ServiceTemporaireVue({super.key, required this.titre});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titre),
        backgroundColor: CouleursApplication.vertProfondChic,
        foregroundColor: CouleursApplication.texteSurSombre,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.construction,
                size: 80,
                color: CouleursApplication.orElegant,
              ),
              const SizedBox(height: 20),
            Text(
                titre,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: CouleursApplication.vertProfondChic,
            ),
                textAlign: TextAlign.center,
        ),
              const SizedBox(height: 10),
              const Text(
                'Cette page est en cours de développement.\nRevenez bientôt !',
                style: TextStyle(
                  fontSize: 16,
                  color: CouleursApplication.texteSecondaire,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

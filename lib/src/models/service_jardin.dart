import 'package:flutter/material.dart';

/// Modèle représentant un service de jardinage premium
/// Utilisé pour la section "Nos Services" de la page d'accueil
class ServiceJardin {
  /// Icône représentant le service
  final IconData icone;
  
  /// Nom du service
  final String nom;
  
  /// Description détaillée du service
  final String description;
  
  /// Couleur thématique du service
  final Color couleurTheme;
  
  /// Indique si c'est un service premium
  final bool estPremium;

  const ServiceJardin({
    required this.icone,
    required this.nom,
    required this.description,
    required this.couleurTheme,
    this.estPremium = false,
  });

  /// Services prédéfinis de l'entreprise "Mon Jardin Idéal"
  static const List<ServiceJardin> servicesDisponibles = [
    ServiceJardin(
      icone: Icons.eco_outlined,
      nom: 'Conception\nPaysagère',
      description: 'Création sur mesure de jardins d\'exception alliant esthétique et durabilité environnementale.',
      couleurTheme: Color(0xFF1F3D2A), // Vert profond chic
      estPremium: true,
    ),
    
    ServiceJardin(
      icone: Icons.foundation_outlined,
      nom: 'Aménagement\nExtérieur',
      description: 'Réalisation complète de vos espaces extérieurs : terrasses, piscines intégrées, éclairage.',
      couleurTheme: Color(0xFFC9A64D), // Or élégant
      estPremium: true,
    ),
    
    ServiceJardin(
      icone: Icons.local_florist_outlined,
      nom: 'Entretien\nPaysager',
      description: 'Maintenance experte de vos jardins pour préserver leur beauté en toutes saisons.',
      couleurTheme: Color(0xFF8A9A5B), // Vert olive
    ),
  ];

  /// Obtient un service par son nom
  static ServiceJardin? obtenirServiceParNom(String nom) {
    try {
      return servicesDisponibles.firstWhere(
        (service) => service.nom.replaceAll('\n', ' ') == nom,
      );
    } catch (e) {
      return null;
    }
  }

  /// Obtient tous les services premium
  static List<ServiceJardin> get servicesPremium {
    return servicesDisponibles.where((service) => service.estPremium).toList();
  }
} 
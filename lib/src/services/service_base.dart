import 'package:flutter/foundation.dart';

/// Classe abstraite de base pour tous les services de l'application
/// Définit l'interface commune et les fonctionnalités partagées
abstract class ServiceBase {
  /// Indique si le service est initialisé
  bool _estInitialise = false;

  /// Getter pour savoir si le service est initialisé
  bool get estInitialise => _estInitialise;

  /// Initialise le service
  /// Cette méthode doit être implémentée dans chaque service concret
  Future<void> initialiser() async {
    if (_estInitialise) {
      return;
    }
    
    await surInitialisation();
    _estInitialise = true;
  }

  /// Méthode d'initialisation spécifique au service
  /// À surcharger dans les classes filles
  Future<void> surInitialisation() async {
    // Implémentation par défaut vide
  }

  /// Nettoie les ressources du service
  /// À surcharger dans les classes filles si nécessaire
  Future<void> dispose() async {
    _estInitialise = false;
  }

  /// Vérifie que le service est initialisé avant utilisation
  void verifierInitialisation() {
    if (!_estInitialise) {
      throw StateError('Le service $runtimeType doit être initialisé avant utilisation');
    }
  }

  /// Gère les erreurs de manière standardisée
  Exception gererErreur(dynamic erreur, String contexte) {
    final messageErreur = 'Erreur dans $runtimeType - $contexte: $erreur';
    
    // Log de l'erreur (à remplacer par un vrai système de logging)
    // Utilisation temporaire de print en debug uniquement
    assert(() {
      debugPrint(messageErreur);
      return true;
    }());
    
    if (erreur is Exception) {
      return erreur;
    }
    
    return Exception(messageErreur);
  }

  /// Exécute une opération avec gestion d'erreur automatique
  Future<T> executerAvecGestionErreur<T>(
    Future<T> Function() operation,
    String contexte,
  ) async {
    try {
      verifierInitialisation();
      return await operation();
    } catch (erreur) {
      throw gererErreur(erreur, contexte);
    }
  }
} 
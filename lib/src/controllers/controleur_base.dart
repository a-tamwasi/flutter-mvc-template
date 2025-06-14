import 'package:flutter/foundation.dart';

/// Type de fonction pour la navigation
typedef FonctionNavigation = void Function(String route);

/// Classe abstraite de base pour tous les contrôleurs de l'application
/// Implémente le pattern MVC en gérant les interactions entre modèles et vues
abstract class ControleurBase extends ChangeNotifier {
  /// Fonction de navigation injectée depuis la vue
  FonctionNavigation? _fonctionNavigation;

  /// Indique si le contrôleur est en cours de chargement
  bool _estEnChargement = false;

  /// Getter pour l'état de chargement
  bool get estEnChargement => _estEnChargement;

  /// Message d'erreur actuel
  String? _messageErreur;

  /// Getter pour le message d'erreur
  String? get messageErreur => _messageErreur;

  /// Met à jour l'état de chargement et notifie les écouteurs
  @protected
  void definirChargement(bool valeur) {
    if (_estEnChargement != valeur) {
      _estEnChargement = valeur;
      notifierChangement();
    }
  }

  /// Met à jour le message d'erreur et notifie les écouteurs
  @protected
  void definirErreur(String? erreur) {
    if (_messageErreur != erreur) {
      _messageErreur = erreur;
      notifierChangement();
    }
  }

  /// Efface l'erreur courante
  void effacerErreur() {
    definirErreur(null);
  }

  /// Notifie les écouteurs des changements
  @protected
  void notifierChangement() {
    if (!isDisposed) {
      notifyListeners();
    }
  }

  /// Configure la fonction de navigation
  void configurerNavigation(FonctionNavigation fonction) {
    _fonctionNavigation = fonction;
  }

  /// Navigue vers une route spécifiée
  @protected
  void naviguerVers(String route) {
    _fonctionNavigation?.call(route);
  }

  /// Méthode d'initialisation du contrôleur
  /// À surcharger dans les classes filles si nécessaire
  @mustCallSuper
  void initialiser() {
    // Implémentation de base vide
  }

  /// Méthode de nettoyage du contrôleur
  @override
  @mustCallSuper
  void dispose() {
    super.dispose();
  }

  /// Indique si le contrôleur a été disposé
  bool get isDisposed => !hasListeners;
} 
import 'package:flutter/material.dart';
import '../controllers/controleur_base.dart';

/// Classe abstraite de base pour toutes les vues de l'application
/// Implémente le pattern MVC en gérant l'affichage et les interactions utilisateur
abstract class VueBase<T extends ControleurBase> extends StatefulWidget {
  /// Contrôleur associé à cette vue
  final T controleur;

  const VueBase({
    super.key,
    required this.controleur,
  });

  @override
  State<VueBase<T>> createState() => _VueBaseState<T>();

  /// Construit le contenu principal de la vue
  /// Cette méthode doit être implémentée dans chaque vue concrète
  Widget construireContenu(BuildContext context, T controleur);

  /// Construit l'AppBar de la vue (optionnel)
  PreferredSizeWidget? construireBarreApplication(BuildContext context, T controleur) {
    return null;
  }

  /// Construit le drawer de la vue (optionnel)
  Widget? construireDrawer(BuildContext context, T controleur) {
    return null;
  }

  /// Actions à effectuer lors de l'initialisation de la vue
  void surInitialisation(BuildContext context, T controleur) {
    // Implémentation par défaut vide
  }

  /// Actions à effectuer lors de la destruction de la vue
  void surDestruction(BuildContext context, T controleur) {
    // Implémentation par défaut vide
  }
}

/// État de base pour toutes les vues
class _VueBaseState<T extends ControleurBase> extends State<VueBase<T>> {
  @override
  void initState() {
    super.initState();
    
    // Écoute les changements du contrôleur
    widget.controleur.addListener(_surChangementControleur);
    
    // Configure la navigation du contrôleur
    widget.controleur.configurerNavigation((String route) {
      if (mounted) {
        Navigator.of(context).pushNamed(route);
      }
    });
    
    // Initialise le contrôleur si nécessaire
    widget.controleur.initialiser();
    
    // Appelle l'initialisation personnalisée de la vue
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        widget.surInitialisation(context, widget.controleur);
      }
    });
  }

  @override
  void dispose() {
    widget.surDestruction(context, widget.controleur);
    widget.controleur.removeListener(_surChangementControleur);
    super.dispose();
  }

  /// Callback appelé quand le contrôleur change
  void _surChangementControleur() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.construireBarreApplication(context, widget.controleur),
      drawer: widget.construireDrawer(context, widget.controleur),
      body: widget.construireContenu(context, widget.controleur),
    );
  }
} 
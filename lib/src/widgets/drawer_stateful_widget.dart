import 'package:flutter/material.dart';
import '../controllers/drawer_controleur.dart';
import '../widgets/element_menu_drawer.dart';
import '../constants/dimensions_application.dart';

/// Widget stateful pour gérer l'état du drawer
/// Gère l'expansion des menus et la navigation
class DrawerStatefulWidget extends StatefulWidget {
  /// Constructeur du widget
  const DrawerStatefulWidget({super.key});

  @override
  State<DrawerStatefulWidget> createState() => _DrawerStatefulWidgetState();
}

/// État du widget drawer
class _DrawerStatefulWidgetState extends State<DrawerStatefulWidget> {
  /// Contrôleur pour gérer l'état du drawer
  late final DrawerControleur _drawerControleur;

  @override
  void initState() {
    super.initState();
    _drawerControleur = DrawerControleur();
    // Écoute les changements du contrôleur
    _drawerControleur.addListener(_mettreAJourInterface);
  }

  @override
  void dispose() {
    _drawerControleur.removeListener(_mettreAJourInterface);
    _drawerControleur.dispose();
    super.dispose();
  }

  /// Met à jour l'interface quand l'état change
  void _mettreAJourInterface() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        vertical: DimensionsApplication.espacementPetit,
      ),
      itemCount: _drawerControleur.elementsMenu.length,
      itemBuilder: (context, index) {
        final element = _drawerControleur.elementsMenu[index];
        
        return ElementMenuDrawerWidget(
          element: element,
          surSelection: (String idElement) {
            _drawerControleur.selectionnerElement(idElement, context);
          },
          surBasculementExpansion: (String idElement) {
            _drawerControleur.basculerExpansion(idElement);
          },
        );
      },
    );
  }
} 
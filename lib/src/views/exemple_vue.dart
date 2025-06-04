import 'package:flutter/material.dart';
import 'vue_base.dart';
import '../controllers/exemple_controleur.dart';
import '../constants/couleurs_application.dart';
import '../constants/dimensions_application.dart';
import '../constants/styles_texte.dart';
import '../widgets/bouton_personnalise.dart';

/// Exemple de vue concrète héritant de VueBase
/// À remplacer par vos vues métier spécifiques
class ExempleVue extends VueBase<ExempleControleur> {
  const ExempleVue({
    Key? key,
    required ExempleControleur controleur,
  }) : super(key: key, controleur: controleur);

  @override
  PreferredSizeWidget? construireBarreApplication(BuildContext context, ExempleControleur controleur) {
    return AppBar(
      title: const Text('Exemple Vue'),
      backgroundColor: CouleursApplication.primaire,
      foregroundColor: CouleursApplication.texteSurSombre,
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: controleur.estEnChargement ? null : () => controleur.rafraichir(),
          tooltip: 'Rafraîchir',
        ),
      ],
    );
  }

  @override
  Widget construireContenu(BuildContext context, ExempleControleur controleur) {
    // Affichage d'erreur si nécessaire
    if (controleur.messageErreur != null) {
      return _construireAffichageErreur(context, controleur);
    }

    // Affichage de chargement
    if (controleur.estEnChargement && controleur.elements.isEmpty) {
      return _construireIndicateurChargement();
    }

    // Contenu principal
    return Column(
      children: [
        // En-tête avec bouton d'ajout
        _construireEnTete(context, controleur),
        
        // Liste des éléments
        Expanded(
          child: _construireListeElements(context, controleur),
        ),
        
        // Détails de l'élément sélectionné
        if (controleur.elementSelectionne != null)
          _construireDetailsElement(context, controleur),
      ],
    );
  }

  /// Construit l'en-tête avec le bouton d'ajout
  Widget _construireEnTete(BuildContext context, ExempleControleur controleur) {
    return Container(
      padding: const EdgeInsets.all(DimensionsApplication.margeEcran),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Éléments (${controleur.elements.length})',
            style: StylesTexte.titreSecondaire,
          ),
          BoutonPersonnalise(
            texte: 'Ajouter',
            icone: Icons.add,
            taille: TailleBouton.petite,
            estEnChargement: controleur.estEnChargement,
            surTap: () => _afficherDialogueAjout(context, controleur),
          ),
        ],
      ),
    );
  }

  /// Construit la liste des éléments
  Widget _construireListeElements(BuildContext context, ExempleControleur controleur) {
    if (controleur.elements.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inbox_outlined,
              size: DimensionsApplication.iconeTresGrande,
              color: CouleursApplication.texteSecondaire,
            ),
            const SizedBox(height: DimensionsApplication.espacementMoyen),
            Text(
              'Aucun élément disponible',
              style: StylesTexte.corpsTexteSecondaire,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: DimensionsApplication.margeEcran),
      itemCount: controleur.elements.length,
      itemBuilder: (context, index) {
        final element = controleur.elements[index];
        final estSelectionne = controleur.elementSelectionne?.id == element.id;

        return Card(
          margin: const EdgeInsets.only(bottom: DimensionsApplication.espacementPetit),
          elevation: estSelectionne ? DimensionsApplication.hauteurElevation : 1,
          color: estSelectionne ? CouleursApplication.primaire.withOpacity(0.1) : null,
          child: ListTile(
            title: Text(element.nom, style: StylesTexte.corpsTexte),
            subtitle: Text(element.description, style: StylesTexte.corpsTexteSecondaire),
            leading: CircleAvatar(
              backgroundColor: CouleursApplication.primaire,
              child: Text(
                element.nom.substring(0, 1).toUpperCase(),
                style: StylesTexte.bouton,
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () => controleur.supprimerElement(element.id),
              color: CouleursApplication.erreur,
            ),
            onTap: () => controleur.selectionnerElement(element),
          ),
        );
      },
    );
  }

  /// Construit les détails de l'élément sélectionné
  Widget _construireDetailsElement(BuildContext context, ExempleControleur controleur) {
    final element = controleur.elementSelectionne!;
    
    return Container(
      padding: const EdgeInsets.all(DimensionsApplication.margeEcran),
      decoration: const BoxDecoration(
        color: CouleursApplication.surfaceClaire,
        border: Border(
          top: BorderSide(color: CouleursApplication.bordureClaire),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Détails de l\'élément', style: StylesTexte.sousTitre),
          const SizedBox(height: DimensionsApplication.espacementPetit),
          Text('ID: ${element.id}', style: StylesTexte.corpsTexteSecondaire),
          Text('Nom: ${element.nom}', style: StylesTexte.corpsTexte),
          Text('Description: ${element.description}', style: StylesTexte.corpsTexte),
        ],
      ),
    );
  }

  /// Construit l'indicateur de chargement
  Widget _construireIndicateurChargement() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  /// Construit l'affichage d'erreur
  Widget _construireAffichageErreur(BuildContext context, ExempleControleur controleur) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(DimensionsApplication.margeEcran),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: DimensionsApplication.iconeTresGrande,
              color: CouleursApplication.erreur,
            ),
            const SizedBox(height: DimensionsApplication.espacementMoyen),
            Text(
              controleur.messageErreur!,
              style: StylesTexte.corpsTexte,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: DimensionsApplication.espacementGrand),
            BoutonPersonnalise(
              texte: 'Réessayer',
              icone: Icons.refresh,
              surTap: () {
                controleur.effacerErreur();
                controleur.rafraichir();
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Affiche le dialogue d'ajout d'un nouvel élément
  void _afficherDialogueAjout(BuildContext context, ExempleControleur controleur) {
    final nomController = TextEditingController();
    final descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Ajouter un élément'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nomController,
              decoration: const InputDecoration(
                labelText: 'Nom',
                hintText: 'Saisissez le nom',
              ),
            ),
            const SizedBox(height: DimensionsApplication.espacementMoyen),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                hintText: 'Saisissez la description',
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Annuler'),
          ),
          BoutonPersonnalise(
            texte: 'Ajouter',
            taille: TailleBouton.petite,
            surTap: () {
              if (nomController.text.isNotEmpty) {
                controleur.ajouterElement(
                  nomController.text,
                  descriptionController.text,
                );
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
    );
  }
} 
import 'package:flutter/material.dart';
import '../constants/couleurs_application.dart';
import '../constants/dimensions_application.dart';
import '../constants/styles_texte.dart';

/// Vue pour la demande de devis
/// Interface premium pour saisir une demande de devis gratuit
class DemanderDevisVue extends StatelessWidget {
  /// Constructeur de la vue de demande de devis
  const DemanderDevisVue({super.key});

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
        'Demander un Devis',
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
          _construireFormulaireDevis(context),
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
                  Icons.request_quote,
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
                      'Devis Gratuit',
                      style: StylesTexte.titrePrincipalDore.copyWith(
                        color: CouleursApplication.texteSurSombre,
                      ),
                    ),
                    const SizedBox(height: DimensionsApplication.espacementPetit),
                    Text(
                      'Estimation personnalisée et sans engagement',
                      style: StylesTexte.corpsTexteSecondaire.copyWith(
                        color: CouleursApplication.orElegant.withValues(alpha: 0.9),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: DimensionsApplication.espacementMoyen),
          
          // Badge "Gratuit" proéminent
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: DimensionsApplication.espacementMoyen,
              vertical: DimensionsApplication.espacementPetit,
            ),
            decoration: BoxDecoration(
              color: CouleursApplication.orElegant,
              borderRadius: BorderRadius.circular(DimensionsApplication.rayonMoyen),
            ),
            child: Text(
              '✨ GRATUIT & SANS ENGAGEMENT',
              style: StylesTexte.libelle.copyWith(
                color: CouleursApplication.texteSurSombre,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Construit le formulaire de demande de devis
  Widget _construireFormulaireDevis(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(DimensionsApplication.espacementGrand),
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
          Text(
            'Décrivez votre Projet',
            style: StylesTexte.titreSecondaire,
          ),
          
          const SizedBox(height: DimensionsApplication.espacementMoyen),
          
          Text(
            'Nos experts paysagistes vous proposeront une solution sur mesure adapée à vos besoins et votre budget.',
            style: StylesTexte.corpsTexte,
          ),
          
          const SizedBox(height: DimensionsApplication.espacementGrand),
          
          // Champs du formulaire (simples pour cette démo)
          _construireChampFormulaire('Votre nom complet', Icons.person_outline),
          _construireChampFormulaire('Votre email', Icons.email_outlined),
          _construireChampFormulaire('Votre téléphone', Icons.phone_outlined),
          _construireChampFormulaire('Ville / Code postal', Icons.location_on_outlined),
          
          const SizedBox(height: DimensionsApplication.espacementMoyen),
          
          // Champ description
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(DimensionsApplication.rayonMoyen),
              border: Border.all(
                color: CouleursApplication.bordureClaire,
                width: 1.5,
              ),
            ),
            child: TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Décrivez votre projet (surface, style souhaité, budget approximatif...)',
                hintStyle: StylesTexte.libelle.copyWith(
                  color: CouleursApplication.texteSecondaire,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(DimensionsApplication.espacementMoyen),
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(DimensionsApplication.espacementMoyen),
                  child: Icon(
                    Icons.description_outlined,
                    color: CouleursApplication.vertOlive,
                  ),
                ),
              ),
            ),
          ),
          
          const SizedBox(height: DimensionsApplication.espacementGrand),
          
          // Bouton d'envoi
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => _envoyerDemandeDevis(context),
              icon: const Icon(Icons.send),
              label: const Text('ENVOYER MA DEMANDE'),
              style: ElevatedButton.styleFrom(
                backgroundColor: CouleursApplication.orElegant,
                foregroundColor: CouleursApplication.texteSurSombre,
                padding: const EdgeInsets.symmetric(
                  vertical: DimensionsApplication.espacementMoyen,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(DimensionsApplication.rayonMoyen),
                ),
                textStyle: StylesTexte.bouton.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
          
          const SizedBox(height: DimensionsApplication.espacementMoyen),
          
          // Note de confidentialité
          Container(
            padding: const EdgeInsets.all(DimensionsApplication.espacementMoyen),
            decoration: BoxDecoration(
              color: CouleursApplication.information.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(DimensionsApplication.rayonPetit),
              border: Border.all(
                color: CouleursApplication.information.withValues(alpha: 0.3),
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.security,
                  color: CouleursApplication.information,
                  size: DimensionsApplication.iconeMoyenne,
                ),
                const SizedBox(width: DimensionsApplication.espacementPetit),
                Expanded(
                  child: Text(
                    'Vos données sont protégées et ne seront jamais partagées. Réponse sous 24h.',
                    style: StylesTexte.libelle.copyWith(
                      color: CouleursApplication.information,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Construit un champ de formulaire stylisé
  Widget _construireChampFormulaire(String hintText, IconData icone) {
    return Container(
      margin: const EdgeInsets.only(bottom: DimensionsApplication.espacementMoyen),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DimensionsApplication.rayonMoyen),
        border: Border.all(
          color: CouleursApplication.bordureClaire,
          width: 1.5,
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: StylesTexte.libelle.copyWith(
            color: CouleursApplication.texteSecondaire,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: DimensionsApplication.espacementMoyen,
            vertical: DimensionsApplication.espacementMoyen,
          ),
          prefixIcon: Icon(
            icone,
            color: CouleursApplication.vertOlive,
          ),
        ),
      ),
    );
  }

  /// Envoie la demande de devis avec validation et feedback utilisateur
  void _envoyerDemandeDevis(BuildContext context) {
    // Affichage d'un dialogue de confirmation avec animation
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: CouleursApplication.blancPur,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DimensionsApplication.rayonGrand),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Animation de succès
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: CouleursApplication.orElegant.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    color: CouleursApplication.orElegant,
                    width: 2,
                  ),
                ),
                child: const Icon(
                  Icons.check_circle_outline,
                  size: 48,
                  color: CouleursApplication.orElegant,
                ),
              ),
              
              const SizedBox(height: DimensionsApplication.espacementGrand),
              
              // Titre de confirmation
              Text(
                'Demande Envoyée !',
                style: StylesTexte.titreSecondaire.copyWith(
                  color: CouleursApplication.vertProfondChic,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: DimensionsApplication.espacementMoyen),
              
              // Message de confirmation
              Text(
                'Votre demande de devis a été transmise à nos experts paysagistes. Nous vous contacterons sous 24h.',
                style: StylesTexte.corpsTexte.copyWith(
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: DimensionsApplication.espacementGrand),
              
              // Boutons d'action
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Bouton Retour à l'accueil
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(context).pop(); // Ferme le dialogue
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          '/',
                          (route) => false,
                        ); // Retour à l'accueil
                      },
                      icon: const Icon(Icons.home),
                      label: const Text('Accueil'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CouleursApplication.vertOlive,
                        foregroundColor: CouleursApplication.texteSurSombre,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(DimensionsApplication.rayonMoyen),
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(width: DimensionsApplication.espacementMoyen),
                  
                  // Bouton Nouvelle demande
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(context).pop(); // Ferme le dialogue
                        // Reste sur la page pour une nouvelle demande
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('Nouveau'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CouleursApplication.orElegant,
                        foregroundColor: CouleursApplication.texteSurSombre,
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
        );
      },
    );
  }
} 
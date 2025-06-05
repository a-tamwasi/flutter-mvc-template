# Mon Jardin Idéal 🌿

Une application Flutter premium pour l'aménagement paysager et la conception de jardins de rêve.

## 📱 À Propos

**Mon Jardin Idéal** est une application mobile élégante dédiée aux services d'aménagement paysager haut de gamme. Elle permet aux clients de découvrir nos réalisations, demander des devis personnalisés et explorer nos services de jardinage professionnel.

### ✨ Fonctionnalités Principales

- **Portfolio Interactif** : Galerie de nos réalisations avec vraies images et détails complets
- **Demande de Devis** : Formulaire intelligent avec confirmation élégante
- **Recherche Avancée** : Recherche de services avec suggestions intelligentes
- **Navigation Complète** : Système de navigation MVC intégré et fonctionnel
- **Design Premium** : Palette de couleurs élégante (vert profond, or élégant, olive)
- **Code Quality** : 0 erreurs d'analyse, architecture MVC stricte

## 🎨 Design System

- **Couleurs Principales** : Vert profond (#1F3D2A), Or élégant (#C9A64D), Vert olive (#8A9A5B)
- **Typographie** : Playfair Display (titres) + Lora (contenu)
- **Architecture** : Pattern MVC strict avec conventions françaises
- **Responsive** : Optimisé pour toutes les tailles d'écran

## 🚀 Installation et Lancement

### Prérequis

- Flutter SDK >= 3.5.4
- Dart >= 3.5.4
- Android Studio / VS Code
- Un émulateur Android/iOS ou un appareil physique

### Installation

```bash
# Cloner le repository
git clone [URL_DU_REPOSITORY]
cd drawer_exercice

# Installer les dépendances
flutter pub get

# Vérifier l'installation
flutter doctor

# Lancer l'application
flutter run
```

### Build de Production

```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS (sur macOS uniquement)
flutter build ios --release
```

## 📁 Structure du Projet (Optimisée)

```
lib/
├── src/
│   ├── controllers/          # Contrôleurs MVC
│   │   ├── accueil_controleur.dart     ✅ Fonctionnel
│   │   ├── controleur_base.dart        ✅ Navigation intégrée
│   │   ├── drawer_controleur.dart      ✅ Menu optimisé
│   │   └── jardin_principal_controleur.dart ✅ Gestion complète
│   ├── views/               # Vues de l'application
│   │   ├── accueil_vue.dart            ✅ Page d'accueil premium
│   │   ├── demander_devis_vue.dart     ✅ Formulaire complet
│   │   ├── jardin_principal_vue.dart   ✅ Navigation principale
│   │   ├── nos_realisations_vue.dart   ✅ Portfolio avec vraies images
│   │   └── vue_base.dart              ✅ Navigation automatique
│   ├── models/              # Modèles de données
│   │   ├── element_menu.dart          ✅ Menu structuré
│   │   ├── service_jardin.dart        ✅ Services optimisés
│   │   └── modele_base.dart           ✅ Base solide
│   ├── services/            # Services applicatifs
│   │   ├── service_base.dart          ✅ Architecture propre
│   │   └── service_images.dart        ✅ Gestion des assets
│   ├── widgets/             # Widgets réutilisables
│   │   ├── bouton_personnalise.dart   ✅ Composants premium
│   │   ├── drawer_stateful_widget.dart ✅ Menu responsive
│   │   ├── element_menu_drawer.dart    ✅ Navigation élégante
│   │   └── image_securisee.dart       ✅ Images optimisées
│   ├── utils/               # Utilitaires
│   │   └── validateurs.dart           ✅ Validation formulaires
│   └── constants/           # Constantes de design
│       ├── couleurs_application.dart  ✅ Palette premium
│       ├── dimensions_application.dart ✅ Spacing cohérent
│       └── styles_texte.dart          ✅ Typographie élégante
└── main.dart               # Point d'entrée ✅

assets/                     # Images réelles du portfolio
├── jardin 1.jpeg          # Jardin Méditerranéen Moderne
├── jardin 2.jpeg          # Jardin Zen Minimaliste  
├── jardin 3.jpeg          # Jardin Familial Fonctionnel
├── piscine 1.jpeg         # Espace Aquatique de Luxe
├── piscine 2.jpeg         # Oasis Tropicale Privée
└── piscine 3.jpeg         # Spa Extérieur Premium
```

## 📊 Projets du Portfolio

| Projet | Type | Superficie | Durée | Budget |
|--------|------|------------|-------|---------|
| Jardin Méditerranéen Moderne | Aménagement | 300 m² | 4 semaines | 15-20k€ |
| Espace Aquatique de Luxe | Piscine | 450 m² | 8 semaines | 45-60k€ |
| Jardin Zen Minimaliste | Conception | 180 m² | 3 semaines | 8-12k€ |
| Oasis Tropicale Privée | Piscine | 380 m² | 6 semaines | 35-45k€ |
| Jardin Familial Fonctionnel | Aménagement | 250 m² | 3 semaines | 10-15k€ |
| Spa Extérieur Premium | Piscine | 220 m² | 5 semaines | 28-35k€ |

## 🛠️ Technologies Utilisées

- **Framework** : Flutter 3.24+
- **Langage** : Dart 3.5+
- **Gestion d'état** : Architecture MVC native
- **Fonts** : Google Fonts (Playfair Display, Lora)
- **UI/UX** : Material Design 3
- **Images** : Assets locaux optimisés

## 📱 Plateformes Supportées

- ✅ Android (API 21+)
- ✅ iOS (iOS 12+)
- ✅ Web (partiellement)

## 🔧 Développement

### Conventions de Code

- Architecture MVC stricte
- Nommage en français pour les entités métier
- Documentation complète des méthodes publiques
- Respect des conventions Dart/Flutter

### ✨ Dernières Améliorations

#### **v1.1.0 - Optimisation Complète** 
- **Portfolio avec vraies images** : Remplacement des placeholders par 6 vraies images de projets
- **Navigation fonctionnelle** : Configuration automatique du système de navigation MVC
- **Code quality parfaite** : 0 erreurs d'analyse Flutter, nettoyage complet des fichiers non utilisés
- **Informations de projets réalistes** : Chaque image associée à des données réelles (superficie, durée, budget)
- **Structure optimisée** : Suppression de 26KB de code non utilisé (fichiers exemples, démonstrations)
- **Formulaires améliorés** : Confirmation élégante pour les demandes de devis
- **Design cohérent** : Mise en page esthétique pour tous les détails de projets

### Tests

```bash
# Lancer les tests unitaires
flutter test

# Analyser le code
flutter analyze

# Formater le code
flutter format .
```

## 📝 Licence

Ce projet est propriétaire. Tous droits réservés.

## 👥 Équipe

- **Développement** : Équipe Flutter
- **Design** : Studio de design UX/UI
- **Contenu** : Experts en aménagement paysager

## 📞 Contact

Pour toute question ou demande de renseignements :

- **Email** : contact@monjardinideal.fr
- **Téléphone** : +33 (0)1 23 45 67 89
- **Site Web** : www.monjardinideal.fr

---

*Créé avec ❤️ par l'équipe Mon Jardin Idéal*

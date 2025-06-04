/// Utilitaires de validation pour les formulaires et données utilisateur
/// Centralise toutes les règles de validation de l'application
class Validateurs {
  Validateurs._(); // Constructeur privé pour empêcher l'instanciation

  /// Valide qu'un champ n'est pas vide
  static String? champObligatoire(String? valeur, [String? nomChamp]) {
    if (valeur == null || valeur.trim().isEmpty) {
      return '${nomChamp ?? 'Ce champ'} est obligatoire';
    }
    return null;
  }

  /// Valide le format d'une adresse email
  static String? email(String? valeur) {
    if (valeur == null || valeur.isEmpty) {
      return 'L\'adresse email est obligatoire';
    }
    
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!regex.hasMatch(valeur)) {
      return 'Format d\'email invalide';
    }
    return null;
  }

  /// Valide la longueur minimale d'un texte
  static String? longueurMinimale(String? valeur, int longueurMin, [String? nomChamp]) {
    if (valeur == null || valeur.length < longueurMin) {
      return '${nomChamp ?? 'Ce champ'} doit contenir au moins $longueurMin caractères';
    }
    return null;
  }

  /// Valide la longueur maximale d'un texte
  static String? longueurMaximale(String? valeur, int longueurMax, [String? nomChamp]) {
    if (valeur != null && valeur.length > longueurMax) {
      return '${nomChamp ?? 'Ce champ'} ne peut pas dépasser $longueurMax caractères';
    }
    return null;
  }

  /// Valide qu'un mot de passe respecte les critères de sécurité
  static String? motDePasse(String? valeur) {
    if (valeur == null || valeur.isEmpty) {
      return 'Le mot de passe est obligatoire';
    }

    if (valeur.length < 8) {
      return 'Le mot de passe doit contenir au moins 8 caractères';
    }

    if (!RegExp(r'[A-Z]').hasMatch(valeur)) {
      return 'Le mot de passe doit contenir au moins une majuscule';
    }

    if (!RegExp(r'[a-z]').hasMatch(valeur)) {
      return 'Le mot de passe doit contenir au moins une minuscule';
    }

    if (!RegExp(r'[0-9]').hasMatch(valeur)) {
      return 'Le mot de passe doit contenir au moins un chiffre';
    }

    return null;
  }

  /// Valide qu'un numéro de téléphone est au bon format
  static String? telephone(String? valeur) {
    if (valeur == null || valeur.isEmpty) {
      return 'Le numéro de téléphone est obligatoire';
    }

    // Supprime tous les espaces, tirets et parenthèses
    final numeroNettoye = valeur.replaceAll(RegExp(r'[\s\-\(\)]'), '');
    
    // Vérifie le format français (10 chiffres commençant par 0)
    if (!RegExp(r'^0[1-9]\d{8}$').hasMatch(numeroNettoye)) {
      return 'Format de téléphone invalide (ex: 01 23 45 67 89)';
    }

    return null;
  }

  /// Valide qu'une valeur numérique est dans une plage donnée
  static String? plageNumerique(String? valeur, double min, double max, [String? nomChamp]) {
    if (valeur == null || valeur.isEmpty) {
      return '${nomChamp ?? 'Cette valeur'} est obligatoire';
    }

    final nombre = double.tryParse(valeur);
    if (nombre == null) {
      return '${nomChamp ?? 'Cette valeur'} doit être un nombre valide';
    }

    if (nombre < min || nombre > max) {
      return '${nomChamp ?? 'Cette valeur'} doit être entre $min et $max';
    }

    return null;
  }

  /// Combine plusieurs validateurs
  static String? combiner(List<String? Function()> validateurs) {
    for (final validateur in validateurs) {
      final resultat = validateur();
      if (resultat != null) {
        return resultat;
      }
    }
    return null;
  }
} 
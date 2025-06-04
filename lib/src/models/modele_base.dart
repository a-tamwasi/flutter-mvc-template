/// Classe abstraite de base pour tous les modèles de l'application
/// Définit l'interface commune que doivent implémenter tous les modèles
abstract class ModeleBase {
  /// Identifiant unique du modèle
  String get id;

  /// Convertit le modèle en Map pour la sérialisation
  Map<String, dynamic> versMap();

  /// Crée une instance du modèle à partir d'une Map
  /// Cette méthode doit être implémentée dans chaque modèle concret
  static ModeleBase depuisMap(Map<String, dynamic> map) {
    throw UnimplementedError('depuisMap doit être implémentée dans la classe fille');
  }

  /// Copie le modèle avec des modifications optionnelles
  ModeleBase copierAvec();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ModeleBase && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return '$runtimeType{id: $id}';
  }
} 
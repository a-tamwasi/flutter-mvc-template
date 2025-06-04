import 'modele_base.dart';

/// Exemple de modèle concret héritant de ModeleBase
/// À remplacer par vos modèles métier spécifiques
class ExempleModele extends ModeleBase {
  final String _id;
  final String nom;
  final String description;

  ExempleModele({
    required String id,
    required this.nom,
    required this.description,
  }) : _id = id;

  @override
  String get id => _id;

  @override
  Map<String, dynamic> versMap() {
    return {
      'id': _id,
      'nom': nom,
      'description': description,
    };
  }

  /// Crée une instance à partir d'une Map
  static ExempleModele depuisMap(Map<String, dynamic> map) {
    return ExempleModele(
      id: map['id'] as String,
      nom: map['nom'] as String,
      description: map['description'] as String,
    );
  }

  @override
  ExempleModele copierAvec({
    String? nom,
    String? description,
  }) {
    return ExempleModele(
      id: _id,
      nom: nom ?? this.nom,
      description: description ?? this.description,
    );
  }

  @override
  String toString() {
    return 'ExempleModele{id: $_id, nom: $nom, description: $description}';
  }
} 
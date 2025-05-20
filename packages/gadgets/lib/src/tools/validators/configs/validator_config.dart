import 'validator_fields.dart';

typedef ValidatorList = List<ValidatorFields>;
typedef ModelValidators = Map<Type, Map<String, ValidatorList>>;

class ValidatorConfig {
  static final ModelValidators _validators = {};

  /// Enregistrer les validateurs d'un modèle
  static void register<T>(Map<String, ValidatorList> validators) {
    _validators[T] = validators;
  }

  /// Récupérer les validateurs d'un champ
  static ValidatorList? getValidatorsField<T>(String fieldName) {
    return _validators[T]?[fieldName];
  }
}

import 'configs/validator_config.dart';
import 'configs/validator_fields.dart';

class Validator {
  static List<String> validates<T>({
    required String field,
    required dynamic value,
  }) {
    final validators = ValidatorConfig.getValidatorsField<T>(field) ?? [];
    final errors = <String>[];

    for (final validator in validators) {
      if (!_isValid(validator, value)) {
        errors.add(validator.message);
      }
    }

    return errors;
  }

  /// Logique de validation générique
  static bool _isValid(ValidatorFields validator, dynamic value) {
    switch (validator) {
      case IsRequired():
        return value != null && value.toString().trim().isNotEmpty;

      case IsEmail():
        return RegExp(
          r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$',
        ).hasMatch(value ?? '');

      case IsMaxLength():
        return (value?.toString().length ?? 0) >= validator.max;
      default:
        return true;
    }
  }
}

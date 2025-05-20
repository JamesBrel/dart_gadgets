abstract class ValidatorFields {
  final String message;
  const ValidatorFields(this.message);
}

/// Champ obligatoire
class IsRequired extends ValidatorFields {
  const IsRequired([super.message = "Ce champ est obligatoire"]);
}

/// Champ email
class IsEmail extends ValidatorFields {
  const IsEmail([super.message = "Ce champ doit être un email"]);
}

/// Longueur minimale
class IsMaxLength extends ValidatorFields {
  final int max;
  const IsMaxLength(this.max, [String message = "Trop court"]) : super(message);
}

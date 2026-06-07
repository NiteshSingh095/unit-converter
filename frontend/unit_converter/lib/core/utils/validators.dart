class Validators {
  Validators._();

  static String? validateNumericValue(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter a value';
    }
    final parsed = double.tryParse(value.trim());
    if (parsed == null) {
      return 'Please enter a valid number';
    }
    return null;
  }

  static String? validateRequired(String? value, {String field = 'Field'}) {
    if (value == null || value.trim().isEmpty) {
      return '$field is required';
    }
    return null;
  }

  static String? validateDifferentUnits(String? from, String? to) {
    if (from != null && to != null && from == to) {
      return 'From and To units must be different';
    }
    return null;
  }
}

class ValidationInput {
  String? validationName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Enter Name";
    }
    return null;
  }

  String? phoneValidation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Enter Phone Number";
    }

    if (value.length != 11) {
      return "Phone number must be 11 digits";
    }

    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return "Phone number must contain numbers only";
    }

    return null;
  }

  String? emailValidation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Enter Email";
    }

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value.trim())) {
      return "Enter a valid email";
    }

    return null;
  }

  String? ageValidation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Enter Age";
    }

    final age = int.tryParse(value);

    if (age == null) {
      return "Age must be a number";
    }

    return null;
  }

  String? emptyValidation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Enter Value";
    }

    return null;
  }

  String? passwordValidationlogin(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Enter Password";
    }

    if (value.length < 7) {
      return "Password must be at least 7 characters";
    }

    return null;
  }

  String? passwordValidationreg(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter Password";
    }

    if (value.length < 8) {
      return "Password must be at least 8 characters";
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return "Password must contain an uppercase letter";
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return "Password must contain a lowercase letter";
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return "Password must contain a number";
    }

    return null;
  }
}

class FormValidator {
  /// Validates an email address.
  /// Returns null if valid, or an error message if invalid.
  static String? validateEmail(String? email) {
    if (email == null || email.trim().isEmpty) {
      return 'Email is required';
    }

    final trimmedEmail = email.trim();

    if (trimmedEmail.length > 100) {
      return 'Email is too long';
    }

    if (!trimmedEmail.contains('@') || !trimmedEmail.contains('.')) {
      return 'invalid email format';
    }

    final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w{2,}$');
    if (!emailRegex.hasMatch(trimmedEmail)) {
      return 'invalid email format';
    }

    return null;
  }

  /// Validates a password.
  /// Returns null if valid, or an error message if invalid.
  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }

    if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }

    final hasLetter = RegExp(r'[A-Za-z]').hasMatch(password);
    final hasNumber = RegExp(r'\d').hasMatch(password);

    if (!hasLetter || !hasNumber) {
      return 'Password must contain a letter and number';
    }

    return null;
  }

  /// Sanitizes text input by removing <tags> and trimming whitespace.
  static String sanitizeText(String? text) {
    if (text == null) return '';
    final tagRegex = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: false);
    return text.replaceAll(tagRegex, '').trim();
  }

  /// Checks if the text is within the specified length range.
  static bool isValidLength(String? text,
      {int minLength = 1, int maxLength = 100}) {
    if (text == null) return false;
    final length = text.trim().length;
    return length >= minLength && length <= maxLength;
  }
}

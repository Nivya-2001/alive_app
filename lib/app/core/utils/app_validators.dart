class AppValidators {
  AppValidators._();

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    final trimmed = value.trim();

    if (trimmed.length > 254) {
      return 'Email is too long';
    }
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+\-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(trimmed)) {
      return 'Enter a valid email address';
    }
    if (trimmed.contains('..')) {
      return 'Enter a valid email address';
    }

    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }

    final trimmed = value.trim().replaceAll(' ', '');

    final phoneRegex = RegExp(r'^\+?[0-9]{7,15}$');
    if (!phoneRegex.hasMatch(trimmed)) {
      return 'Enter a valid phone number';
    }

    return null;
  }

  static String? emailOrPhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email or phone number is required';
    }

    final trimmed = value.trim();
    if (trimmed.contains('@')) {
      return email(trimmed);
    }
    return phone(trimmed);
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    if (value.length > 64) {
      return 'Password must be less than 64 characters';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }

    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }

    if (!value.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>_\-]'))) {
      return 'Password must contain at least one special character';
    }

    return null; 
  }
}
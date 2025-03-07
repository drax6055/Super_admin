class Validation {
  // Validate email format
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    
    // Regular expression for basic email validation
    String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    RegExp regex = RegExp(emailPattern);
    
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    
    return null;
  }

  // Validate password (for example, minimum 8 characters)
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    
    // Check if password length is less than 8 characters
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    
    return null;
  }
}

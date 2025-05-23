class SignupEmailPasswordFailure {
  final String message;

  const SignupEmailPasswordFailure(
      [this.message = 'An unknown error occurred.']);

  factory SignupEmailPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignupEmailPasswordFailure(
            'Please enter a strong password.');
      case 'invalid-email': // corrected from 'Invalid-email'
        return const SignupEmailPasswordFailure(
            'Please enter a valid email address.');
      case 'email-already-in-use':
        return const SignupEmailPasswordFailure(
            'This email is already in use.');
      case 'operation-not-allowed':
        return const SignupEmailPasswordFailure(
            'This operation is not allowed.');
      case 'user-disabled':
        return const SignupEmailPasswordFailure('This user has been disabled.');
      default:
        return const SignupEmailPasswordFailure();
    }
  }

  @override
  String toString() => message;
}

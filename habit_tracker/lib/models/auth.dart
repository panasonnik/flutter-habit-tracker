enum AuthenticationResult {
  success,
  failure,
}

class Authenticator {
  Future<AuthenticationResult> authenticate(String username, String password) {
    // Hardcoded credentials for demonstration
    const String validUsername = 'user';
    const String validPassword = '123';

    // Check if the provided username and password match the hardcoded credentials
    if (username == validUsername && password == validPassword) {
      return Future.delayed(const Duration(seconds: 2), () {
        return AuthenticationResult.success;
      });
    } else {
      return Future.delayed(const Duration(seconds: 2), () {
        return AuthenticationResult.failure;
      });
    }
  }
}

class ApiEndPoints {
  static const String baseUrl = 'http://192.168.1.141:8080/api/v1';
  static AuthEndPoints authEndpoints = AuthEndPoints();
}

class AuthEndPoints {
  static const String auth = '/auth';
  final String register = '$auth/register';
  final String unregister = '$auth/unregister';
  final String signIn = '$auth/signin';
  final String signOut = '$auth/signout';
  final String validate = '$auth/validate';
}
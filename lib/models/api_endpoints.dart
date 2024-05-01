class ApiEndPoints {
  static const String baseUrl = 'https://www.mobilegaragenepal.com/api/';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String register = 'users/create';
  final String login = 'users/login';
}

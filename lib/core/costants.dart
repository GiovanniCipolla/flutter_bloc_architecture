class Constants {
  static const String baseUrl = 'https://your-api-url.com';

  static const String loginEndpoint = '/auth/login';
  static const String userEndpoint = '/user';
  static const String remindersEndpoint = '/reminders';

  static const String authTokenKey = 'auth_token';

  static const String genericError =
      'Si è verificato un errore. Riprova più tardi.';

  static const Duration apiTimeout = Duration(seconds: 30);

  static const String loginRoute = '/login';
  static const String remindersRoute = '/reminders';
  static const String profileRoute = '/profile';
}

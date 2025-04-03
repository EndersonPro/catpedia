class EnvironmentAppConfig {
  late final String _baseUrl;
  late final String _apiKey;

  static EnvironmentAppConfig instance = EnvironmentAppConfig._();
  EnvironmentAppConfig._() {
    _initEnvironmentVariables();
    _validateEnvironmentVariables();
  }

  _initEnvironmentVariables() {
    _baseUrl = const String.fromEnvironment('API_URL');
    _apiKey = const String.fromEnvironment('API_KEY');
  }

  _validateEnvironmentVariables() {
    if (_baseUrl.isEmpty) {
      throw Exception('API_URL is not set');
    }
    if (_apiKey.isEmpty) {
      throw Exception('API_KEY is not set');
    }
  }

  String get baseUrl => _baseUrl;
  String get apiKey => _apiKey;
}

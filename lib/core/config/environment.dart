abstract class EnvironmentConfigInterface {
  String get baseUrl;
  String get apiKey;
}

class EnvironmentAppConfig implements EnvironmentConfigInterface {
  late final String _baseUrl;
  late final String _apiKey;

  EnvironmentAppConfig() {
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

  @override
  String get baseUrl => _baseUrl;
  @override
  String get apiKey => _apiKey;
}

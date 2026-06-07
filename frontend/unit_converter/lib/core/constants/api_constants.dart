class ApiConstants {
  ApiConstants._();

  static const String baseUrl = 'https://unit-converter-hwde.onrender.com';
  static const String apiVersion = '/api/v1';

  static const String health = '$apiVersion/health';
  static const String echo = '$apiVersion/echo';
  static const String convertLength = '$apiVersion/convert/length';
  static const String convertWeight = '$apiVersion/convert/weight';
  static const String convertTemperature = '$apiVersion/convert/temperature';

  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
}

class HealthResponseModel {
  const HealthResponseModel({required this.message});

  factory HealthResponseModel.fromJson(Map<String, dynamic> json) {
    return HealthResponseModel(message: json['message'] as String? ?? '');
  }

  final String message;
}

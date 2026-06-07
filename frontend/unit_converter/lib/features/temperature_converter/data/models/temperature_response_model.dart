class TemperatureResponseModel {
  const TemperatureResponseModel({required this.result});

  factory TemperatureResponseModel.fromJson(Map<String, dynamic> json) {
    return TemperatureResponseModel(
      result: (json['result'] as num).toDouble(),
    );
  }

  final double result;
}

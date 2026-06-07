class WeightResponseModel {
  const WeightResponseModel({required this.value});

  factory WeightResponseModel.fromJson(Map<String, dynamic> json) {
    return WeightResponseModel(
      value: (json['value'] as num).toDouble(),
    );
  }

  final double value;
}

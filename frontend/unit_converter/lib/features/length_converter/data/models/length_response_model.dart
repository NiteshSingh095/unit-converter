class LengthResponseModel {
  const LengthResponseModel({required this.value});

  factory LengthResponseModel.fromJson(Map<String, dynamic> json) {
    return LengthResponseModel(
      value: (json['value'] as num).toDouble(),
    );
  }

  final double value;
}

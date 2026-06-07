class WeightRequestModel {
  const WeightRequestModel({
    required this.value,
    required this.from,
    required this.to,
  });

  final double value;
  final String from;
  final String to;

  Map<String, dynamic> toJson() => {
        'value': value,
        'from': from,
        'to': to,
      };
}

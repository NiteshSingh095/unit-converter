class EchoResponseModel {
  const EchoResponseModel({required this.message});

  factory EchoResponseModel.fromJson(Map<String, dynamic> json) {
    return EchoResponseModel(message: json['message'] as String? ?? '');
  }

  final String message;
}

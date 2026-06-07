class EchoRequestModel {
  const EchoRequestModel({required this.name});

  final String name;

  Map<String, dynamic> toJson() => {'name': name};
}

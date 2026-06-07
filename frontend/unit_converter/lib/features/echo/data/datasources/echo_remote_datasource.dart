import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/utils/result.dart';
import '../models/echo_request_model.dart';
import '../models/echo_response_model.dart';

class EchoRemoteDataSource {
  EchoRemoteDataSource(this._apiClient);

  final ApiClient _apiClient;

  Future<Result<EchoResponseModel>> sendEcho(EchoRequestModel request) async {
    final result = await _apiClient.post(
      ApiConstants.echo,
      data: request.toJson(),
    );
    return switch (result) {
      Success(:final data) => Success(EchoResponseModel.fromJson(data)),
      Error(:final failure) => Error(failure),
    };
  }
}

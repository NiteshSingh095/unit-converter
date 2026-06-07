import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/utils/result.dart';
import '../models/temperature_request_model.dart';
import '../models/temperature_response_model.dart';

class TemperatureRemoteDataSource {
  TemperatureRemoteDataSource(this._apiClient);

  final ApiClient _apiClient;

  Future<Result<TemperatureResponseModel>> convert(
    TemperatureRequestModel request,
  ) async {
    final result = await _apiClient.post(
      ApiConstants.convertTemperature,
      data: request.toJson(),
    );
    return switch (result) {
      Success(:final data) => Success(TemperatureResponseModel.fromJson(data)),
      Error(:final failure) => Error(failure),
    };
  }
}

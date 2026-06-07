import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/utils/result.dart';
import '../models/health_response_model.dart';

class HealthRemoteDataSource {
  HealthRemoteDataSource(this._apiClient);

  final ApiClient _apiClient;

  Future<Result<HealthResponseModel>> checkHealth() async {
    final result = await _apiClient.get(ApiConstants.health);
    return switch (result) {
      Success(:final data) => Success(HealthResponseModel.fromJson(data)),
      Error(:final failure) => Error(failure),
    };
  }
}

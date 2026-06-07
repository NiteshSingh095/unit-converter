import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/utils/result.dart';
import '../models/weight_request_model.dart';
import '../models/weight_response_model.dart';

class WeightRemoteDataSource {
  WeightRemoteDataSource(this._apiClient);

  final ApiClient _apiClient;

  Future<Result<WeightResponseModel>> convert(WeightRequestModel request) async {
    final result = await _apiClient.post(
      ApiConstants.convertWeight,
      data: request.toJson(),
    );
    return switch (result) {
      Success(:final data) => Success(WeightResponseModel.fromJson(data)),
      Error(:final failure) => Error(failure),
    };
  }
}

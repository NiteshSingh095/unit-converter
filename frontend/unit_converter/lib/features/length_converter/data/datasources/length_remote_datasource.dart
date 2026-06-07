import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/utils/result.dart';
import '../models/length_request_model.dart';
import '../models/length_response_model.dart';

class LengthRemoteDataSource {
  LengthRemoteDataSource(this._apiClient);

  final ApiClient _apiClient;

  Future<Result<LengthResponseModel>> convert(LengthRequestModel request) async {
    final result = await _apiClient.post(
      ApiConstants.convertLength,
      data: request.toJson(),
    );
    return switch (result) {
      Success(:final data) => Success(LengthResponseModel.fromJson(data)),
      Error(:final failure) => Error(failure),
    };
  }
}

import 'package:dio/dio.dart';

import '../errors/failure.dart';
import '../utils/result.dart';

class ApiClient {
  ApiClient(this._dio);

  final Dio _dio;

  Future<Result<Map<String, dynamic>>> get(String path) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(path);
      return Success(response.data ?? {});
    } on DioException catch (e) {
      return Error(_mapDioError(e));
    } catch (_) {
      return const Error(UnknownFailure());
    }
  }

  Future<Result<Map<String, dynamic>>> post(
    String path, {
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(path, data: data);
      return Success(response.data ?? {});
    } on DioException catch (e) {
      return Error(_mapDioError(e));
    } catch (_) {
      return const Error(UnknownFailure());
    }
  }

  Failure _mapDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return const NetworkFailure();
      case DioExceptionType.badResponse:
        final data = e.response?.data;
        if (data is Map<String, dynamic> && data['error'] != null) {
          return ServerFailure(data['error'].toString());
        }
        return ServerFailure(
          e.response?.statusMessage ?? 'Server error occurred',
        );
      default:
        return const UnknownFailure();
    }
  }
}

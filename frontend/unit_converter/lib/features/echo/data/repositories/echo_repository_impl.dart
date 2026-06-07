import 'dart:convert';

import '../../../../core/utils/result.dart';
import '../../domain/entities/echo_result.dart';
import '../../domain/repositories/echo_repository.dart';
import '../datasources/echo_remote_datasource.dart';
import '../models/echo_request_model.dart';

class EchoRepositoryImpl implements EchoRepository {
  EchoRepositoryImpl(this._dataSource);

  final EchoRemoteDataSource _dataSource;

  @override
  Future<Result<EchoResult>> sendEcho(String name) async {
    final request = EchoRequestModel(name: name);
    final result = await _dataSource.sendEcho(request);
    return switch (result) {
      Success(:final data) => Success(
          EchoResult(
            requestJson: const JsonEncoder.withIndent('  ').convert(request.toJson()),
            responseJson: const JsonEncoder.withIndent('  ').convert({
              'message': data.message,
            }),
          ),
        ),
      Error(:final failure) => Error(failure),
    };
  }
}

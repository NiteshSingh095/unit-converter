import '../../../../core/utils/result.dart';
import '../entities/temperature_conversion.dart';

abstract class TemperatureRepository {
  Future<Result<TemperatureConversion>> convert({
    required double value,
    required String from,
    required String to,
  });
}

import '../../../../core/utils/result.dart';
import '../entities/weight_conversion.dart';

abstract class WeightRepository {
  Future<Result<WeightConversion>> convert({
    required double value,
    required String from,
    required String to,
  });
}

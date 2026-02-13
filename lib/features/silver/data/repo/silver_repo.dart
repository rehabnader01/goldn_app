import 'package:dartz/dartz.dart';
import 'package:goldn/core/networking/api_constants.dart';
import 'package:goldn/core/networking/dio_helper.dart';
import 'package:goldn/features/model/metal_model.dart';

class SilverRepo {
  Future<Either<String, MetalModel>> getSilver() async {
    try {
      final response = await DioHelper.getData(
        endPoint: ApiConstants.silverEndPoint,
        queryParameters: {'api_key': ApiConstants.apiKey, 'metal': 'silver'},
      );

      return Right(MetalModel.fromJson(response.data));
    } on Exception catch (e) {
      return Left(e.toString().replaceAll('Exception: ', ''));
    }
  }
}

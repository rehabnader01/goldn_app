import 'package:dartz/dartz.dart';
import 'package:goldn/core/networking/api_constants.dart';
import 'package:goldn/core/networking/dio_helper.dart';
import 'package:goldn/features/model/metal_model.dart';

class GoldRepo {
  Future<Either<String, MetalModel>> getGold() async {
    try {
      final response = await DioHelper.getData(
        endPoint: ApiConstants.goldEndPoint,
        queryParameters: {'api_key': ApiConstants.apiKey, 'metal': 'gold'},
      );

      return Right(MetalModel.fromJson(response.data));
    } on Exception catch (e) {
      return Left(e.toString().replaceAll('Exception: ', ''));
    }
  }
}

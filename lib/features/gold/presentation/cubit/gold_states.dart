
import 'package:goldn/features/model/metal_model.dart';

abstract class GoldState {}

class GoldInitialState extends GoldState {}

class GoldErrorState extends GoldState {
  final String errMsg;

  GoldErrorState({required this.errMsg});
}

class GoldSuccessState extends GoldState {
  final MetalModel metalModel;

  GoldSuccessState({required this.metalModel});
}

class GoldLoadingState extends GoldState {}
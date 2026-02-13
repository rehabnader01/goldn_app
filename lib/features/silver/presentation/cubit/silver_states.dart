
import 'package:goldn/features/model/metal_model.dart';

abstract class SilverState {}

class SilverInitialState extends SilverState {}

class SilverErrorState extends SilverState {
  final String errMsg;

  SilverErrorState({required this.errMsg});
}

class SilverSuccessState extends SilverState {
  final MetalModel metalModel;

  SilverSuccessState({required this.metalModel});
}

class SilverLoadingState extends SilverState {}
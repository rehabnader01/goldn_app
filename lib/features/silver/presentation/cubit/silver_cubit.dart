import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldn/features/silver/data/repo/silver_repo.dart';
import 'package:goldn/features/silver/presentation/cubit/silver_states.dart';

class SilverCubit extends Cubit<SilverState> {
  final SilverRepo silverRepo;
  SilverCubit(this.silverRepo) : super(SilverInitialState());
  Future<void> getSilver() async {
    emit(SilverLoadingState());
    final res = await silverRepo.getSilver();
    res.fold(
      (error) {
        emit(SilverErrorState(errMsg: error));
      },
      (metalModel) {
        emit(SilverSuccessState(metalModel: metalModel));
      },
    );
  }
}

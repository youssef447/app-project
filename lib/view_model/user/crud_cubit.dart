/* import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Model/models/model.dart';
import '../../Model/repos/crud_repo.dart';
import '../../config/dependencies/injection.dart';
import 'crud_states.dart';

class ModelCubit extends Cubit<AppStates> {
  ModelCubit() : super(AppInitialState());
  static ModelCubit get(context) => BlocProvider.of(context);
  add() async {
    emit(AppCrudLoadingState());

    Model model = Model(data: 1);
    final response = await locators.get<CrudRepo>().add(model: model);
    response.fold((l) {
      emit(
        AppErrorState(l.errMessage),
      );
    }, (r) {
      emit(AppCrudSuccessState());
    });
  }

  update() async {
    emit(AppCrudLoadingState());
    Model model = Model(age: 1);

    final response =
        await locators.get<CrudRepo>().update(id: '1', model: model);
    response.fold((l) {
      emit(
        AppErrorState(l.errMessage),
      );
    }, (r) {
      emit(AppCrudSuccessState());
    });
  }
}
 */
abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppLoadingDataState extends AppStates {}

class AppCrudLoadingState extends AppStates {}

class AppCrudSuccessState extends AppStates {}

class AppErrorState extends AppStates {
  final String errMsg;
  AppErrorState(
    this.errMsg,
  );
}

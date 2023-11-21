import 'package:flutter/foundation.dart';

class AppInitState {}

class AppChoiseMaleState extends AppInitState {}

class AppChoiseFemaleState extends AppInitState {}

class ReadFoodDataLoadingState extends AppInitState {}

class ReadFoodDataLSuccessState extends AppInitState {}

class ReadFoodDataFailedState extends AppInitState {
  String error;
  ReadFoodDataFailedState(this.error) {
    if (kDebugMode) {
      print("Failed to read Data : $error ");
    }
  }
}

class OpenDrawerState extends AppInitState {}

class CloseDrawerState extends AppInitState {}

class FetchPatientLoadingState extends AppInitState {}

class FetchPatientSuccessState extends AppInitState {}

class FetchPatientFailedState extends AppInitState {
  FetchPatientFailedState(this.error) {
    if (kDebugMode) {
      print(error);
    }
  }
  String error;
}

class FetchPatientSessionLoadingState extends AppInitState {}

class FetchPatientSessionSuccessState extends AppInitState {}

class FetchPatientSessionFailedState extends AppInitState {
  FetchPatientSessionFailedState(this.error) {
    if (kDebugMode) {
      print(error);
    }
  }
  String error;
}

class AddPatientLoadingState extends AppInitState {}

class AddPatientSuccessState extends AppInitState {}

class AddPatientFailedState extends AppInitState {
  AddPatientFailedState(this.error) {
    if (kDebugMode) {
      print(error);
    }
  }
  String error;
}

class DeletePatientLoadingState extends AppInitState {}

class DeletePatientSuccessState extends AppInitState {}

class DeletePatientFailedState extends AppInitState {
  DeletePatientFailedState(this.error) {
    if (kDebugMode) {
      print(error);
    }
  }
  String error;
}

class AddPatientSessionLoadingState extends AppInitState {}

class AddPatientSessionSuccessState extends AppInitState {}

class AddPatientSessionFailedState extends AppInitState {
  AddPatientSessionFailedState(this.error) {
    if (kDebugMode) {
      print(error);
    }
  }
  String error;
}

import 'dart:convert';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:diet_app/Screens/result_screen.dart';
import 'package:diet_app/Shared/Extensions/Extentions.dart';
import 'package:diet_app/Shared/bloc/app_states.dart';
import 'package:diet_app/Shared/network/supabase_function.dart';
import 'package:diet_app/generated/l10n.dart';
import 'package:diet_app/models/food_models.dart';
import 'package:diet_app/models/patientModel.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppInitState> {
  AppCubit() : super(AppInitState());
  static AppCubit get(context) => BlocProvider.of(context);

  bool ismale = true;
  void changeType() {
    if (ismale) {
      ismale = false;
      emit(AppChoiseFemaleState());
    } else {
      ismale = true;
      emit(AppChoiseMaleState());
    }
  }

  List<Food> foodData = [];
  Future<Map<String, List<Food>>> readFoodData() async {
    emit(ReadFoodDataLoadingState());
    try {
      String jsonData = await rootBundle.loadString('assets/meals.json');
      Map<String, dynamic> data = json.decode(jsonData);
      Map<String, List<Food>> foodData = {};
      data.forEach((category, foodsJson) {
        foodData[category] =
            (foodsJson as List).map((item) => Food.fromJson(item)).toList();
      });
      emit(ReadFoodDataLSuccessState());

      return foodData;
    } catch (e) {
      emit(ReadFoodDataFailedState(e.toString()));

      throw Exception('Failed to load food data: $e');
    }
  }

  //***************************************************************
  //                       Start Drawer Functions
  //***************************************************************
  double xoffset = 0;
  double yoffset = 0;
  double scaleFactor = 1;
  bool isDrawrOpen = false;

  drawer_Function(xoffsetf, yoffsetf, scaleFactorf) {
    xoffset = xoffsetf;
    yoffset = yoffsetf;
    scaleFactor = scaleFactorf;
    if (!isDrawrOpen) {
      isDrawrOpen = true;
      emit(OpenDrawerState());
    } else {
      isDrawrOpen = false;
      emit(CloseDrawerState());
    }
  }
  //***************************************************************
  //                       End Drawer Functions
  //***************************************************************

  var heightController = TextEditingController();
  var weightController = TextEditingController();
  var ageController = TextEditingController();
  var result = 0.0;
  calculate_bmr(BuildContext context) {
    if (heightController.text == '' ||
        weightController.text == '' ||
        ageController.text == '') {
      context.ShowSnackbar(S.of(context).validatorSnackbar);
    } else {
      context.jumpTo(const ResultScreen());
      result = (10 * double.parse(weightController.text)) +
          (6.25 * double.parse(heightController.text)) -
          (5 * double.parse(ageController.text));
      if (ismale) {
        result += 5;
      } else {
        result -= 161;
      }
    }
  }

//**********************************************************
//**********************************************************
//                      Start Patient functions
//**********************************************************
//**********************************************************
  List<Patient> patientList = [];
  fetchPatient() async {
    patientList = [];
    emit(FetchPatientLoadingState());
    try {
      patientList = await SupaBase_Helper.fetchPatients();

      emit(FetchPatientSuccessState());
    } catch (e) {
      emit(FetchPatientFailedState(e.toString()));
    }
  }

  List<SessionModel> patienSessiontList = [];
  fetchPatientSessions(id) async {
    patienSessiontList = [];
    emit(FetchPatientSessionLoadingState());
    try {
      patienSessiontList = await SupaBase_Helper.fetchPatientsSessions(id);
      emit(FetchPatientSessionSuccessState());
    } catch (e) {
      emit(FetchPatientSessionFailedState(e.toString()));
    }
  }

  var patientFirstNameController = TextEditingController();
  var patientLastNameController = TextEditingController();
  var patientAgeController = TextEditingController();
  var patientheightController = TextEditingController();
  var patientweightController = TextEditingController();

  bool male = true;
  void changeGender() {
    if (male) {
      male = false;
      emit(AppChoiseFemaleState());
    } else {
      male = true;
      emit(AppChoiseMaleState());
    }
  }

  addPatient() async {
    emit(AddPatientLoadingState());
    try {
      Patient patient = Patient(
          age: patientAgeController.text.ToInt(),
          firstName: patientFirstNameController.text,
          lastName: patientLastNameController.text,
          gender: male ? "male" : "female",
          height: patientheightController.text.ToInt(),
          weight: patientweightController.text.ToDouble());
      await SupaBase_Helper.addPatient(parient: patient);
      emit(AddPatientSuccessState());

      fetchPatient();
    } catch (e) {
      emit(AddPatientFailedState(e.toString()));
    }
  }

  cleardata() {
    patientFirstNameController.clear();
    patientLastNameController.clear();
    patientAgeController.clear();
    patientheightController.clear();
    patientweightController.clear();
  }

  deletePatient(id) {
    emit(DeletePatientLoadingState());
    try {
      SupaBase_Helper.deletePatient(id);

      emit(DeletePatientSuccessState());
      fetchPatient();
    } catch (e) {
      emit(DeletePatientFailedState(e.toString()));
    }
  }
//**********************************************************
//**********************************************************
//                      Start Patient functions
//**********************************************************
//**********************************************************
}

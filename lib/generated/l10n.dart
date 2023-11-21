// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `BMR Calculator`
  String get title {
    return Intl.message(
      'BMR Calculator',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get maletype {
    return Intl.message(
      'Male',
      name: 'maletype',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get femaletype {
    return Intl.message(
      'Female',
      name: 'femaletype',
      desc: '',
      args: [],
    );
  }

  /// `Height`
  String get height {
    return Intl.message(
      'Height',
      name: 'height',
      desc: '',
      args: [],
    );
  }

  /// `Weight`
  String get weight {
    return Intl.message(
      'Weight',
      name: 'weight',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get age {
    return Intl.message(
      'Age',
      name: 'age',
      desc: '',
      args: [],
    );
  }

  /// `Calculate`
  String get calculateButtom {
    return Intl.message(
      'Calculate',
      name: 'calculateButtom',
      desc: '',
      args: [],
    );
  }

  /// `Please add all required data ( Weight ,Height ,Age ).`
  String get validatorSnackbar {
    return Intl.message(
      'Please add all required data ( Weight ,Height ,Age ).',
      name: 'validatorSnackbar',
      desc: '',
      args: [],
    );
  }

  /// `Result`
  String get result {
    return Intl.message(
      'Result',
      name: 'result',
      desc: '',
      args: [],
    );
  }

  /// `Sedentary: little or no exercise`
  String get activity1 {
    return Intl.message(
      'Sedentary: little or no exercise',
      name: 'activity1',
      desc: '',
      args: [],
    );
  }

  /// `Exercise 1-3 times/week`
  String get activity2 {
    return Intl.message(
      'Exercise 1-3 times/week',
      name: 'activity2',
      desc: '',
      args: [],
    );
  }

  /// `Exercise 4-5 times/week`
  String get activity3 {
    return Intl.message(
      'Exercise 4-5 times/week',
      name: 'activity3',
      desc: '',
      args: [],
    );
  }

  /// `Daily exercise or intense exercise 3-4 times/week`
  String get activity4 {
    return Intl.message(
      'Daily exercise or intense exercise 3-4 times/week',
      name: 'activity4',
      desc: '',
      args: [],
    );
  }

  /// `Intense exercise 6-7 times/week`
  String get activity5 {
    return Intl.message(
      'Intense exercise 6-7 times/week',
      name: 'activity5',
      desc: '',
      args: [],
    );
  }

  /// `Very intense exercise daily, or physical job`
  String get activity6 {
    return Intl.message(
      'Very intense exercise daily, or physical job',
      name: 'activity6',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get en {
    return Intl.message(
      'English',
      name: 'en',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get ar {
    return Intl.message(
      'Arabic',
      name: 'ar',
      desc: '',
      args: [],
    );
  }

  /// `Create Diet`
  String get creatediet {
    return Intl.message(
      'Create Diet',
      name: 'creatediet',
      desc: '',
      args: [],
    );
  }

  /// `Comming Soon`
  String get soon {
    return Intl.message(
      'Comming Soon',
      name: 'soon',
      desc: '',
      args: [],
    );
  }

  /// `Patients List`
  String get patients {
    return Intl.message(
      'Patients List',
      name: 'patients',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Change In Weight`
  String get Change_In_Weight {
    return Intl.message(
      'Change In Weight',
      name: 'Change_In_Weight',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `Add New patient`
  String get newPatient {
    return Intl.message(
      'Add New patient',
      name: 'newPatient',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firtName {
    return Intl.message(
      'First Name',
      name: 'firtName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `There are no sessions yet.`
  String get noSessionYet {
    return Intl.message(
      'There are no sessions yet.',
      name: 'noSessionYet',
      desc: '',
      args: [],
    );
  }

  /// `There are no Patients yet.`
  String get noPatientYet {
    return Intl.message(
      'There are no Patients yet.',
      name: 'noPatientYet',
      desc: '',
      args: [],
    );
  }

  /// `Patient added successfully.`
  String get addpatientSucess {
    return Intl.message(
      'Patient added successfully.',
      name: 'addpatientSucess',
      desc: '',
      args: [],
    );
  }

  /// `Session added successfully.`
  String get addSessionSucess {
    return Intl.message(
      'Session added successfully.',
      name: 'addSessionSucess',
      desc: '',
      args: [],
    );
  }

  /// `Failed to add patient.`
  String get addPatientError {
    return Intl.message(
      'Failed to add patient.',
      name: 'addPatientError',
      desc: '',
      args: [],
    );
  }

  /// `Failed to add session.`
  String get addSessionError {
    return Intl.message(
      'Failed to add session.',
      name: 'addSessionError',
      desc: '',
      args: [],
    );
  }

  /// `Patient deleted successfully.`
  String get deletePatientSuccess {
    return Intl.message(
      'Patient deleted successfully.',
      name: 'deletePatientSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Session deleted successfully.`
  String get deleteSessionSuccess {
    return Intl.message(
      'Session deleted successfully.',
      name: 'deleteSessionSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Failed to delete patient.`
  String get deletePatientError {
    return Intl.message(
      'Failed to delete patient.',
      name: 'deletePatientError',
      desc: '',
      args: [],
    );
  }

  /// `Failed to delete session.`
  String get deleteSessionError {
    return Intl.message(
      'Failed to delete session.',
      name: 'deleteSessionError',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

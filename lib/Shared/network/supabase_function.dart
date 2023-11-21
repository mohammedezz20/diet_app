// ignore_for_file: unused_local_variable

import 'package:diet_app/models/patientModel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupaBase_Helper {
  static final supabase = Supabase.instance.client;

  static Future<List<Patient>> fetchPatients() async {
    final response = await supabase.from('patient_table').select('*');
    final List<Patient> patients = [];
    for (final entry in response as List) {
      patients.add(Patient.fromJson(entry as Map<String, dynamic>));
    }
    return patients;
  }

  static Future<List<SessionModel>> fetchPatientsSessions(int id) async {
    final supabase = Supabase.instance.client;
    final response =
        await supabase.from('visit_schedule').select("*").eq("patient_id", id);
    final List<SessionModel> patients = [];
    for (final entry in response as List) {
      patients.add(SessionModel.fromJson(entry as Map<String, dynamic>));
    }
    return patients;
  }

  static Future<void> addPatient({
    required Patient parient,
  }) async {
    final response =
        await supabase.from('patient_table').upsert(parient.toJson());
  }

  static deletePatient(id) async {
    await supabase.from('patient_table').delete().match({'id': id});
  }
}

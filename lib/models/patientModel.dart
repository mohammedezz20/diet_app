class Patient {
  var id;
  final String firstName;
  final String lastName;
  final String gender;
  final num age;
  final num height;
  final num weight;

  Patient({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.age,
    required this.height,
    required this.weight,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      gender: json['gender'],
      age: json['age'],
      height: json['height'],
      weight: json['weight'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'gender': gender,
      'age': age,
      'height': height,
      'weight': weight,
    };
  }
}

class SessionModel {
  int id;
  int patientId;
  var weight;
  var changeInWeight;
  String details;
  var date;

  SessionModel({
    required this.id,
    required this.patientId,
    required this.weight,
    required this.changeInWeight,
    required this.details,
    required this.date,
  });

  factory SessionModel.fromJson(Map<String, dynamic> json) {
    return SessionModel(
      id: json['id'],
      patientId: json['patient_id'],
      weight: json['weight'],
      changeInWeight: json['change_in_weight'],
      details: json['details'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'patient_id': patientId,
      'weight': weight,
      'change_in_weight': changeInWeight,
      'details': details,
      'date': date,
    };
  }
}

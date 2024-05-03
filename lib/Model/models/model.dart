class Model {
  String name, nationality,age;
  DateTime birthDate;

  Model({
    required this.age,
    required this.name,
    required this.birthDate,
    required this.nationality,
  });

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      age: json['age'],
      birthDate: json['birthDate'],
      nationality: json['nationality'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'age': age,
      'birthDate': birthDate,
      'nationality': nationality,
      'name': name,
    };
  }
}

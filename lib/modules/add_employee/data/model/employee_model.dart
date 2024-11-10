class EmployeeModel {
  int id;
  String name;
  String role;
  DateTime? startDate;
  DateTime? endDate;

  EmployeeModel({
    this.id = 0,
    required this.name,
    required this.role,
    required this.startDate,
    this.endDate,
  });

  // Convert EmployeeModel object to a map for saving to SQLite
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'role': role,
      'startDate': startDate?.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
    };
  }

  // Convert map to EmployeeModel object
  factory EmployeeModel.fromMap(Map<String, dynamic> map) {
    return EmployeeModel(
      id: map['id'],
      name: map['name'],
      role: map['role'],
      startDate: DateTime.parse(map['startDate']),
      endDate: map['endDate'] != null ? DateTime.parse(map['endDate']) : null,
    );
  }
}

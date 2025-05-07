class ChargingTypesModel {
  final String id;
  final String name;

  ChargingTypesModel({
    required this.id,
    required this.name,
  });

  factory ChargingTypesModel.fromJson(Map<String, dynamic> json) {
    return ChargingTypesModel(
      id: json['id'],
      name: json['name'],
    );
  }

  toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

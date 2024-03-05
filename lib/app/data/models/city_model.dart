class CityModel {
  int id;
  String name;
  String uf;
  CityModel({
    required this.id,
    required this.name,
    required this.uf,
  });

  factory CityModel.fromJson(Map<String, dynamic> map) {
    return CityModel(
      id: map['id']?.toInt() ?? 0,
      name: map['nome'] ?? '',
      uf: map['uf'] ?? '',
    );
  }
}

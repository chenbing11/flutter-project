class CityResponse {
  int id;
  String name;

  CityResponse({this.id, this.name});

  @override
  String toString() {
    return 'CityResponse{id: $id, name: $name}';
  }
}
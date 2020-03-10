class MotelType {
  String id;
  String type;

  MotelType ({this.id, this.type});

  MotelType.fromMap(Map data, String id):
    id = id ?? '',
    type = data ['type'] ?? '';
}
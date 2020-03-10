class FavoriteMotel {
  String id;
  String motelId;
  String userId;

  FavoriteMotel ({this.motelId, this.userId});

  FavoriteMotel.fromMap(Map data, String id):
    id = id ?? '',
    motelId = data  ['motelId'] ?? '',
    userId = data  ['userId'] ?? '';

    toJson() {
      return {
        "motelId": motelId,
        "userId": userId
      };
    }
}
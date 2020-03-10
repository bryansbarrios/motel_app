class Rating {
  String id;
  String motelId;
  String userId;
  double rating;

  Rating ({this.motelId, this.userId, this.rating});

  Rating.fromMap(Map data, String id):
    id = id ?? '',
    motelId = data ['motelId'] ?? '',
    userId = data ['userId'] ?? '',
    rating = data ['rating'] ?? 0.0;
  
    toJson() {
      return {
        "motelId": motelId,
        "userId": userId,
        "rating": rating
      };
    }
}
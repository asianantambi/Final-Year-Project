class HotelModel {
  String name;
  String floor;
  String description;
  String imageUrl;
  int price;
  List<Review> reviews;
  List<Amenitie> amenities;

  HotelModel({
    this.name,
    this.floor,
    this.imageUrl,
    this.reviews,
    this.price,
    this.description,
    this.amenities,
  });

  HotelModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    floor = json['floor'];
    
    if (json['reviews'] != null) {
      reviews = <Review>[];
      json['reviews'].forEach((v) {
        reviews.add(Review.fromJson(v));
      });
    }
    if (json['amenities'] != null) {
      amenities = <Amenitie>[];
      json['amenities'].forEach((v) {
        amenities.add(Amenitie.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['price'] = price;
    data['description'] = description;
    data['floor'] = floor;
    data['imageUrl'] = imageUrl;
    if (reviews != null) {
      data['reviews'] = reviews.map((v) => v.toJson()).toList();
    }
    if (amenities != null) {
      data['amenities'] = amenities.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Room {
  String imageUrl;
  String name;

  Room({this.imageUrl, this.name});

  Room.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['imageUrl'] = imageUrl;
    data['name'] = name;
    return data;
  }
}

class Review {
  String message;
  String user;
  String userImage;
  int rate;

  Review({
    this.message,
    this.user,
    this.userImage,
    this.rate,
  });

  Review.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'];
    userImage = json['userImage'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = message;
    data['user'] = user;
    data['userImage'] = userImage;
    data['rate'] = rate;
    return data;
  }
}

class Amenitie {
  String name;
  String imageUrl;

  Amenitie({this.name, this.imageUrl});

  Amenitie.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['imageUrl'] = imageUrl;
    return data;
  }
}

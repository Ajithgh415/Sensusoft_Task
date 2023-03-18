// To parse this JSON data, do
//
//     final responseData = responseDataFromJson(jsonString);

import 'dart:convert';

ResponseData responseDataFromJson(String str) =>
    ResponseData.fromJson(json.decode(str));

String responseDataToJson(ResponseData data) => json.encode(data.toJson());

class ResponseData {
  ResponseData({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  Data? data;

  factory ResponseData.fromJson(Map<String, dynamic> json) => ResponseData(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.nearby,
    this.popular,
  });

  List<Nearby>? nearby;
  List<Popular>? popular;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        nearby: json["nearby"] == null
            ? []
            : List<Nearby>.from(json["nearby"]!.map((x) => Nearby.fromJson(x))),
        popular: json["popular"] == null
            ? []
            : List<Popular>.from(
                json["popular"]!.map((x) => Popular.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nearby": nearby == null
            ? []
            : List<dynamic>.from(nearby!.map((x) => x.toJson())),
        "popular": popular == null
            ? []
            : List<dynamic>.from(popular!.map((x) => x.toJson())),
      };
}

class Nearby {
  Nearby({
    this.id,
    this.name,
    this.description,
    this.location,
    this.price,
    this.min,
    this.active,
    this.routeVideoId,
    this.language,
    this.coverImage,
    this.stepcount,
    this.duration,
    this.distance,
    this.trashed,
    this.averageRating,
    this.isFavourite,
    this.author,
    this.travelmethod,
    this.steps,
    this.categories,
    this.images,
    this.audio,
  });

  int? id;
  String? name;
  String? description;
  String? location;
  double? price;
  int? min;
  String? active;
  dynamic routeVideoId;
  dynamic language;
  String? coverImage;
  int? stepcount;
  int? duration;
  int? distance;
  bool? trashed;
  int? averageRating;
  bool? isFavourite;
  NearbyAuthor? author;
  Travelmethod? travelmethod;
  List<Step>? steps;
  List<Category>? categories;
  List<Image>? images;
  dynamic audio;

  factory Nearby.fromJson(Map<String, dynamic> json) => Nearby(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        location: json["location"],
        price: json["price"]?.toDouble(),
        min: json["min"],
        active: json["active"],
        routeVideoId: json["route_video_id"],
        language: json["language"],
        coverImage: json["cover_image"],
        stepcount: json["stepcount"],
        duration: json["duration"],
        distance: json["distance"],
        trashed: json["trashed"],
        averageRating: json["average_rating"],
        isFavourite: json["is_favourite"],
        author: json["author"] == null
            ? null
            : NearbyAuthor.fromJson(json["author"]),
        travelmethod: json["travelmethod"] == null
            ? null
            : Travelmethod.fromJson(json["travelmethod"]),
        steps: json["steps"] == null
            ? []
            : List<Step>.from(json["steps"]!.map((x) => Step.fromJson(x))),
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromJson(x))),
        images: json["images"] == null
            ? []
            : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        audio: json["audio"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "location": location,
        "price": price,
        "min": min,
        "active": active,
        "route_video_id": routeVideoId,
        "language": language,
        "cover_image": coverImage,
        "stepcount": stepcount,
        "duration": duration,
        "distance": distance,
        "trashed": trashed,
        "average_rating": averageRating,
        "is_favourite": isFavourite,
        "author": author?.toJson(),
        "travelmethod": travelmethod?.toJson(),
        "steps": steps == null
            ? []
            : List<dynamic>.from(steps!.map((x) => x.toJson())),
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "audio": audio,
      };
}

class NearbyAuthor {
  NearbyAuthor({
    this.id,
    this.username,
    this.email,
    this.birthday,
    this.location,
    this.description,
    this.hobbies,
    this.job,
    this.imgPath,
    this.appleId,
    this.googleId,
    this.otp,
    this.otpExpiry,
    this.isVerified,
    this.active,
    this.stripeCustomerId,
    this.routesStarredIds,
    this.level,
  });

  int? id;
  String? username;
  String? email;
  String? birthday;
  String? location;
  String? description;
  String? hobbies;
  String? job;
  String? imgPath;
  dynamic appleId;
  dynamic googleId;
  int? otp;
  DateTime? otpExpiry;
  int? isVerified;
  String? active;
  String? stripeCustomerId;
  List<int>? routesStarredIds;
  Level? level;

  factory NearbyAuthor.fromJson(Map<String, dynamic> json) => NearbyAuthor(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        birthday: json["birthday"],
        location: json["location"],
        description: json["description"],
        hobbies: json["hobbies"],
        job: json["job"],
        imgPath: json["img_path"],
        appleId: json["apple_id"],
        googleId: json["google_id"],
        otp: json["otp"],
        otpExpiry: json["otp_expiry"] == null
            ? null
            : DateTime.parse(json["otp_expiry"]),
        isVerified: json["is_verified"],
        active: json["active"],
        stripeCustomerId: json["stripe_customer_id"],
        routesStarredIds: json["routes_starred_ids"] == null
            ? []
            : List<int>.from(json["routes_starred_ids"]!.map((x) => x)),
        level: json["level"] == null ? null : Level.fromJson(json["level"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "birthday": birthday,
        "location": location,
        "description": description,
        "hobbies": hobbies,
        "job": job,
        "img_path": imgPath,
        "apple_id": appleId,
        "google_id": googleId,
        "otp": otp,
        "otp_expiry": otpExpiry?.toIso8601String(),
        "is_verified": isVerified,
        "active": active,
        "stripe_customer_id": stripeCustomerId,
        "routes_starred_ids": routesStarredIds == null
            ? []
            : List<dynamic>.from(routesStarredIds!.map((x) => x)),
        "level": level?.toJson(),
      };
}

class Level {
  Level({
    this.id,
    this.description,
  });

  int? id;
  String? description;

  factory Level.fromJson(Map<String, dynamic> json) => Level(
        id: json["id"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
      };
}

class Category {
  Category({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Image {
  Image({
    this.id,
    this.path,
  });

  int? id;
  String? path;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        path: json["path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "path": path,
      };
}

class Step {
  Step({
    this.id,
    this.routeId,
    this.routeTravelmethodId,
    this.order,
    this.description,
    this.isStart,
    this.isFinish,
    this.distance,
    this.duration,
    this.geopos,
    this.locLat,
    this.locLong,
    this.audios,
    this.travelmethod,
  });

  int? id;
  int? routeId;
  int? routeTravelmethodId;
  int? order;
  String? description;
  int? isStart;
  int? isFinish;
  int? distance;
  int? duration;
  Geopos? geopos;
  double? locLat;
  double? locLong;
  List<Audio>? audios;
  Travelmethod? travelmethod;

  factory Step.fromJson(Map<String, dynamic> json) => Step(
        id: json["id"],
        routeId: json["route_id"],
        routeTravelmethodId: json["route_travelmethod_id"],
        order: json["order"],
        description: json["description"],
        isStart: json["is_start"],
        isFinish: json["is_finish"],
        distance: json["distance"],
        duration: json["duration"],
        geopos: json["geopos"] == null ? null : Geopos.fromJson(json["geopos"]),
        locLat: json["loc_lat"]?.toDouble(),
        locLong: json["loc_long"]?.toDouble(),
        audios: json["audios"] == null
            ? []
            : List<Audio>.from(json["audios"]!.map((x) => Audio.fromJson(x))),
        travelmethod: json["travelmethod"] == null
            ? null
            : Travelmethod.fromJson(json["travelmethod"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "route_id": routeId,
        "route_travelmethod_id": routeTravelmethodId,
        "order": order,
        "description": description,
        "is_start": isStart,
        "is_finish": isFinish,
        "distance": distance,
        "duration": duration,
        "geopos": geopos?.toJson(),
        "loc_lat": locLat,
        "loc_long": locLong,
        "audios": audios == null
            ? []
            : List<dynamic>.from(audios!.map((x) => x.toJson())),
        "travelmethod": travelmethod?.toJson(),
      };
}

class Audio {
  Audio({
    this.id,
    this.routeStepId,
    this.name,
    this.path,
    this.runtime,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int? id;
  int? routeStepId;
  String? name;
  String? path;
  String? runtime;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  factory Audio.fromJson(Map<String, dynamic> json) => Audio(
        id: json["id"],
        routeStepId: json["route_step_id"],
        name: json["name"],
        path: json["path"],
        runtime: json["runtime"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "route_step_id": routeStepId,
        "name": name,
        "path": path,
        "runtime": runtime,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
      };
}

class Geopos {
  Geopos({
    this.type,
    this.coordinates,
  });

  Type? type;
  List<double>? coordinates;

  factory Geopos.fromJson(Map<String, dynamic> json) => Geopos(
        type: typeValues.map[json["type"]]!,
        coordinates: json["coordinates"] == null
            ? []
            : List<double>.from(json["coordinates"]!.map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
        "coordinates": coordinates == null
            ? []
            : List<dynamic>.from(coordinates!.map((x) => x)),
      };
}

enum Type { POINT }

final typeValues = EnumValues({"Point": Type.POINT});

class Travelmethod {
  Travelmethod({
    this.id,
    this.name,
  });

  int? id;
  Name? name;

  factory Travelmethod.fromJson(Map<String, dynamic> json) => Travelmethod(
        id: json["id"],
        name: nameValues.map[json["name"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
      };
}

enum Name { FAHRRAD, BUS_BAHN, ZU_FU }

final nameValues = EnumValues(
    {"Bus/Bahn": Name.BUS_BAHN, "Fahrrad": Name.FAHRRAD, "Zu Fuß": Name.ZU_FU});

class Popular {
  Popular({
    this.id,
    this.name,
    this.description,
    this.location,
    this.price,
    this.min,
    this.active,
    this.routeVideoId,
    this.language,
    this.coverImage,
    this.stepcount,
    this.duration,
    this.distance,
    this.trashed,
    this.averageRating,
    this.isFavourite,
    this.author,
    this.travelmethod,
    this.steps,
    this.categories,
    this.images,
    this.audio,
  });

  int? id;
  String? name;
  String? description;
  String? location;
  double? price;
  int? min;
  String? active;
  dynamic routeVideoId;
  dynamic language;
  String? coverImage;
  int? stepcount;
  int? duration;
  int? distance;
  bool? trashed;
  double? averageRating;
  bool? isFavourite;
  PopularAuthor? author;
  Travelmethod? travelmethod;
  List<Step>? steps;
  List<Category>? categories;
  List<Image>? images;
  Audio? audio;

  factory Popular.fromJson(Map<String, dynamic> json) => Popular(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        location: json["location"],
        price: json["price"]?.toDouble(),
        min: json["min"],
        active: json["active"],
        routeVideoId: json["route_video_id"],
        language: json["language"],
        coverImage: json["cover_image"],
        stepcount: json["stepcount"],
        duration: json["duration"],
        distance: json["distance"],
        trashed: json["trashed"],
        averageRating: json["average_rating"]?.toDouble(),
        isFavourite: json["is_favourite"],
        author: json["author"] == null
            ? null
            : PopularAuthor.fromJson(json["author"]),
        travelmethod: json["travelmethod"] == null
            ? null
            : Travelmethod.fromJson(json["travelmethod"]),
        steps: json["steps"] == null
            ? []
            : List<Step>.from(json["steps"]!.map((x) => Step.fromJson(x))),
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromJson(x))),
        images: json["images"] == null
            ? []
            : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        audio: json["audio"] == null ? null : Audio.fromJson(json["audio"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "location": location,
        "price": price,
        "min": min,
        "active": active,
        "route_video_id": routeVideoId,
        "language": language,
        "cover_image": coverImage,
        "stepcount": stepcount,
        "duration": duration,
        "distance": distance,
        "trashed": trashed,
        "average_rating": averageRating,
        "is_favourite": isFavourite,
        "author": author?.toJson(),
        "travelmethod": travelmethod?.toJson(),
        "steps": steps == null
            ? []
            : List<dynamic>.from(steps!.map((x) => x.toJson())),
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "audio": audio?.toJson(),
      };
}

class PopularAuthor {
  PopularAuthor({
    this.id,
    this.username,
    this.email,
    this.birthday,
    this.location,
    this.description,
    this.hobbies,
    this.job,
    this.imgPath,
    this.appleId,
    this.googleId,
    this.otp,
    this.otpExpiry,
    this.isVerified,
    this.active,
    this.stripeCustomerId,
    this.routesStarredIds,
    this.level,
  });

  int? id;
  String? username;
  String? email;
  String? birthday;
  String? location;
  String? description;
  String? hobbies;
  String? job;
  String? imgPath;
  String? appleId;
  dynamic googleId;
  int? otp;
  DateTime? otpExpiry;
  int? isVerified;
  String? active;
  String? stripeCustomerId;
  List<int>? routesStarredIds;
  Level? level;

  factory PopularAuthor.fromJson(Map<String, dynamic> json) => PopularAuthor(
        id: json["id"],
        username: json["username"],
        email: json["email"] ?? "",
        birthday: json["birthday"],
        location: json["location"],
        description: json["description"],
        hobbies: json["hobbies"],
        job: json["job"],
        imgPath: json["img_path"],
        appleId: json["apple_id"],
        googleId: json["google_id"],
        otp: json["otp"],
        otpExpiry: json["otp_expiry"] == null
            ? null
            : DateTime.parse(json["otp_expiry"]),
        isVerified: json["is_verified"],
        active: json["active"],
        stripeCustomerId: json["stripe_customer_id"],
        routesStarredIds: json["routes_starred_ids"] == null
            ? []
            : List<int>.from(json["routes_starred_ids"]!.map((x) => x)),
        level: json["level"] == null ? null : Level.fromJson(json["level"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "birthday": birthday,
        "location": location,
        "description": description,
        "hobbies": hobbies,
        "job": job,
        "img_path": imgPath,
        "apple_id": appleId,
        "google_id": googleId,
        "otp": otp,
        "otp_expiry": otpExpiry?.toIso8601String(),
        "is_verified": isVerified,
        "active": active,
        "stripe_customer_id": stripeCustomerId,
        "routes_starred_ids": routesStarredIds == null
            ? []
            : List<dynamic>.from(routesStarredIds!.map((x) => x)),
        "level": level?.toJson(),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

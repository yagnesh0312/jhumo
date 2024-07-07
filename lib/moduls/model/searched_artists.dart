// To parse this JSON data, do
//
//     final searchArtist = searchArtistFromJson(jsonString);

import 'dart:convert';

SearchArtist searchArtistFromJson(String str) => SearchArtist.fromJson(json.decode(str));

String searchArtistToJson(SearchArtist data) => json.encode(data.toJson());

class SearchArtist {
    bool? success;
    Data? data;

    SearchArtist({
        this.success,
        this.data,
    });

    factory SearchArtist.fromJson(Map<String, dynamic> json) => SearchArtist(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
    };
}

class Data {
    int? total;
    int? start;
    List<Result>? results;

    Data({
        this.total,
        this.start,
        this.results,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        total: json["total"],
        start: json["start"],
        results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "start": start,
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
    };
}

class Result {
    String? id;
    String? name;
    String? role;
    List<Image>? image;
    String? type;
    String? url;

    Result({
        this.id,
        this.name,
        this.role,
        this.image,
        this.type,
        this.url,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        role: json["role"],
        image: json["image"] == null ? [] : List<Image>.from(json["image"]!.map((x) => Image.fromJson(x))),
        type: json["type"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "role": role,
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x.toJson())),
        "type": type,
        "url": url,
    };
}

class Image {
    String? quality;
    String? url;

    Image({
        this.quality,
        this.url,
    });

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        quality: json["quality"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "quality": quality,
        "url": url,
    };
}

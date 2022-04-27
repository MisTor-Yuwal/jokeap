// To parse required this JSON data, do
//
//     final recipesModel = recipesModelFromJson(jsonString);

import 'dart:convert';

RecipesModel recipesModelFromJson(String str) => RecipesModel.fromJson(json.decode(str));

String recipesModelToJson(RecipesModel data) => json.encode(data.toJson());

class RecipesModel {
    RecipesModel({
        required this.results,
        required this.offset,
        required this.number,
        required this.totalResults,
    });

    List<Result> results;
    int offset;
    int number;
    int totalResults;

    factory RecipesModel.fromJson(Map<String, dynamic> json) => RecipesModel(
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        offset: json["offset"],
        number: json["number"],
        totalResults: json["totalResults"],
    );

    Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "offset": offset,
        "number": number,
        "totalResults": totalResults,
    };
}

class Result {
    Result({
        required this.id,
        required this.title,
        required this.image,
        required this.imageType,
    });

    int id;
    String title;
    String image;
    ImageType ?imageType;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        imageType: imageTypeValues.map[json["imageType"]],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "imageType": imageTypeValues.reverse[imageType],
    };
}

enum ImageType { JPG }

final imageTypeValues = EnumValues({
    "jpg": ImageType.JPG
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String>? reverseMap;

    EnumValues( this.map);

    Map<T, String> get reverse {
        reverseMap ??= map.map((k, v) => MapEntry(v, k));
        return reverseMap!;
    }
}

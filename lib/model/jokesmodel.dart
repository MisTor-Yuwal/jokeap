// To parse required this JSON data, do
//
//     final jokesModel = jokesModelFromJson(jsonString);

import 'dart:convert';

JokesModel jokesModelFromJson(String str) => JokesModel.fromJson(json.decode(str));

String jokesModelToJson(JokesModel data) => json.encode(data.toJson());

class JokesModel {
    JokesModel({
        required this.categories,
        required this.iconUrl,
        required this.id,
        required this.url,
        required this.value,
    });

    List<dynamic> categories;
    String iconUrl;
    String id;
    String url;
    String value;

    factory JokesModel.fromJson(Map<String, dynamic> json) => JokesModel(
        categories: List<dynamic>.from(json["categories"].map((x) => x)),
        iconUrl: json["icon_url"],
        id: json["id"],
        url: json["url"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "icon_url": iconUrl,
        "id": id,
        "url": url,
        "value": value,
    };
}

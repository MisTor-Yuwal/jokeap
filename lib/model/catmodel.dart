// To parse required this JSON data, do
//
//     final catModel = catModelFromJson(jsonString);

import 'dart:convert';

CatModel catModelFromJson(String str) => CatModel.fromJson(json.decode(str));

String catModelToJson(CatModel data) => json.encode(data.toJson());

class CatModel {
    CatModel({
        required this.fact,
        required this.length,
    });

    String fact;
    int length;

    factory CatModel.fromJson(Map<String, dynamic> json) => CatModel(
        fact: json["fact"],
        length: json["length"],
    );

    Map<String, dynamic> toJson() => {
        "fact": fact,
        "length": length,
    };
}

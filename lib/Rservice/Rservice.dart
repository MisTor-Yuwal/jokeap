import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jokeap/model/catmodel.dart';
import 'package:jokeap/model/dog_model.dart';
import 'package:jokeap/model/jokesmodel.dart';
import 'package:jokeap/model/recipes_model.dart';
class RemoteService {
  static var client = http.Client();

  static Future<JokesModel?> fetchJokes() async{
    
    try{
      var response = await client.get(Uri.parse("https://api.chucknorris.io/jokes/random"));
      if(response.statusCode == 200){
        var jsonString = response.body;
        return jokesModelFromJson(jsonString);
      }
      else{
        return null;
      }
    }
    catch(m){
      Get.snackbar("Error", m.toString());
    }
  } 
  static Future<CatModel?> fetchFact() async{
    try{
      var response = await client.get(Uri.parse("https://catfact.ninja/fact"));
      if(response.statusCode == 200){
        var jsonString = response.body;
        return catModelFromJson(jsonString);
      }
      else{
        return null;
      }
    }
    catch(m){
      Get.snackbar("Error", m.toString());
    }
  }
  static Future<List<DogModel>?> fetchDogList() async{
    try{
        var response = await client.get(Uri.parse("https://api.thedogapi.com/v1/breeds"));
        if(response.statusCode == 200){
          var jsonString = response.body;
          return dogModelFromJson(jsonString);
        }
        else{
          return null;
        }
    }
    catch(a){
      Get.snackbar("Error", a.toString());
    }
  }
  static Future<RecipesModel?> fetchRecipes() async{
    try {
      var platform = await client.get(Uri.parse("https://api.spoonacular.com/recipes/complexSearch?query=pasta&apiKey=8628ac72f5514ef29fa1f71e51a702d5"));
      if(platform.statusCode == 200){
        var jsonString =  platform.body;
        return recipesModelFromJson(jsonString);
      }
      else{
        return null;
      }
    }
    catch(m){
      Get.snackbar("Error", m.toString());
    }
  }
}

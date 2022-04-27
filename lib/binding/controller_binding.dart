import 'package:get/get.dart';
import 'package:jokeap/controller/cat_controller.dart';
import 'package:jokeap/controller/dog_controller.dart';
import 'package:jokeap/controller/joke_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(JokeController());
    Get.put(MilapCatController());
    Get.put(DogController());
  }
    
}
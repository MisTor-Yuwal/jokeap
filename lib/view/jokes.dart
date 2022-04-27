import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jokeap/controller/joke_controller.dart';
class JokesPage extends StatelessWidget {
  const JokesPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var jc = Get.find<JokeController>();
    return Obx((){
    if(jc.isLoading.value == true){
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    else{
      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(jc.joke.value.value, style: const TextStyle(fontSize: 14),),
          ],
        ),
      );
    }
    });
  }
}
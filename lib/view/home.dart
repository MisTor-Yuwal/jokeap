import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jokeap/view/dog.dart';
import 'package:jokeap/view/fact.dart';
import 'package:jokeap/view/jokes.dart';
class HomeView extends StatelessWidget {
  const HomeView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Center(
              child: ElevatedButton(onPressed: (){
                Get.to(() => const JokesPage());
              }, child: const Text("Jokes For ya"),
              ),
            ),
            const VBS(),
            ElevatedButton(onPressed: (){
              Get.to(() => const FactPage());
            }, child: const Text("Meow Facts"),),
            const VBS(),
            ElevatedButton(onPressed: (){
              Get.to(() => const DogView());
            }, child: const Text("Dog List"),),
          ],
        ),
      ),
    );
  }
}

class VBS extends StatelessWidget {
  const VBS({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.size.width,
      height: 10,
    );
  }
}
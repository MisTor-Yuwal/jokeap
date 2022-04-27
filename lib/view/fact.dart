import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jokeap/controller/cat_controller.dart';
class FactPage extends StatelessWidget {
  const FactPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var kc = Get.find<MilapCatController>();
    return SafeArea(
      child: Scaffold(
        body:  Obx((){
          if(kc.isLoading.value == true){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else{
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(kc.fact.value.fact, style: const TextStyle(fontSize: 14),),
                ],
              ),
            );
          }
          })
      ), );
  }
}
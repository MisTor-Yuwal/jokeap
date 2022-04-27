import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jokeap/controller/dog_controller.dart';
class DogView extends StatelessWidget {
  const DogView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dc =Get.find<DogController>();
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          if(dc.isLoading.value == true){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else{
            return SingleChildScrollView(
              child: Column(
                children: [ListView.builder(
                  itemCount: dc.dogList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Text(dc.dogList[index].name!);
                })],
              ),
            );
          }
        }),
      ),
    );
  }
}
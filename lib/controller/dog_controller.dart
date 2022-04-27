import 'package:get/get.dart';
import 'package:jokeap/Rservice/Rservice.dart';
import 'package:jokeap/model/dog_model.dart';

class DogController extends GetxController{
  var dogList = <DogModel>[].obs;
  var isLoading = true.obs;

  Future getDogList() async{
    try{
      isLoading(true);
      var data = await RemoteService.fetchDogList();
    if(data!=null){
      dogList.value = data;
    }
    }
    catch(a){
      Get.snackbar("Error", a.toString());
    }
    finally{
      isLoading(false);
    }
  }
  @override
  void onInit() {
    super.onInit();
    getDogList();
  }
}
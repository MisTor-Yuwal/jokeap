import 'package:get/get.dart';
import 'package:jokeap/Rservice/Rservice.dart';
import 'package:jokeap/model/catmodel.dart';

class MilapCatController extends GetxController{
  var fact = CatModel(fact: "", length: 0).obs;
  var isLoading = true.obs;

  Future getcatFact() async{
    try{
      isLoading(true);
      var data = await RemoteService.fetchFact();
      if(data != null){
        fact.value = data;
      }
    }
    catch(m){
      Get.snackbar("Error", m.toString());
    }
    finally{
      isLoading(false);
    }
  }
  @override
  void onInit() {
    super.onInit();
    getcatFact();
  }
  
}
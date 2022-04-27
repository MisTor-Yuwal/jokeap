import 'package:get/get.dart';
import 'package:jokeap/Rservice/Rservice.dart';
import 'package:jokeap/model/jokesmodel.dart';

class JokeController extends GetxController{
  var joke = JokesModel(categories: [], iconUrl: "", id: "", url: "", value: "").obs;
  var isLoading = true.obs;

  Future getJokes() async{
    try{
      var data = await RemoteService.fetchJokes();
      if(data !=null){
        joke.value = data;
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
    getJokes();
  }
}

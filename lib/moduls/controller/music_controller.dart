
import 'package:get/get.dart';
import 'package:jhumo/moduls/model/service.dart';
import 'package:http/http.dart' as http;

class MusicController extends GetxController {
  List<SongService> ss = [];
  List<String> strs = ["Gujarati", "Romantic", "Hindi", "English", "Motivated"];
  @override
  onInit() {
    super.onInit();
    fetchData();
  }

  fetchData() async {
 
    for (var i = 0; i < strs.length; i++) {
      var response = await http.get(
          Uri.parse("https://saavn.dev/api/search/songs?query=${strs[i]}"));
      ss.add(serviceFromJson(response.body));
      update();
    }
  }
}

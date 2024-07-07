import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:jhumo/moduls/model/service.dart';

class PopulerController extends GetxController {
  SongService? service;
  @override
  onInit() {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    var _storage = GetStorage("user").read("lang");
    var response = await http
        .get(Uri.parse("https://saavn.dev/api/search/songs?query=$_storage popular"));
    service = serviceFromJson(response.body);
    // print(service!.success);
    update();
  }
}

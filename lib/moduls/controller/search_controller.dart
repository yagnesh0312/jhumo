import 'package:get/get.dart';
import 'package:jhumo/moduls/model/Search_model.dart';
import 'package:http/http.dart' as http;
import 'package:jhumo/moduls/methods.dart';
import 'package:jhumo/moduls/model/service.dart';

class SearchControl extends GetxController {
  SearchModel? searchModel;
  String search = "";
  SongService? allSongs;
  // SongService? allSongs;
  SearchControl(this.search);
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  onChange(String s) {
    searchAll(s);
    searchSong(s);
  }

  searchAll(String s) async {
    search = s;
    var responce =
        await http.get(Uri.parse("https://saavn.dev/api/search?query=$search"));
    // print(responce.body);
    searchModel = searchModelFromJson(responce.body);
    // print(searchModel!.data!.toJson());

    update();
  }

  searchSong(String s) async {
    search = s;
    var responce = await http
        .get(Uri.parse("https://saavn.dev/api/search/songs?query=$search"));
    allSongs = serviceFromJson(responce.body);
    // allSongs!.data!.results!.toPrint;

    update();
    // https://saavn.dev/api/search/songs?query=Believer
  }

  searchArtist(String s) async {
    // https://saavn.dev/api/search/artists?query=Adele
    search = s;
    var responce = await http
        .get(Uri.parse("https://saavn.dev/api/search/artists?query=$search"));


    update();
  }
}

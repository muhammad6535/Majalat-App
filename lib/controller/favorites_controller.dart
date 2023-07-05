import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesController extends GetxController {
  List<String> favList = [];
  @override
  void onInit() {
    () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.getStringList("favList") == null) {
        prefs.setStringList("favList", favList);
        favList = prefs.getStringList("favList")!;
      } else {
        favList = prefs.getStringList("favList")!;
      }
    }();
    super.onInit();
  }

  void addToFavorite(String phone) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    favList = prefs.getStringList("favList")!;
    if (!favList.contains(phone)) favList.add(phone);
    prefs.setStringList("favList", favList);
  }

  removeFromFavorite(String phone) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    favList = prefs.getStringList("favList")!;
    if (favList.contains(phone)) favList.remove(phone);
    prefs.setStringList("favList", favList);
  }
}

import 'package:get/get.dart';

class ScreenController extends GetxController {
  int currentScreen = 0;
  changePage(int index) {
    currentScreen = index;
    update();
  }
}

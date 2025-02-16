import 'package:get/get.dart';
import 'package:getx_practice/model/model.dart';

class Controller extends GetxController {
  final person = Person().obs;

  void updateInfo() {
    person.update((value) {
      value?.age++;
      value?.name = '김수현';
    });
  }
}
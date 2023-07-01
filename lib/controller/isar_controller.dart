// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

import 'package:routine_app/collections/category.dart';
import 'package:routine_app/helper/isar_services.dart';

class IsarController extends GetxController {
  Category category;

  List<Category> catsList = [];
  String selectedCat = 'hello';
  
  IsarController({
    required this.category,
  });

  var isarService = IsarServices();

  @override
  void onInit() {
    super.onInit();
    isarService = IsarServices();
  }

  addnewCategory() {
    isarService.addCats(category);
    update();
  }

  Future<void> readAllCats() async {
    catsList = await isarService.getAllCats();
    update();
  }
}

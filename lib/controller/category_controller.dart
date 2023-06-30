import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:routine_app/collections/routine.dart';
import '../collections/category.dart';

class CategoryContoller extends GetxController {
  List<String> cats = [
    'groceries',
    'exercise',
    'working',
  ];
  RxString selectedCat = 'groceries'.obs;
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationSupportDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [CategorySchema, RoutineSchema],
        inspector: true,
        directory: dir.path,
      );
    }

    return Future.value(Isar.getInstance());
  }

  Future<void> addCategory(Category newCategory) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.categorys.putSync(newCategory));
  }

  Future<List<Category>> getAllCategories() async {
    final isar = await db;
    return await isar.categorys.where().findAll();
  }
}

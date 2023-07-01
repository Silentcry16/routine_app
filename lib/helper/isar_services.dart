import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:routine_app/collections/category.dart';
import 'package:routine_app/collections/routine.dart';

class IsarServices {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

//init DB
  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationSupportDirectory();
      return await Isar.open([CategorySchema, RoutineSchema],
          inspector: true, directory: dir.path);
    }

    return Future.value(Isar.getInstance());
  }

  Future<void> addCats(Category newCategory) async {
    final isar = await db;

    isar.writeTxnSync<int>(() => isar.categorys.putSync(newCategory));
  }

  Future<List<Category>> getAllCats() async {
    final isar = await db;
    return await isar.categorys.where().findAll();
  }
}

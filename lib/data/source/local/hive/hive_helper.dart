import 'package:flutter_task/data/model/hive_model/cat_holder.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_task/data/model/hive_model/cat_adapter.dart';

class HiveHelper{
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(CatModelAdapter());
    await Hive.openBox('facts');
  }

  static Future<void> saveFact(CatHolder catHolder) async {
    var box = Hive.box('facts');
    box.put(DateTime.now().toString(), catHolder);
  }

  static List<CatHolder> getFacts() {
    var box = Hive.box('facts');
    return box.values.cast<CatHolder>().toList();
  }

}
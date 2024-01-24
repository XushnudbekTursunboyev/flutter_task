import 'package:flutter_task/data/model/hive_model/cat_holder.dart';
import 'package:hive/hive.dart';

class CatModelAdapter extends TypeAdapter<CatHolder> {
  @override
  CatHolder read(BinaryReader reader) {
    return CatHolder.fromJson(reader.readMap().cast());
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, CatHolder obj) {
    writer.writeMap(obj.toJson());
  }
}

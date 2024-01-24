import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class CatHolder {
  @HiveField(0)
  String? sId;
  @HiveField(1)
  String? text;
  @HiveField(2)
  String? createdAt;

  CatHolder({
    this.sId,
    this.text,
    this.createdAt,
  });

  factory CatHolder.fromJson(Map<String, dynamic> json) {
    return CatHolder(
      sId: json['_id'],
      text: json['text'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['text'] = text;
    data['createdAt'] = createdAt;
    return data;
  }
}
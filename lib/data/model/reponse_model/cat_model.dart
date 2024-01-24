import 'package:freezed_annotation/freezed_annotation.dart';

part 'cat_model.freezed.dart';
part 'cat_model.g.dart';


@freezed
class CatModel with _$CatModel {
  @JsonSerializable(explicitToJson: true)

  const factory CatModel(
  ApiStatus? status,
  String? sId,
  String? user,
  String? text,
  int? iV,
  String? source,
  String? updatedAt,
  String? type,
  String? createdAt,
  bool? deleted,
  bool? used,
      ) = _CatModel;

  factory CatModel.fromJson(Map<String, dynamic> json) =>
      _$CatModelFromJson(json);
}

@freezed
class ApiStatus with _$ApiStatus {
  @JsonSerializable(explicitToJson: true)

  const factory ApiStatus(
  bool? verified,
  int? sentCount
      ) = _ApiStatus;

  factory ApiStatus.fromJson(Map<String, dynamic> json) =>
      _$ApiStatusFromJson(json);
}
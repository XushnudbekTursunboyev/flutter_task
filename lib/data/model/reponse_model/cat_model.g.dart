// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CatModelImpl _$$CatModelImplFromJson(Map<String, dynamic> json) =>
    _$CatModelImpl(
      json['status'] == null
          ? null
          : ApiStatus.fromJson(json['status'] as Map<String, dynamic>),
      json['sId'] as String?,
      json['user'] as String?,
      json['text'] as String?,
      json['iV'] as int?,
      json['source'] as String?,
      json['updatedAt'] as String?,
      json['type'] as String?,
      json['createdAt'] as String?,
      json['deleted'] as bool?,
      json['used'] as bool?,
    );

Map<String, dynamic> _$$CatModelImplToJson(_$CatModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status?.toJson(),
      'sId': instance.sId,
      'user': instance.user,
      'text': instance.text,
      'iV': instance.iV,
      'source': instance.source,
      'updatedAt': instance.updatedAt,
      'type': instance.type,
      'createdAt': instance.createdAt,
      'deleted': instance.deleted,
      'used': instance.used,
    };

_$ApiStatusImpl _$$ApiStatusImplFromJson(Map<String, dynamic> json) =>
    _$ApiStatusImpl(
      json['verified'] as bool?,
      json['sentCount'] as int?,
    );

Map<String, dynamic> _$$ApiStatusImplToJson(_$ApiStatusImpl instance) =>
    <String, dynamic>{
      'verified': instance.verified,
      'sentCount': instance.sentCount,
    };

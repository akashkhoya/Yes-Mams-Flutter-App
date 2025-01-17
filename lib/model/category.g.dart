// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryData _$CategoryDataFromJson(Map<String, dynamic> json) {
  return CategoryData(
      json['statusCode'] as int,
      (json['value'] as List)
          ?.map((e) =>
              e == null ? null : ListData.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$CategoryDataToJson(CategoryData instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'value': instance.categoryList
    };

ListData _$ListDataFromJson(Map<String, dynamic> json) {
  return ListData(
      json['id'] as String,
      json['categoryTitle'] as String,
      json['categoryIMG'] as String,
      json['categoryName'] as String,
      json['categoryType'] as String,
      json['categoryCost'] as String,
      json['categoryDuration'] as String,
      json['isActive'] as bool,
      json['createdAt'] as String);
}

Map<String, dynamic> _$ListDataToJson(ListData instance) => <String, dynamic>{
      'id': instance.id,
      'categoryTitle': instance.categoryTitle,
      'categoryIMG': instance.categoryIMG,
      'categoryName': instance.categoryName,
      'categoryType': instance.categoryType,
      'categoryCost': instance.categoryCost,
      'categoryDuration': instance.categoryDuration,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubCategoryData _$SubCategoryDataFromJson(Map<String, dynamic> json) {
  return SubCategoryData(
      json['statusCode'] as int,
      (json['value'] as List)
          ?.map((e) => e == null
              ? null
              : SubCateData.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$SubCategoryDataToJson(SubCategoryData instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'value': instance.sub_categoryList
    };

SubCateData _$SubCateDataFromJson(Map<String, dynamic> json) {
  return SubCateData(
      json['id'] as String,
      json['categoryID'] as String,
      json['subCategoryIMG'] as String,
      json['subCategoryName'] as String,
      json['isActive'] as bool,
      json['createdAt'] as String);
}

Map<String, dynamic> _$SubCateDataToJson(SubCateData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryID': instance.categoryID,
      'subCategoryIMG': instance.subCategoryIMG,
      'subCategoryName': instance.subCategoryName,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt
    };

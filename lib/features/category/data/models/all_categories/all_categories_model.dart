import 'package:json_annotation/json_annotation.dart';

part 'all_categories_model.g.dart';

@JsonSerializable()
class AllCategoriesModel {
  final int? id;
  final String? name;

  AllCategoriesModel({this.id, this.name});

  factory AllCategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$AllCategoriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllCategoriesModelToJson(this);
}

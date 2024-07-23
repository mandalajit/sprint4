// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part "recipe_listing_model.g.dart";

@JsonSerializable()
class RecipeListingModel {
  @JsonKey(name: "_id")
  final String Recipeid;
  final String RecipeName;
  final String RecipeType;
  final String aboutRecipe;
  final String RecipeImage;

  const RecipeListingModel({
    required this.Recipeid,
    required this.RecipeName,
    required this.RecipeType,
    required this.aboutRecipe,
    required this.RecipeImage,
  });

  factory RecipeListingModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeListingModelFromJson(json);

  get size => null;

  Map<String, dynamic> toJson() => _$RecipeListingModelToJson(this);
  @override
  List<Object?> get props =>
      [Recipeid, RecipeName, RecipeType, aboutRecipe, RecipeImage];
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_listing_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeListingModel _$RecipeListingModelFromJson(Map<String, dynamic> json) =>
    RecipeListingModel(
      Recipeid: json['_id'] as String,
      RecipeName: json['RecipeName'] as String,
      RecipeType: json['RecipeType'] as String,
      aboutRecipe: json['aboutRecipe'] as String,
      RecipeImage: json['RecipeImage'] as String,
    );

Map<String, dynamic> _$RecipeListingModelToJson(RecipeListingModel instance) =>
    <String, dynamic>{
      '_id': instance.Recipeid,
      'RecipeName': instance.RecipeName,
      'RecipeType': instance.RecipeType,
      'aboutRecipe': instance.aboutRecipe,
      'RecipeImage': instance.RecipeImage,
    };

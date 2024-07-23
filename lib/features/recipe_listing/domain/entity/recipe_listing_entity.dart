import 'package:equatable/equatable.dart';

class RecipesListingEntity extends Equatable {
  final String recipeid;
  final String recipeName;
  final String recipeType;
  final String recipeAbout;
  final String recipeImage;

  const RecipesListingEntity({
    required this.recipeid,
    required this.recipeName,
    required this.recipeType,
    required this.recipeAbout,
    required this.recipeImage,
  });

  @override
  List<Object?> get props =>
      [recipeid, recipeName, recipeType, recipeAbout, recipeImage];
}

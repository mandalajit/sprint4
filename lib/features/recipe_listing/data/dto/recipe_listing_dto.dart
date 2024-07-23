
// import 'package:json_annotation/json_annotation.dart';

// part 'Recipe_listing_dto.g.dart';

// @JsonSerializable()
// class RecipeListingDto{
//   @JsonKey(name: "_id")
//   final String Recipeid;
//   final String RecipeName;
//   final String RecipeType;
//   final String aboutRecipe;
//   final String RecipeImage;

//   RecipeListingDto({
//     required this.Recipeid,
//     required this.RecipeName,
//     required this.RecipeType,
//     required this.aboutRecipe,
//     required this.RecipeImage,
// });
//   RecipeListingEntity toEntity(){
//     return RecipeListingEntity(
//         Recipeid: this.Recipeid,
//         RecipeName: this.RecipeName,
//         RecipeType: this.RecipeType,
//         Recipeabout: this.aboutRecipe,
//         RecipeImage: this.RecipeImage
//     );
//   }

//   factory RecipeListingDto.fromJson(Map<String, dynamic> json) =>
//       _$RecipeListingDtoFromJson(json);

//   Map<String, dynamic> toJson() => _$RecipeListingDtoToJson(this);
// }
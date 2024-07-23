

import 'package:recipe/features/recipe_listing/data/model/recipe_listing_model.dart';

class RecipeListingState{
  // ignore: non_constant_identifier_names
  final List<RecipeListingModel> RecipeListings;
  final bool isLoading;
  final bool hasMaxReached;
  final int page;

  const RecipeListingState({
    // ignore: non_constant_identifier_names
    required this.RecipeListings,
    required this.isLoading,
    required this.hasMaxReached,
    required this.page,
});
  factory RecipeListingState.inital(){
    return const RecipeListingState(
        RecipeListings: [],
        isLoading: false,
        hasMaxReached: false,
        page: 0);
  }
  RecipeListingState copyWith({
    // ignore: non_constant_identifier_names
    List<RecipeListingModel>? RecipeListings,
    bool? isLoading,
    bool? hasMaxReached,
    int? page,
}){
    return RecipeListingState(
        RecipeListings: RecipeListings ?? this.RecipeListings,
        isLoading: isLoading ?? this.isLoading,
        hasMaxReached: hasMaxReached ?? this.hasMaxReached,
        page: page ?? this.page,
    );
  }
}
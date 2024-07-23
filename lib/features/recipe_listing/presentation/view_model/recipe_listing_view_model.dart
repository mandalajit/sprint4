
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe/features/recipe_listing/data/data_source/recipe_listing_data_source.dart';
import 'package:recipe/features/recipe_listing/presentation/state/recipe_listing_state.dart';

// ignore: non_constant_identifier_names
final RecipeListingViewModelProvider = StateNotifierProvider<RecipeListingViewModel,RecipeListingState>((ref){
  // ignore: non_constant_identifier_names
  final RecipeListingDataSource = ref.read(RecipeListingDataSourceProvider);
  return RecipeListingViewModel(RecipeListingDataSource);
});


class RecipeListingViewModel extends StateNotifier<RecipeListingState>{
  // ignore: non_constant_identifier_names
  final RecipeListingDataSource _RecipeListingDataSource;
  RecipeListingViewModel(this._RecipeListingDataSource):super(RecipeListingState.inital()){
    getRecipeListings();

  }

  Future resetState() async{
    state = RecipeListingState.inital();
    getRecipeListings();
  }

  Future getRecipeListings() async{
    state = state.copyWith(isLoading: true);
    final currentState = state;
    final page = currentState.page+1;
    // ignore: non_constant_identifier_names
    final RecipeListings = currentState.RecipeListings;
    final hasReachedMax = currentState.hasMaxReached;

      if (!hasReachedMax) {
        // get data from data source
        final result = await _RecipeListingDataSource.getRecipeListings(page);
        result.fold(
              (failure) =>
          state = state.copyWith(hasMaxReached: true, isLoading: false),
              (data) {
            if (data.isEmpty) {
              state = state.copyWith(hasMaxReached: true);
            } else {
              state = state.copyWith(
                RecipeListings: [...RecipeListings, ...data],
                page: page,
                isLoading: false,
              );
            }
          },
        );

    }
  }
}
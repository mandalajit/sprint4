import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe/app/constants/api_endpoint.dart';
import 'package:recipe/core/failure/failure.dart';
import 'package:recipe/features/recipe_listing/data/model/recipe_listing_model.dart';

import '../../../../core/networking/remote/http_service.dart';

// ignore: non_constant_identifier_names
final RecipeListingDataSourceProvider = Provider.autoDispose(
        (ref) => RecipeListingDataSource(ref.read(httpServiceProvider)));

class RecipeListingDataSource {
  final Dio _dio;
  RecipeListingDataSource(this._dio);
  Future<Either<Failure, List<RecipeListingModel>>> getRecipeListings(int page) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.listings,
        queryParameters: {
          '_page': page,
          '_limit': ApiEndpoints.limitPage,
        },
      );
      final data = response.data as List;
      final listings = data.map((e) => RecipeListingModel.fromJson(e)).toList();
      return Right(listings);
    } on DioException catch (e) {

      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }
}

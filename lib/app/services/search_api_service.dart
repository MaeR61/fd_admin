import 'package:dio/dio.dart';
import 'package:fd_admin/app/common/enum/category_enums.dart';
import 'package:fd_admin/app/common/models/meta_model.dart';
import 'package:fd_admin/core/model/response_model.dart';

class SearchApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: "https://api.fda.gov/"));

  Future<ResponseModel<List<MetaTotal>>> fetchCategory({
    required String endpoint,
    required String query,
    required CategoryEnum category,
    int limit = 1,
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: {"search": query, "limit": limit},
      );

      final total = MetaTotal.fromJson(response.data, category: category);
      return ResponseModel.success([total]);
    } on DioException catch (e) {
      final errorData = e.response?.data as Map<String, dynamic>?;
      final errorCode = errorData?["error"]?["code"]?.toString();

      if (errorCode == "SERVER_ERROR" || errorCode == "NOT_FOUND") {
        return ResponseModel.error(
          "No data available for the selected category or server not responding!",
        );
      }

      return ResponseModel.error("Dio error: ${e.toString()}");
    }
  }

  Future<ResponseModel<List<MetaTotal>>> fetchAllCategories({
    required String query,
    int limit = 1,
  }) async {
    final List<MetaTotal> allResults = [];

    final List<MapEntry<String, CategoryEnum>> endpoints = [
      MapEntry("food/event.json", CategoryEnum.categoryFoods),
      MapEntry("animalandveterinary/event.json", CategoryEnum.categoryAnimal),
      MapEntry("drug/ndc.json", CategoryEnum.categoryDrugs),
      MapEntry("device/udi.json", CategoryEnum.categoryDevices),
      MapEntry("other/nsde.json", CategoryEnum.categoryOthers),
      MapEntry("tobacco/problem.json", CategoryEnum.categoryTobacco),
    ];

    for (final entry in endpoints) {
      final result = await fetchCategory(
        endpoint: entry.key,
        query: query,
        category: entry.value,
        limit: limit,
      );
      if (result.data != null) {
        allResults.addAll(result.data!);
      }
    }

    return ResponseModel.success(allResults);
  }

  /// Ana metot — kategoriye göre ilgili API çağrısını yapar.
  Future<ResponseModel<List<MetaTotal>>> fetchByCategory({
    required CategoryEnum category,
    required String query,
    int limit = 1,
  }) async {
    switch (category) {
      case CategoryEnum.categoryAll:
        return await fetchAllCategories(query: query, limit: limit);
      case CategoryEnum.categoryFoods:
        return await fetchCategory(
          endpoint: "food/event.json",
          query: query,
          limit: limit,
          category: category,
        );
      case CategoryEnum.categoryAnimal:
        return await fetchCategory(
          endpoint: "animalandveterinary/event.json",
          query: query,
          limit: limit,
          category: category,
        );
      case CategoryEnum.categoryDrugs:
        return await fetchCategory(
          endpoint: "drug/ndc.json",
          query: query,
          limit: limit,
          category: category,
        );
      case CategoryEnum.categoryDevices:
        return await fetchCategory(
          endpoint: "device/udi.json",
          query: query,
          limit: limit,
          category: category,
        );
      case CategoryEnum.categoryOthers:
        return await fetchCategory(
          endpoint: "other/nsde.json",
          query: query,
          limit: limit,
          category: category,
        );
      case CategoryEnum.categoryTobacco:
        return await fetchCategory(
          endpoint: "tobacco/problem.json",
          query: query,
          limit: limit,
          category: category,
        );
    }
  }
}

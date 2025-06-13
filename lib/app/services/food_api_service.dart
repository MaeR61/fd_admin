import 'package:dio/dio.dart';
import 'package:fd_admin/app/common/models/food_model.dart';
import 'package:fd_admin/core/model/response_model.dart';
import 'package:flutter/material.dart';

class FoodApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: "https://api.fda.gov/food/"));

  Future<ResponseModel<List<FoodModel>>> fetchFoods({
    required DateTimeRange dateRange,
    int limit = 10,
    int skip = 0,
    String sortOrder = 'desc',
  }) async {
    try {
      final start =
          "${dateRange.start.year.toString().padLeft(4, '0')}"
          "${dateRange.start.month.toString().padLeft(2, '0')}"
          "${dateRange.start.day.toString().padLeft(2, '0')}";
      final end =
          "${dateRange.end.year.toString().padLeft(4, '0')}"
          "${dateRange.end.month.toString().padLeft(2, '0')}"
          "${dateRange.end.day.toString().padLeft(2, '0')}";

      final search = "date_started:[$start TO $end]";

      final response = await _dio.get(
        "event.json",
        queryParameters: {
          "search": search,
          "limit": limit,
          "skip": skip,
          "sort": "date_started:$sortOrder",
        },
      );

      final data = response.data as Map<String, dynamic>?;
      final results = data?['results'] as List<dynamic>?;

      if (results == null) {
        return ResponseModel.error("Veri bulunamadı.");
      }

      final events = results.map((e) => FoodModel.fromJson(e)).toList();

      return ResponseModel.success(events);
    } on DioException catch (e) {
      final errorData = e.response?.data as Map<String, dynamic>?;

      final errorCode = errorData?["error"]?["code"]?.toString();
      if (errorCode == "SERVER_ERROR" || errorCode == "NOT_FOUND") {
        return ResponseModel.error(
          "No data available for the selected date range or server not responding!",
        );
      }

      return ResponseModel.error("Bağlantı hatası (Dio): ${e.toString()}");
    }
  }
}

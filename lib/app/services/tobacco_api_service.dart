import 'package:dio/dio.dart';
import 'package:fd_admin/app/common/models/tobacco_model.dart';
import 'package:fd_admin/core/model/response_model.dart';
import 'package:flutter/material.dart';

class TobaccoApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: "https://api.fda.gov/tobacco/"));

  Future<ResponseModel<List<TobaccoModel>>> fetchTobaccos({
    required DateTimeRange dateRange,
    int limit = 10,
    int skip = 0,
    String sortOrder = 'desc',
  }) async {
    try {
      String formatDate(DateTime d) =>
          "${d.year.toString().padLeft(4, '0')}${d.month.toString().padLeft(2, '0')}${d.day.toString().padLeft(2, '0')}";

      final search =
          "date_submitted:[${formatDate(dateRange.start)} TO ${formatDate(dateRange.end)}]";

      final response = await _dio.get(
        "problem.json",
        queryParameters: {
          "search": search,
          "limit": limit,
          "skip": skip,
          "sort": "date_submitted:$sortOrder",
        },
      );

      final data = response.data as Map<String, dynamic>?;

      final results = data?['results'] as List<dynamic>?;

      final events =
          results?.map((e) => TobaccoModel.fromJson(e)).toList() ?? [];

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

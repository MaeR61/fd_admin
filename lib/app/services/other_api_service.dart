import 'package:dio/dio.dart';
import 'package:fd_admin/app/common/models/other_model.dart';
import 'package:fd_admin/core/model/response_model.dart';
import 'package:flutter/material.dart';

class OtherApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: "https://api.fda.gov/other/"));

  Future<ResponseModel<List<OtherModel>>> fetchOthers({
    required DateTimeRange dateRange,
    int limit = 10,
    int skip = 0,
    String sortOrder = 'desc',
  }) async {
    try {
      String formatDate(DateTime d) =>
          "${d.year.toString().padLeft(4, '0')}${d.month.toString().padLeft(2, '0')}${d.day.toString().padLeft(2, '0')}";

      final search =
          "marketing_end_date:[${formatDate(dateRange.start)} TO ${formatDate(dateRange.end)}]";

      final response = await _dio.get(
        "nsde.json",
        queryParameters: {
          "search": search,
          "limit": limit,
          "skip": skip,
          "sort": "marketing_end_date:$sortOrder",
        },
      );

      final data = response.data as Map<String, dynamic>?;

      final results = data?['results'] as List<dynamic>?;

      final events = results?.map((e) => OtherModel.fromJson(e)).toList() ?? [];

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

import 'package:dio/dio.dart';
import 'package:fd_admin/app/common/models/device_model.dart';
import 'package:fd_admin/core/model/response_model.dart';
import 'package:flutter/material.dart';

class DeviceApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: "https://api.fda.gov/device/"));

  Future<ResponseModel<List<DeviceModel>>> fetchFoods({
    int limit = 10,
    int skip = 0,
    String sortOrder = 'desc',
    required DateTimeRange dateRange,
  }) async {
    try {
      final startDateStr =
          "${dateRange.start.year.toString().padLeft(4, '0')}"
          "${dateRange.start.month.toString().padLeft(2, '0')}"
          "${dateRange.start.day.toString().padLeft(2, '0')}";

      final endDateStr =
          "${dateRange.end.year.toString().padLeft(4, '0')}"
          "${dateRange.end.month.toString().padLeft(2, '0')}"
          "${dateRange.end.day.toString().padLeft(2, '0')}";

      final searchQuery =
          "_exists_:public_device_record_key AND publish_date:[$startDateStr TO $endDateStr]";

      final response = await _dio.get(
        'udi.json',
        queryParameters: {
          'search': searchQuery,
          'limit': limit,
          'skip': skip,
          'sort': "publish_date:$sortOrder",
        },
      );

      final dataMap = response.data as Map<String, dynamic>?;

      if (dataMap == null || dataMap['results'] == null) {
        return ResponseModel.error("Veri bulunamadı.");
      }

      final List<dynamic> resultList = dataMap['results'];
      final devices = resultList.map((e) => DeviceModel.fromJson(e)).toList();

      return ResponseModel.success(devices);
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

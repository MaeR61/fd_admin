import 'package:dio/dio.dart';
import 'package:fd_admin/app/common/models/drug_model.dart';
import 'package:fd_admin/core/model/response_model.dart';

class DrugApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: "https://api.fda.gov/drug/"));

  Future<ResponseModel<List<DrugModel>>> fetchFinishedDrugs({
    int limit = 10,
    int skip = 0,
    String sortOrder = 'desc',
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      String searchQuery = "finished:true";

      if (startDate != null && endDate != null) {
        formatter(DateTime dt) =>
            "${dt.year}${dt.month.toString().padLeft(2, '0')}${dt.day.toString().padLeft(2, '0')}";
        final start = formatter(startDate);
        final end = formatter(endDate);

        searchQuery += " AND marketing_start_date:[$start TO $end]";
      }

      final response = await _dio.get(
        'ndc.json',
        queryParameters: {
          'search': searchQuery,
          'limit': limit,
          'skip': skip,
          'sort': "marketing_start_date:$sortOrder",
        },
      );

      final dataMap = response.data as Map<String, dynamic>?;

      if (dataMap == null || dataMap['results'] == null) {
        return ResponseModel.error("Veri bulunamadı.");
      }

      final List<dynamic> resultList = dataMap['results'];
      final drugs = resultList.map((e) => DrugModel.fromJson(e)).toList();

      return ResponseModel.success(drugs);
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

  Future<ResponseModel<List<DrugModel>>> fetchunFinishedDrugs({
    int limit = 10,
    int skip = 0,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      String searchQuery = "finished:false";

      if (startDate != null && endDate != null) {
        formatter(DateTime dt) =>
            "${dt.year}${dt.month.toString().padLeft(2, '0')}${dt.day.toString().padLeft(2, '0')}";
        final start = formatter(startDate);
        final end = formatter(endDate);

        searchQuery += " AND marketing_start_date:[$start TO $end]";
      }

      final response = await _dio.get(
        'ndc.json',
        queryParameters: {'search': searchQuery, 'limit': limit, 'skip': skip},
      );

      final dataMap = response.data as Map<String, dynamic>?;

      if (dataMap == null || dataMap['results'] == null) {
        return ResponseModel.error("Veri bulunamadı.");
      }

      final List<dynamic> resultList = dataMap['results'];
      final drugs = resultList.map((e) => DrugModel.fromJson(e)).toList();

      return ResponseModel.success(drugs);
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

import 'package:dio/dio.dart';
import 'package:fd_admin/app/common/models/animal_pet_model.dart';
import 'package:fd_admin/core/model/response_model.dart';

class AnimalApiService {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: "https://api.fda.gov/animalandveterinary/"),
  );

  /// Belirli tarih aralığı ve opsiyonel species için kayıtları getirir
  Future<ResponseModel<AnimalPetModel>> fetchAdverseEvents({
    required DateTime startDate,
    required DateTime endDate,
    String? species,
    int limit = 10,
    int skip = 0,
    String sortOrder = 'desc',
  }) async {
    try {
      final String formattedStart = _formatDate(startDate);
      final String formattedEnd = _formatDate(endDate);

      final query = StringBuffer();
      query.write('original_receive_date:[$formattedStart TO $formattedEnd]');
      if (species != null && species.isNotEmpty) {
        query.write(' AND animal.species:"$species"');
      }
      final response = await _dio.get(
        'event.json',
        queryParameters: {
          'search': query.toString(),
          'limit': limit,
          'skip': skip,
          'sort': "original_receive_date:$sortOrder",
        },
      );

      final dataMap = response.data as Map<String, dynamic>?;

      if (dataMap == null) {
        return ResponseModel.error("Veri bulunamadı.");
      }

      final data = AnimalPetModel.fromJson(dataMap);
      return ResponseModel.success(data);
    } on DioException catch (e) {
      final dataError = e.response!.data as Map<String, dynamic>;
      final errorMap =
          (dataError["error"] as Map<String, dynamic>)["code"] as String;
      if (errorMap == "SERVER_ERROR" || errorMap == "NOT_FOUND") {
        return ResponseModel.error(
          "No data available for the selected date range or server not responding!",
        );
      }
      return ResponseModel.error("Bağlantı hatası (Dio): ${e.toString()}");
    }
  }

  /// YYYYMMDD formatında tarih döndürür
  String _formatDate(DateTime date) {
    return '${date.year.toString().padLeft(4, '0')}${date.month.toString().padLeft(2, '0')}${date.day.toString().padLeft(2, '0')}';
  }
}

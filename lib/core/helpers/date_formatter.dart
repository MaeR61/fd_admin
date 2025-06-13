import 'package:intl/intl.dart';

class MaeRFormatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MM-yyyy').format(date);
  }

  static String formatDateDMYHM(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MM-yyyy hh:mm').format(date);
  }

  static String formatDateWithSpace(String rawDate) {
    try {
      // Eğer tarih MM/dd/yyyy formatındaysa
      if (rawDate.contains('/')) {
        final inputFormat = DateFormat('MM/dd/yyyy');
        final parsedDate = inputFormat.parse(rawDate);
        return DateFormat('dd.MM.yyyy').format(parsedDate);
      }

      // Eğer tarih yyyy-MM-dd formatındaysa
      if (rawDate.contains('-')) {
        final inputFormat = DateFormat('yyyy-MM-dd');
        final parsedDate = inputFormat.parse(rawDate);
        return DateFormat('dd.MM.yyyy').format(parsedDate);
      }
      // Eğer tarih 8 karakterli ve yyyyMMdd formatındaysa
      if (rawDate.length == 8 && !rawDate.contains('/') ||
          !rawDate.contains('-')) {
        final year = int.parse(rawDate.substring(0, 4));
        final month = int.parse(rawDate.substring(4, 6));
        final day = int.parse(rawDate.substring(6, 8));
        return "${day.toString().padLeft(2, '0')}.${month.toString().padLeft(2, '0')}.$year";
      }

      // Diğer durumlarda doğrudan döndür
      return rawDate;
    } catch (e) {
      return rawDate; // Parse hatasında orijinali döndür
    }
  }
}

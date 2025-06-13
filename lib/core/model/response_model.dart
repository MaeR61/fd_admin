class ResponseModel<T> {
  final bool success;
  final String? message;
  final T? data;
  final int? statusCode;

  ResponseModel({
    required this.success,
    this.message,
    this.data,
    this.statusCode,
  });

  /// Success factory constructor
  factory ResponseModel.success(T data, {String? message, int? statusCode}) {
    return ResponseModel(
      success: true,
      message: message,
      data: data,
      statusCode: statusCode,
    );
  }

  /// Failure factory constructor
  factory ResponseModel.error(String message, {int? statusCode}) {
    return ResponseModel(
      success: false,
      message: message,
      data: null,
      statusCode: statusCode,
    );
  }
}

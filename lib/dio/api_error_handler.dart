import 'package:dio/dio.dart';
import 'package:nexever_flutter_task/data/common_response/error_response.dart';

class ApiErrorHandler {
  static ErrorResponse getErrorResponse(error) {
    ErrorResponse errorResponse =
        ErrorResponse(msg: "Something went wrong", status: 400, logout: false);

    if (error is Exception) {
      if (error is DioError) {
        errorResponse = ErrorResponse.fromJson(error.response?.data);
      }
    }

    return errorResponse;
  }

  static dynamic getMessage(error) {
    dynamic errorDescription = "";

    if (error is Exception) {
      try {
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              errorDescription = "Request to API server was cancelled";
              break;
            case DioErrorType.connectTimeout:
              errorDescription = "Connection timeout with API server";
              break;
            case DioErrorType.other:
              errorDescription =
                  "Connection to API server failed due to internet connection";
              break;
            case DioErrorType.receiveTimeout:
              errorDescription =
                  "Receive timeout in connection with API server";
              break;
            case DioErrorType.response:
              switch (error.response?.statusCode) {
                case 400:
                case 401:
                case 404:
                case 500:
                case 503:
                  errorDescription = error.response?.statusMessage;
                  break;
                default:
                  errorDescription =
                      "Failed to load data - status code: ${error.response?.statusCode}";
              }
              break;
            case DioErrorType.sendTimeout:
              errorDescription = "Send timeout with server";
              break;
          }
        } else {
          errorDescription = "Unexpected error occurred";
        }
      } on FormatException catch (e) {
        errorDescription = e.toString();
      }
    } else {
      errorDescription = "is not a subtype of exception";
    }

    return errorDescription;
  }
}

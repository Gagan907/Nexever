import 'package:nexever_flutter_task/data/common_response/success_response.dart';

import 'error_response.dart';

class ApiResponse {

   final bool isSuccess;
   final SuccessResponse? response;
   final ErrorResponse? error;

  ApiResponse(this.isSuccess, this.response, this.error);

  ApiResponse.withError(ErrorResponse errorValue) : error = errorValue, response = null, isSuccess = false;

  ApiResponse.withSuccess(SuccessResponse responseValue) : response = responseValue, error = null, isSuccess = true;
}

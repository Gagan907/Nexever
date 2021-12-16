import 'package:dio/dio.dart';
import 'package:nexever_flutter_task/data/model/task_model.dart';
import 'package:nexever_flutter_task/dio/dio_client.dart';
import 'package:nexever_flutter_task/utils/constants.dart';

class TaskRepo {
  final DioClient dioClient;
  TaskRepo(this.dioClient);

  // Future<ApiResponse> taskInfo() async {
  //   try {
  //     Response response = await dioClient.get(Constants.BASE_URL, null);
  //     return ApiResponse.withSuccess(SuccessResponse.fromJson(response.data));
  //   } on DioError catch (e) {
  //     return ApiResponse.withError(ErrorResponse.fromJson(e.response?.data));
  //   }
  // }

  Future<Task?> taskInfo( ) async {
    try {
      Response response = await dioClient.get(Constants.BASE_URL, null);

      Task resModel = Task.fromJson(response.data);

      return resModel;
    } on DioError catch (e) {
      // ignore: avoid_print
      print(e.error);
      return null;
    }
  }
  }
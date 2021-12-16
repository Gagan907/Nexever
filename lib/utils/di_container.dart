
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nexever_flutter_task/dio/dio_client.dart';
import 'package:nexever_flutter_task/dio/login_interceptor.dart';
import 'package:nexever_flutter_task/provider/task_provider.dart';
import 'package:nexever_flutter_task/repo/task_repo.dart';

final sl = GetIt.instance;

Future<void> init() async {

  // External
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());

  // Core
  sl.registerLazySingleton(() => DioClient(sl(), sl()));

  // Repository
  sl.registerLazySingleton(() => TaskRepo(sl()));

   // Provider
  sl.registerFactory(() => TaskProvider(taskRepo: sl()));
  

}
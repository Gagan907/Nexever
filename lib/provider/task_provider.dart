import 'package:nexever_flutter_task/data/model/task_model.dart';
import 'package:nexever_flutter_task/utils/custom_change_notifier.dart';
import 'package:nexever_flutter_task/repo/task_repo.dart';

class TaskProvider extends CustomChangeNotifier {
  List<Data>? apiData;
  final TaskRepo taskRepo;
  TaskProvider({required this.taskRepo});
  
  getData() async {
    loading(true);
    Task? apiResponse = await taskRepo.taskInfo();
    
    apiData = apiResponse?.data;
    loading(false);
  }
}

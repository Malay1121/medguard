import 'package:background_fetch/background_fetch.dart';
import 'package:medguard/app/helper/all_imports.dart';

@pragma('vm:entry-point')
void backgroundFetchHeadlessTask(HeadlessTask task) async {
  String taskId = task.taskId;
  bool isTimeout = task.timeout;
  if (isTimeout) {
    BackgroundFetch.finish(taskId);
    return;
  }
  BackgroundFetch.finish(taskId);
  return;
}

import 'dart:developer';

import 'package:e_learning_sma_tuna_bangsa/viewmodels/mysql_view_model.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class DownloaderViewModel {
  static Future<String?> openFile(String url, String docId) async {
    final taskId = await MySQLViewModel.taskFromDoc(docId);
    if (taskId == null) {
      return downloadFile(url, docId);
    }

    final listTasks = await FlutterDownloader.loadTasks();
    final task = listTasks?.firstWhere((element) => element.taskId == taskId);

    if (task == null) return null;
    final filePath = "${task.savedDir}/${task.filename!}";
    log(filePath);
    OpenFile.open(filePath, type: "application/pdf");

    return task.taskId;
  }

  static Future<String?> downloadFile(String url, String docId) async {
    final localPath = await getExternalStorageDirectory();

    final taskId = await FlutterDownloader.enqueue(
      url: url,
      headers: {},
      savedDir: localPath!.path,
      showNotification: true,
      openFileFromNotification: false,
    );

    if (taskId != null) MySQLViewModel.saveDownloadTask(docId, taskId);
    return taskId;
  }
}

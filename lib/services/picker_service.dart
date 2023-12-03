import 'package:file_picker/file_picker.dart';
import 'package:healthcheck/app/app.logger.dart';

class PickerService {
  final FilePicker filePicker = FilePicker.platform;
  final log = getLogger('PickerService');

  Future<FilePickerResult?> getFile() async {
    FilePickerResult? result = await filePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'png', 'jpeg'],
    );
    log.i('FilePicker Result: ${result?.paths[0]}');
    return result;
  }
}

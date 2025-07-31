import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class ShareManager {
  ShareManager();
  share(ScreenshotController controller) async {
    await controller.capture().then(
      (image) async {
        if (image != null) {
          final directory = await getApplicationDocumentsDirectory();
          final imagePath = await File('${directory.path}/image.png').create();
          await imagePath.writeAsBytes(image);
          await SharePlus.instance.share(ShareParams(files: [XFile(imagePath.path)],),);
        }
      },
    );
  }
}

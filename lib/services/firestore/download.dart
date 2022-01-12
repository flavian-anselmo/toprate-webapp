import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:url_launcher/url_launcher.dart';

class DownloadContent with ChangeNotifier {
  Future<void> downLoadPdf(String link) async {
    try {
      if (await canLaunch(link)) {
        await launch(
          link,
        );
        EasyLoading.showSuccess("Content lauched succesfully");
      } else {
        EasyLoading.showError("Error");
      }
    } catch (e) {
      EasyLoading.showError("Check internet connection");
    }
  }
}
/***
 * allow the user to download the content 
 * this will allow offline view of the content 
 * 
 * 
 * 
 * 
 */
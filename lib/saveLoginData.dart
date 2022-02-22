import 'dart:io';
import 'package:path_provider/path_provider.dart';

class saveLoginData {

  static String key = "";

  static write(String text) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    new File('${directory.path}/loginData.txt').create(recursive: true);
    final File file = File('${directory.path}/loginData.txt');
    print(directory.path);
    await file.writeAsString(text);
  }

  static Future<String> read() async {
    String text = "";
    try {
      final Directory directory = await getApplicationDocumentsDirectory();
      final File file = File('${directory.path}/loginData.txt');
      text = await file.readAsString();
    } catch (e) {
      print("Couldn't read file");
    }
    return text;
  }
}
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class ManualNotifier extends StateNotifier<String>
{
 bool error = false;
 String lastLang = "";

  ManualNotifier() : super("<h1>No data!</h1>");

  void load({required String lang, String uri="", debug=true})
  {
    if(lang != lastLang) {
      lastLang  = lang;
      String path = (uri.isNotEmpty)? "assets/manual/$lang/$uri" : "assets/manual/$lang/index.html";
      if(debug)print("about to load asset $path");
      rootBundle.loadString(path).then((value) {
        state = value;
        if(debug)print("found and changed manual page");
      }).catchError((e) {
        if(debug)print("Asseet error for manual: $e");
        state = "<h1>$path not found!!</h1>";
        lastLang = "";
      });
    }
  }

}

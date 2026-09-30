import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
/// The manual page (HTML) in the app's language, loaded from the assets.
class ManualNotifier extends Notifier<String>
{
 bool error = false;
 String lastLang = "";

  @override
  String build() => "<h1>No data!</h1>";

  void load({required String lang, String uri="", debug=true})
  {
    if(lang != lastLang) {
      lastLang  = lang;
      String path = (uri.isNotEmpty)? "assets/manual/$lang/$uri" : "assets/manual/$lang/index.html";
      if(debug)print("about to load asset $path");
      rootBundle.loadString(path).then((value) {
        if (!ref.mounted) return;
        state = value;
        if(debug)print("found and changed manual page");
      }).catchError((e) {
        if(debug)print("Asseet error for manual: $e");
        if (!ref.mounted) return;
        state = "<h1>$path not found!!</h1>";
        lastLang = "";
      });
    }
  }

}

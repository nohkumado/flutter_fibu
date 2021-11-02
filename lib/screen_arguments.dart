import 'package:nohfibu/fibusettings.dart';
import 'package:nohfibu/nohfibu.dart';

class ScreenArguments {
  final Book book;
  final FibuSettings settings;
  String extract = "";

  ScreenArguments(this.book, this.settings, {this.extract = ""});
}

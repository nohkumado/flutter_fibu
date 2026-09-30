import 'package:nohfibu/fibusettings.dart';

/// Splits the chosen book file (`key-filename`, e.g. `2024.csv`) into the
/// settings' `base` and `type` (csv when there is no extension). Nothing
/// happens before a book was chosen.
void analyseFname(FibuSettings settings) {
  final String? result = settings["key-filename"];
  if (result == null || result.isEmpty) return;
  final pos = result.lastIndexOf(".");
  if (pos > 0) {
    settings["base"] = result.substring(0, pos);
    settings["type"] = result.substring(pos + 1).trim();
  } else {
    settings["base"] = result;
    settings["type"] = "csv";
  }
}

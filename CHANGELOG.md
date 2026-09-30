# Changelog

## Unreleased

- Stored operations ("Schnellbuchungen" in the drawer): choose an op of the
  open book, answer its questions as a form (date, account dropdowns for
  ranges, amounts, texts), the journal lines previewed live (or what is
  still wrong), "Book" adds them — nohfibu's `Operation.questions()` /
  `fill()`. The unused dialog scaffold (fastoperation.dart) is gone.
- intl_utils as dev dependency: `dart run intl_utils:generate` rebuilds
  lib/generated from the .arb files.
- Builds again: Linux, web and Android regenerated from the current Flutter
  template (android/ had been deleted, linux/ held only generated files, web/
  was missing) and versioned; app id `eu.nohkumado.flutter_fibu` (was
  com.example); Android at the fleet baseline (Gradle 9.3.1, AGP 9.1.0,
  Kotlin 2.4.0, built-in Kotlin, SDK 37).
- Dependencies at their latest majors: nohfibu 0.1.0 over git (was a path
  dependency), flutter_riverpod 3 (the four StateNotifiers are Notifiers;
  the book notifies with `ref.notifyListeners()` instead of swapping in an
  empty Book), file_picker 13 (`FilePicker.pickFile`), settings_ui 4.
  flutter_html (unmaintained, no longer compiles) replaced by
  flutter_widget_from_html_core for the manual.
- First start without a book no longer crashes (`analyseFname`, now one
  function in book_file_name.dart instead of two copies); load and save
  wait until a book is chosen.
- The picked book file is stored in the settings before it is loaded (it
  was computed and dropped, so the old file was loaded again).
- Settings changes create a new FibuSettings (copyWith), so the screens
  update.
- Widget test: the template's counter test replaced by a real smoke test.
- .idea/ and .flutter-plugins-dependencies no longer tracked.

import 'package:flutter/material.dart';
import 'package:nohfibu/ops_handler.dart';

class GUIInteraction implements UserInteraction {
  BuildContext context;

  GUIInteraction(this.context);

  @override
  Future<String> promptForAccountSelection(String message, List<String> options) async {
    // Use a dropdown or list dialog in GUI
    return showAccountSelectionDialog(message, options); // Hypothetical method
  }

  @override
  Future<String> promptForTextInput(String message, {String defaultValue = ""}) async {
    // Show a text input dialog in GUI
    return showTextInputDialog(message, defaultValue: defaultValue); // Hypothetical method
  }

  @override
  Future<int> promptForValueInput(String message, {int defaultValue = 0}) async {
    // Show a number input dialog in GUI
    return showValueInputDialog(message, defaultValue: defaultValue); // Hypothetical method
  }


  /// Show a selection dialog for account options
  Future<String> showAccountSelectionDialog(String message, List<String> options) async {
    return await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(message),
          content: SingleChildScrollView(
            child: ListBody(
              children: options
                  .map((option) => RadioListTile<String>(
                        title: Text(option),
                        value: option,
                        groupValue: null,
                        onChanged: (value) {
                          Navigator.of(context).pop(value);
                        },
                      ))
                  .toList(),
            ),
          ),
        );
      },
    ) ?? options.first; // Default to first option if none is selected
  }
  /// Show a text input dialog for general input
  Future<String> showTextInputDialog(String message, {required String defaultValue}) async {
    TextEditingController controller = TextEditingController(text: defaultValue);
    return await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(message),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: "Enter value"),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(controller.text);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    ) ?? defaultValue; // Return the default value if canceled
  }

  /// Show a value input dialog for numeric values
  Future<int> showValueInputDialog(String message, {required int defaultValue}) async {
    TextEditingController controller = TextEditingController(text: defaultValue.toString());
    return await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(message),
          content: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: "Enter number"),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(int.tryParse(controller.text) ?? defaultValue);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    ) ?? defaultValue; // Return the default value if canceled or invalid input
  }
}

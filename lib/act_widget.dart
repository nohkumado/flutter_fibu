import 'package:flutter/material.dart';

import 'screen_arguments.dart';

class ActWidget
{
  final String name;
  final Widget icon;

  final Widget  body;

  final ScreenArguments? args;

  const ActWidget({this.name="none", this.icon = const Icon(Icons.error), required this.body, this.args = null});

  ActWidget copyWith({ScreenArguments? args})
  {
    if(args != null) {
      return ActWidget(name: name, icon: icon, body: body, args: args );
    }
    return ActWidget(name: name, icon: icon, body: body);
  }

  @override
  String toString() {
    return 'AW{$name, a: ${args?.extract}';
  }
}

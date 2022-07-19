import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fibu/screen_arguments.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'act_widget.dart';


class NavNotifier extends StateNotifier<ActWidget>
{
  Map<String, ActWidget> pages = {};
  List<ActWidget> history = [];

  NavNotifier({ActWidget? active}) : super(active ?? ActWidget(name:"none",body: Text("empty")));

  void chgPage(String name, {ScreenArguments? args}) {
    if(pages.containsKey(name)) {
      history.add(state); //add the page we are leaving....
      state = pages[name]!;
    }
    if(args != null) state = state.copyWith(args: args );
    else state = state.copyWith();
  }

  void popPage()
  {
    if(history.isNotEmpty) state = history.removeLast();
  }

}

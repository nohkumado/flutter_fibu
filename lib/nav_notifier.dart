import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class NavNotifier extends StateNotifier<ActWidget>
{
  NavNotifier({ActWidget? active}) : super(active ?? ActWidget(name:"none",body: Text("empty")));

}
class ActWidget
{
  final String name;
  final Widget icon;

  final Widget  body;

  const ActWidget({this.name="none", this.icon = const Icon(Icons.error), required this.body});


}

import 'package:flutter/material.dart';

import 'package:flutter_fibu/manual_browser.dart';
import 'package:flutter_fibu/rp_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'act_widget.dart';
import 'navdrawer.dart';
import 'generated/l10n.dart';
import 'package:flutter_fibu/fibupreferences.dart';

import 'bilanz_icon.dart';
import 'jrl_icon.dart';
import 'jrl_page.dart';
import 'kpl_page.dart';
import 'setup_page.dart';

///HomePage = entry page atm only a disply and selection of the dataset to be used
class MyHomePage extends ConsumerWidget {
	static const String routeName = "/home";

	MyHomePage({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context, WidgetRef ref) {
		//String fname = "argh";
		//Book book = ref.watch(bookProvider);
		//FibuSettings settings =  ref.watch(settingsProvider);

		//String fname= settings["key-filename"];

		ActWidget actPage = ref.watch(navProvider);

		Map<String,ActWidget> pages  =
		{
			"start" : ActWidget(name:S.of(context).Start, icon:Icon(Icons.input), body: SetupPage()),
			"kplview" : ActWidget(name:S.of(context).kpl, icon:Icon(Icons.account_balance), body: KplPage()),
			"jrlview" : ActWidget(name:S.of(context).jrl, icon:JrlIcon(width: 30).draw(), body: JrlPage()),
			"bilaview" : ActWidget(name:S.of(context).bilanz, icon:BilanzIcon(width: 30).draw(), body: KplPage()),
			"helpview" : ActWidget(name:S.of(context).bilanz, icon:Icon(Icons.help_outline), body: ManualBrowser()),
			"settingsview" : ActWidget(name:S.of(context).settings, icon: Icon(Icons.settings), body: FibuPreferences()),
		};
		if(ref.read(navProvider.notifier).pages.isEmpty) {
		  ref.read(navProvider.notifier).pages.addAll(pages);
		}
		else
			{

			}

		return
			Scaffold(
					drawer: NavDrawer(pages:pages),
					appBar: AppBar(
						title:
						Row(
							children:
							[
								Text(S.of(context).AppTitle),
								if(ref.read(navProvider.notifier).history.isNotEmpty)
								IconButton(
									icon: Icon(Icons.arrow_back_ios_new),
									onPressed: ()
									{
										ref.read(navProvider.notifier).popPage();
									},
								),
							],
						)
						// automaticallyImplyLeading: true,
						// leading: IconButton(
						// 	icon: Icon(Icons.arrow_back),
						// 	onPressed: ()
						// 	{
						// 	print("pressed back button");
						),
					//),
					body:
					(actPage.name == "none" && pages.containsKey("start"))? pages["start"]!.body: actPage.body

			);
	}
}

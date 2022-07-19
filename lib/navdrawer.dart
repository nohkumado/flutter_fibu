import 'package:flutter/material.dart';
import 'package:flutter_fibu/bilanz_icon.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:nohfibu/fibusettings.dart';
import 'package:nohfibu/nohfibu.dart';
import 'act_widget.dart';
import 'jrl_icon.dart';
import 'generated/l10n.dart';
import 'nav_notifier.dart';
import 'rp_provider.dart';

class NavDrawer extends ConsumerWidget {
	late final Book book;
	late final FibuSettings settings;

	Map<String,ActWidget> pages;

	NavDrawer({Key? key,  required this.pages}) : super(key: key);

	@override
	Widget build(BuildContext context,WidgetRef ref) {
		FibuSettings settings = ref.watch(settingsProvider);
		ActWidget actPage = ref.watch(navProvider);
		Book book = ref.watch(bookProvider);
		return Drawer(
			child: ListView(
				padding: EdgeInsets.zero,
				children: <Widget>[
					DrawerHeader(
						child: Text(
							S.of(context).NavTitle,
							style: TextStyle(color: Colors.white, fontSize: 25),
						),
						decoration: BoxDecoration(
								color: Colors.green,
								image: DecorationImage(
										fit: BoxFit.fill,
										image: AssetImage('assets/images/accountancy.jpg'))),
					),
					ListTile(
							leading: pages["start"]?.icon,//Icon(Icons.input),
							title: Text(pages["start"]?.name??"none"),
							//onTap: () => {Navigator.of(context).pop()},
							onTap: () {
								ref.read(navProvider.notifier).chgPage("start");
								 Navigator.pop(context);
							}
					),
					ListTile(
						leading: Icon(Icons.account_balance),
						title: Text(S.of(context).kpl),
						onTap: () {
							ref.read(navProvider.notifier).chgPage("kplview");
							Navigator.pop(context);
						},
					),
					ListTile(
							leading: //Icon(Icons.account_balance),
							JrlIcon(width: 30).draw(),
							title: Text(S.of(context).jrl),
							onTap: () {
								ref.read(navProvider.notifier).chgPage("jrlview");
								Navigator.pop(context);
							}
					),
					ListTile(
							leading: //Icon(Icons.account_balance),
							BilanzIcon(width: 30).draw(),
							title: Text(S.of(context).bilanz),
							onTap: ()  {
								ref.read(navProvider.notifier).chgPage("bilaview");
								Navigator.pop(context);
							}

					),
					ListTile(
							leading: //Icon(Icons.account_balance),
							Icon(Icons.help_outline),
							title: Text(S.of(context).manual),
							onTap: () {
								ref.read(manualProvider.notifier).load(lang: Localizations.localeOf(context).languageCode);
								ref.read(navProvider.notifier).chgPage("helpview");
								Navigator.pop(context);
							}

					),
					ListTile(
						leading: Icon(Icons.settings),
						title: Text('Settings'),
						onTap: () {
							ref.read(navProvider.notifier).chgPage("settingsview");
							Navigator.pop(context);
						},
					),
//					ListTile(
//						leading: Icon(Icons.exit_to_app),
//						title: Text('Logout'),
//						onTap: () => {Navigator.of(context).pop()},
//					),
				],
			),
		);
	}
}

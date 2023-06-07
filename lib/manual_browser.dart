import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_fibu/rp_provider.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ManualBrowser extends ConsumerWidget
{
  @override
  Widget build(BuildContext context, WidgetRef ref)
  {
    String data = ref.watch(manualProvider);
    //Book book = ref.watch(bookProvider);
    Locale myLocale = Localizations.localeOf(context);
    print("act Locale = $myLocale with ${myLocale.languageCode}");
    return
      Center(
          child:
            SingleChildScrollView(
              child: Html(data: data,

        //onLinkTap:(url, context, attributes,  element) {
      onLinkTap:(url,attributes, element) {
                  //url, RenderContext context, Map<String, String> attributes,  Element? element) {
                  //open URL in webview, or launch URL in browser, or anddy other logic here
                  print("got a tap on $element with  $url and att: $attributes");
                  ref.read(manualProvider.notifier).load(lang: Localizations.localeOf(context).languageCode,uri: url.toString());
      } ,),
            )

      );
  }

}
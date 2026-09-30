import 'package:flutter/material.dart';
import 'package:flutter_fibu/rp_provider.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
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
              child: HtmlWidget(data,
                // links between the manual's pages load the next page
                onTapUrl: (url) {
                  ref.read(manualProvider.notifier).load(
                      lang: Localizations.localeOf(context).languageCode,
                      uri: url);
                  return true;
                },
              ),
            )

      );
  }

}
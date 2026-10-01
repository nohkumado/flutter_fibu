import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nohfibu/fibusettings.dart';
import 'package:nohfibu/nohfibu.dart';

import 'act_widget.dart';
import 'invoicing/invoice_notifier.dart';
import 'invoicing/invoice_state.dart';
import 'book_notifier.dart';
import 'manual_provider.dart';
import 'nav_notifier.dart';
import 'settings_provider.dart';

final settingsProvider =
    NotifierProvider<SettingsNotifier, FibuSettings>(SettingsNotifier.new);
final bookProvider = NotifierProvider<BookNotifier, Book>(BookNotifier.new);
final navProvider = NotifierProvider<NavNotifier, ActWidget>(NavNotifier.new);
final manualProvider =
    NotifierProvider<ManualNotifier, String>(ManualNotifier.new);
final invoiceProvider =
    NotifierProvider<InvoiceNotifier, InvoiceState>(InvoiceNotifier.new);

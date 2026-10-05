// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Noh Financial bookeeping`
  String get AppTitle {
    return Intl.message(
      'Noh Financial bookeeping',
      name: 'AppTitle',
      desc: '',
      args: [],
    );
  }

  /// `Side Menu`
  String get NavTitle {
    return Intl.message('Side Menu', name: 'NavTitle', desc: '', args: []);
  }

  /// `Welcome`
  String get Start {
    return Intl.message('Welcome', name: 'Start', desc: '', args: []);
  }

  /// `account plan`
  String get kpl {
    return Intl.message('account plan', name: 'kpl', desc: '', args: []);
  }

  /// `Journal`
  String get jrl {
    return Intl.message('Journal', name: 'jrl', desc: '', args: []);
  }

  /// `Balance`
  String get bilanz {
    return Intl.message('Balance', name: 'bilanz', desc: '', args: []);
  }

  /// `Account Plan`
  String get KplTitle {
    return Intl.message('Account Plan', name: 'KplTitle', desc: '', args: []);
  }

  /// `Journal`
  String get JrlTitle {
    return Intl.message('Journal', name: 'JrlTitle', desc: '', args: []);
  }

  /// `save`
  String get save {
    return Intl.message('save', name: 'save', desc: '', args: []);
  }

  /// `Extract for {konto}`
  String extract(Object konto) {
    return Intl.message(
      'Extract for $konto',
      name: 'extract',
      desc: '',
      args: [konto],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `load`
  String get loadFile {
    return Intl.message('load', name: 'loadFile', desc: '', args: []);
  }

  /// `load`
  String get loadDefault {
    return Intl.message('load', name: 'loadDefault', desc: '', args: []);
  }

  /// `manual`
  String get manual {
    return Intl.message('manual', name: 'manual', desc: '', args: []);
  }

  /// `Stored operations`
  String get fastops {
    return Intl.message(
      'Stored operations',
      name: 'fastops',
      desc: '',
      args: [],
    );
  }

  /// `Book`
  String get bookIt {
    return Intl.message('Book', name: 'bookIt', desc: '', args: []);
  }

  /// `This book has no stored operations.`
  String get noOps {
    return Intl.message(
      'This book has no stored operations.',
      name: 'noOps',
      desc: '',
      args: [],
    );
  }

  /// `Choose an operation`
  String get chooseOp {
    return Intl.message(
      'Choose an operation',
      name: 'chooseOp',
      desc: '',
      args: [],
    );
  }

  /// `{count} lines booked`
  String booked(Object count) {
    return Intl.message(
      '$count lines booked',
      name: 'booked',
      desc: '',
      args: [count],
    );
  }

  /// `Preview`
  String get preview {
    return Intl.message('Preview', name: 'preview', desc: '', args: []);
  }

  /// `Offers & invoices`
  String get invoicing {
    return Intl.message(
      'Offers & invoices',
      name: 'invoicing',
      desc: '',
      args: [],
    );
  }

  /// `Offers`
  String get offers {
    return Intl.message('Offers', name: 'offers', desc: '', args: []);
  }

  /// `Invoices`
  String get invoices {
    return Intl.message('Invoices', name: 'invoices', desc: '', args: []);
  }

  /// `New offer`
  String get newOffer {
    return Intl.message('New offer', name: 'newOffer', desc: '', args: []);
  }

  /// `New invoice`
  String get newInvoice {
    return Intl.message('New invoice', name: 'newInvoice', desc: '', args: []);
  }

  /// `Letterheads`
  String get letterheads {
    return Intl.message('Letterheads', name: 'letterheads', desc: '', args: []);
  }

  /// `Customers`
  String get customers {
    return Intl.message('Customers', name: 'customers', desc: '', args: []);
  }

  /// `Letterhead`
  String get letterhead {
    return Intl.message('Letterhead', name: 'letterhead', desc: '', args: []);
  }

  /// `Customer`
  String get customer {
    return Intl.message('Customer', name: 'customer', desc: '', args: []);
  }

  /// `Category (e.g. 3dprint, cours)`
  String get category {
    return Intl.message(
      'Category (e.g. 3dprint, cours)',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Subject`
  String get subject {
    return Intl.message('Subject', name: 'subject', desc: '', args: []);
  }

  /// `Date of service`
  String get serviceDate {
    return Intl.message(
      'Date of service',
      name: 'serviceDate',
      desc: '',
      args: [],
    );
  }

  /// `Valid for (days)`
  String get validDays {
    return Intl.message(
      'Valid for (days)',
      name: 'validDays',
      desc: '',
      args: [],
    );
  }

  /// `Payable within (days)`
  String get payDays {
    return Intl.message(
      'Payable within (days)',
      name: 'payDays',
      desc: '',
      args: [],
    );
  }

  /// `Items`
  String get items {
    return Intl.message('Items', name: 'items', desc: '', args: []);
  }

  /// `Add item`
  String get addItem {
    return Intl.message('Add item', name: 'addItem', desc: '', args: []);
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `Quantity`
  String get quantity {
    return Intl.message('Quantity', name: 'quantity', desc: '', args: []);
  }

  /// `Unit price (net)`
  String get unitPrice {
    return Intl.message(
      'Unit price (net)',
      name: 'unitPrice',
      desc: '',
      args: [],
    );
  }

  /// `Net`
  String get net {
    return Intl.message('Net', name: 'net', desc: '', args: []);
  }

  /// `VAT`
  String get vat {
    return Intl.message('VAT', name: 'vat', desc: '', args: []);
  }

  /// `Total`
  String get gross {
    return Intl.message('Total', name: 'gross', desc: '', args: []);
  }

  /// `Save draft`
  String get saveDraft {
    return Intl.message('Save draft', name: 'saveDraft', desc: '', args: []);
  }

  /// `Issue`
  String get issue {
    return Intl.message('Issue', name: 'issue', desc: '', args: []);
  }

  /// `Accepted`
  String get accept {
    return Intl.message('Accepted', name: 'accept', desc: '', args: []);
  }

  /// `Declined`
  String get refuse {
    return Intl.message('Declined', name: 'refuse', desc: '', args: []);
  }

  /// `Make the invoice`
  String get makeInvoice {
    return Intl.message(
      'Make the invoice',
      name: 'makeInvoice',
      desc: '',
      args: [],
    );
  }

  /// `Payment received`
  String get pay {
    return Intl.message('Payment received', name: 'pay', desc: '', args: []);
  }

  /// `Amount`
  String get amount {
    return Intl.message('Amount', name: 'amount', desc: '', args: []);
  }

  /// `Write reminder {level}`
  String remind(Object level) {
    return Intl.message(
      'Write reminder $level',
      name: 'remind',
      desc: '',
      args: [level],
    );
  }

  /// `{count} reminders due`
  String remindersDue(Object count) {
    return Intl.message(
      '$count reminders due',
      name: 'remindersDue',
      desc: '',
      args: [count],
    );
  }

  /// `PDF`
  String get pdf {
    return Intl.message('PDF', name: 'pdf', desc: '', args: []);
  }

  /// `History`
  String get history {
    return Intl.message('History', name: 'history', desc: '', args: []);
  }

  /// `Delete draft`
  String get deleteDraft {
    return Intl.message(
      'Delete draft',
      name: 'deleteDraft',
      desc: '',
      args: [],
    );
  }

  /// `No offers or invoices yet.`
  String get noDocuments {
    return Intl.message(
      'No offers or invoices yet.',
      name: 'noDocuments',
      desc: '',
      args: [],
    );
  }

  /// `Set up a letterhead first (settings).`
  String get noLetterhead {
    return Intl.message(
      'Set up a letterhead first (settings).',
      name: 'noLetterhead',
      desc: '',
      args: [],
    );
  }

  /// `Add a customer first.`
  String get noCustomer {
    return Intl.message(
      'Add a customer first.',
      name: 'noCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Booked in the open book: {count} lines`
  String booked2(Object count) {
    return Intl.message(
      'Booked in the open book: $count lines',
      name: 'booked2',
      desc: '',
      args: [count],
    );
  }

  /// `Not booked: the open book lacks the letterhead's accounts`
  String get notBooked {
    return Intl.message(
      'Not booked: the open book lacks the letterhead\'s accounts',
      name: 'notBooked',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Short id`
  String get shortId {
    return Intl.message('Short id', name: 'shortId', desc: '', args: []);
  }

  /// `Address (one line per line)`
  String get address {
    return Intl.message(
      'Address (one line per line)',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Country (FR, DE…)`
  String get country {
    return Intl.message(
      'Country (FR, DE…)',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `Business (not a private person)`
  String get business {
    return Intl.message(
      'Business (not a private person)',
      name: 'business',
      desc: '',
      args: [],
    );
  }

  /// `VAT id`
  String get vatId {
    return Intl.message('VAT id', name: 'vatId', desc: '', args: []);
  }

  /// `Language of the letters`
  String get language {
    return Intl.message(
      'Language of the letters',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message('Phone', name: 'phone', desc: '', args: []);
  }

  /// `E-mail`
  String get email {
    return Intl.message('E-mail', name: 'email', desc: '', args: []);
  }

  /// `SIRET`
  String get siret {
    return Intl.message('SIRET', name: 'siret', desc: '', args: []);
  }

  /// `Tax number (DE)`
  String get taxNumber {
    return Intl.message(
      'Tax number (DE)',
      name: 'taxNumber',
      desc: '',
      args: [],
    );
  }

  /// `Tax regime`
  String get regime {
    return Intl.message('Tax regime', name: 'regime', desc: '', args: []);
  }

  /// `No VAT (franchise, art. 293 B)`
  String get franchise {
    return Intl.message(
      'No VAT (franchise, art. 293 B)',
      name: 'franchise',
      desc: '',
      args: [],
    );
  }

  /// `Charges VAT`
  String get vatRegime {
    return Intl.message('Charges VAT', name: 'vatRegime', desc: '', args: []);
  }

  /// `Standard rate (%)`
  String get rate {
    return Intl.message('Standard rate (%)', name: 'rate', desc: '', args: []);
  }

  /// `Rates by category (cours=10, …)`
  String get rates {
    return Intl.message(
      'Rates by category (cours=10, …)',
      name: 'rates',
      desc: '',
      args: [],
    );
  }

  /// `Reverse charge for (categories)`
  String get reverseCharge {
    return Intl.message(
      'Reverse charge for (categories)',
      name: 'reverseCharge',
      desc: '',
      args: [],
    );
  }

  /// `Own franchise note (optional)`
  String get vatNote {
    return Intl.message(
      'Own franchise note (optional)',
      name: 'vatNote',
      desc: '',
      args: [],
    );
  }

  /// `Bank`
  String get bank {
    return Intl.message('Bank', name: 'bank', desc: '', args: []);
  }

  /// `Footer`
  String get footer {
    return Intl.message('Footer', name: 'footer', desc: '', args: []);
  }

  /// `Reminders after (days: 15, 30, 45)`
  String get reminderDays {
    return Intl.message(
      'Reminders after (days: 15, 30, 45)',
      name: 'reminderDays',
      desc: '',
      args: [],
    );
  }

  /// `Late interest per year (%)`
  String get penaltyRate {
    return Intl.message(
      'Late interest per year (%)',
      name: 'penaltyRate',
      desc: '',
      args: [],
    );
  }

  /// `Recovery fee (businesses)`
  String get recoveryFee {
    return Intl.message(
      'Recovery fee (businesses)',
      name: 'recoveryFee',
      desc: '',
      args: [],
    );
  }

  /// `Booking (account numbers; empty: no booking)`
  String get booking {
    return Intl.message(
      'Booking (account numbers; empty: no booking)',
      name: 'booking',
      desc: '',
      args: [],
    );
  }

  /// `Receivable`
  String get receivable {
    return Intl.message('Receivable', name: 'receivable', desc: '', args: []);
  }

  /// `Revenue`
  String get revenue {
    return Intl.message('Revenue', name: 'revenue', desc: '', args: []);
  }

  /// `VAT collected`
  String get vatAccount {
    return Intl.message(
      'VAT collected',
      name: 'vatAccount',
      desc: '',
      args: [],
    );
  }

  /// `Bank (payments)`
  String get bankAccount {
    return Intl.message(
      'Bank (payments)',
      name: 'bankAccount',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get required {
    return Intl.message('Required', name: 'required', desc: '', args: []);
  }

  /// `This id exists already`
  String get idTaken {
    return Intl.message(
      'This id exists already',
      name: 'idTaken',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `draft`
  String get status_draft {
    return Intl.message('draft', name: 'status_draft', desc: '', args: []);
  }

  /// `open`
  String get status_open {
    return Intl.message('open', name: 'status_open', desc: '', args: []);
  }

  /// `accepted`
  String get status_accepted {
    return Intl.message(
      'accepted',
      name: 'status_accepted',
      desc: '',
      args: [],
    );
  }

  /// `declined`
  String get status_refused {
    return Intl.message('declined', name: 'status_refused', desc: '', args: []);
  }

  /// `invoiced`
  String get status_invoiced {
    return Intl.message(
      'invoiced',
      name: 'status_invoiced',
      desc: '',
      args: [],
    );
  }

  /// `unpaid`
  String get status_unpaid {
    return Intl.message('unpaid', name: 'status_unpaid', desc: '', args: []);
  }

  /// `overdue`
  String get status_overdue {
    return Intl.message('overdue', name: 'status_overdue', desc: '', args: []);
  }

  /// `paid`
  String get status_paid {
    return Intl.message('paid', name: 'status_paid', desc: '', args: []);
  }

  /// `cancelled`
  String get status_cancelled {
    return Intl.message(
      'cancelled',
      name: 'status_cancelled',
      desc: '',
      args: [],
    );
  }

  /// `Reminders`
  String get reminders {
    return Intl.message('Reminders', name: 'reminders', desc: '', args: []);
  }

  /// `Books & devices`
  String get ledgerTitle {
    return Intl.message(
      'Books & devices',
      name: 'ledgerTitle',
      desc: '',
      args: [],
    );
  }

  /// `This book is kept as plain files on this device. Start a history to sync it with your other devices (encrypted).`
  String get noHistory {
    return Intl.message(
      'This book is kept as plain files on this device. Start a history to sync it with your other devices (encrypted).',
      name: 'noHistory',
      desc: '',
      args: [],
    );
  }

  /// `Start a history from the open book`
  String get startHistory {
    return Intl.message(
      'Start a history from the open book',
      name: 'startHistory',
      desc: '',
      args: [],
    );
  }

  /// `Name of the book (e.g. compta2026)`
  String get bookName {
    return Intl.message(
      'Name of the book (e.g. compta2026)',
      name: 'bookName',
      desc: '',
      args: [],
    );
  }

  /// `Scan the desktop's code`
  String get scanHub {
    return Intl.message(
      'Scan the desktop\'s code',
      name: 'scanHub',
      desc: '',
      args: [],
    );
  }

  /// `…or paste the invitation`
  String get pasteInvitation {
    return Intl.message(
      '…or paste the invitation',
      name: 'pasteInvitation',
      desc: '',
      args: [],
    );
  }

  /// `Sync now`
  String get syncNow {
    return Intl.message('Sync now', name: 'syncNow', desc: '', args: []);
  }

  /// `Synced: {received} in, {sent} out`
  String synced(Object received, Object sent) {
    return Intl.message(
      'Synced: $received in, $sent out',
      name: 'synced',
      desc: '',
      args: [received, sent],
    );
  }

  /// `Be the hub (show the code for the other devices)`
  String get beHub {
    return Intl.message(
      'Be the hub (show the code for the other devices)',
      name: 'beHub',
      desc: '',
      args: [],
    );
  }

  /// `Waiting for devices. This code holds the book's key: show it only to your own devices and your co-workers'.`
  String get hubRunning {
    return Intl.message(
      'Waiting for devices. This code holds the book\'s key: show it only to your own devices and your co-workers\'.',
      name: 'hubRunning',
      desc: '',
      args: [],
    );
  }

  /// `Stop`
  String get stopHub {
    return Intl.message('Stop', name: 'stopHub', desc: '', args: []);
  }

  /// `This device: {device} · invoice series: {series}`
  String deviceInfo(Object device, Object series) {
    return Intl.message(
      'This device: $device · invoice series: $series',
      name: 'deviceInfo',
      desc: '',
      args: [device, series],
    );
  }

  /// `{count} changes · {conflicts} conflicts`
  String changesInfo(Object count, Object conflicts) {
    return Intl.message(
      '$count changes · $conflicts conflicts',
      name: 'changesInfo',
      desc: '',
      args: [count, conflicts],
    );
  }

  /// `Changed at the same time on two devices`
  String get conflictsTitle {
    return Intl.message(
      'Changed at the same time on two devices',
      name: 'conflictsTitle',
      desc: '',
      args: [],
    );
  }

  /// `kept: {kept} — replaced: {replaced}`
  String replacedBy(Object kept, Object replaced) {
    return Intl.message(
      'kept: $kept — replaced: $replaced',
      name: 'replacedBy',
      desc: '',
      args: [kept, replaced],
    );
  }

  /// `Back up (passphrase)`
  String get backup {
    return Intl.message(
      'Back up (passphrase)',
      name: 'backup',
      desc: '',
      args: [],
    );
  }

  /// `Restore a backup`
  String get restoreBackup {
    return Intl.message(
      'Restore a backup',
      name: 'restoreBackup',
      desc: '',
      args: [],
    );
  }

  /// `Passphrase`
  String get passphrase {
    return Intl.message('Passphrase', name: 'passphrase', desc: '', args: []);
  }

  /// `Passphrase again`
  String get passphraseAgain {
    return Intl.message(
      'Passphrase again',
      name: 'passphraseAgain',
      desc: '',
      args: [],
    );
  }

  /// `The passphrases differ`
  String get passphrasesDiffer {
    return Intl.message(
      'The passphrases differ',
      name: 'passphrasesDiffer',
      desc: '',
      args: [],
    );
  }

  /// `Backup saved`
  String get backupSaved {
    return Intl.message(
      'Backup saved',
      name: 'backupSaved',
      desc: '',
      args: [],
    );
  }

  /// `{count} changes restored`
  String restored(Object count) {
    return Intl.message(
      '$count changes restored',
      name: 'restored',
      desc: '',
      args: [count],
    );
  }

  /// `Keep the key in the password manager`
  String get keyToManager {
    return Intl.message(
      'Keep the key in the password manager',
      name: 'keyToManager',
      desc: '',
      args: [],
    );
  }

  /// `Enter the key`
  String get keyEnter {
    return Intl.message('Enter the key', name: 'keyEnter', desc: '', args: []);
  }

  /// `Save with your password manager (Bitwarden asks). Without the key, or a backup and its passphrase, the book cannot be read — by design.`
  String get keyHint {
    return Intl.message(
      'Save with your password manager (Bitwarden asks). Without the key, or a backup and its passphrase, the book cannot be read — by design.',
      name: 'keyHint',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get keySave {
    return Intl.message('Save', name: 'keySave', desc: '', args: []);
  }

  /// `Back to plain files`
  String get closeHistory {
    return Intl.message(
      'Back to plain files',
      name: 'closeHistory',
      desc: '',
      args: [],
    );
  }

  /// `Working…`
  String get working {
    return Intl.message('Working…', name: 'working', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

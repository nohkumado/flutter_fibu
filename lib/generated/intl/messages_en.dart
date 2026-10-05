// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(count) => "${count} lines booked";

  static String m1(count) => "Booked in the open book: ${count} lines";

  static String m2(count, conflicts) =>
      "${count} changes · ${conflicts} conflicts";

  static String m3(device, series) =>
      "This device: ${device} · invoice series: ${series}";

  static String m4(konto) => "Extract for ${konto}";

  static String m5(level) => "Write reminder ${level}";

  static String m6(count) => "${count} reminders due";

  static String m7(kept, replaced) => "kept: ${kept} — replaced: ${replaced}";

  static String m8(count) => "${count} changes restored";

  static String m9(received, sent) => "Synced: ${received} in, ${sent} out";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "AppTitle": MessageLookupByLibrary.simpleMessage(
      "Noh Financial bookeeping",
    ),
    "JrlTitle": MessageLookupByLibrary.simpleMessage("Journal"),
    "KplTitle": MessageLookupByLibrary.simpleMessage("Account Plan"),
    "NavTitle": MessageLookupByLibrary.simpleMessage("Side Menu"),
    "Start": MessageLookupByLibrary.simpleMessage("Welcome"),
    "accept": MessageLookupByLibrary.simpleMessage("Accepted"),
    "addItem": MessageLookupByLibrary.simpleMessage("Add item"),
    "address": MessageLookupByLibrary.simpleMessage(
      "Address (one line per line)",
    ),
    "amount": MessageLookupByLibrary.simpleMessage("Amount"),
    "backup": MessageLookupByLibrary.simpleMessage("Back up (passphrase)"),
    "backupSaved": MessageLookupByLibrary.simpleMessage("Backup saved"),
    "bank": MessageLookupByLibrary.simpleMessage("Bank"),
    "bankAccount": MessageLookupByLibrary.simpleMessage("Bank (payments)"),
    "beHub": MessageLookupByLibrary.simpleMessage(
      "Be the hub (show the code for the other devices)",
    ),
    "bilanz": MessageLookupByLibrary.simpleMessage("Balance"),
    "bookIt": MessageLookupByLibrary.simpleMessage("Book"),
    "bookName": MessageLookupByLibrary.simpleMessage(
      "Name of the book (e.g. compta2026)",
    ),
    "booked": m0,
    "booked2": m1,
    "booking": MessageLookupByLibrary.simpleMessage(
      "Booking (account numbers; empty: no booking)",
    ),
    "business": MessageLookupByLibrary.simpleMessage(
      "Business (not a private person)",
    ),
    "category": MessageLookupByLibrary.simpleMessage(
      "Category (e.g. 3dprint, cours)",
    ),
    "changesInfo": m2,
    "chooseOp": MessageLookupByLibrary.simpleMessage("Choose an operation"),
    "closeHistory": MessageLookupByLibrary.simpleMessage("Back to plain files"),
    "conflictsTitle": MessageLookupByLibrary.simpleMessage(
      "Changed at the same time on two devices",
    ),
    "country": MessageLookupByLibrary.simpleMessage("Country (FR, DE…)"),
    "customer": MessageLookupByLibrary.simpleMessage("Customer"),
    "customers": MessageLookupByLibrary.simpleMessage("Customers"),
    "delete": MessageLookupByLibrary.simpleMessage("Delete"),
    "deleteDraft": MessageLookupByLibrary.simpleMessage("Delete draft"),
    "description": MessageLookupByLibrary.simpleMessage("Description"),
    "deviceInfo": m3,
    "email": MessageLookupByLibrary.simpleMessage("E-mail"),
    "extract": m4,
    "fastops": MessageLookupByLibrary.simpleMessage("Stored operations"),
    "footer": MessageLookupByLibrary.simpleMessage("Footer"),
    "franchise": MessageLookupByLibrary.simpleMessage(
      "No VAT (franchise, art. 293 B)",
    ),
    "gross": MessageLookupByLibrary.simpleMessage("Total"),
    "history": MessageLookupByLibrary.simpleMessage("History"),
    "hubRunning": MessageLookupByLibrary.simpleMessage(
      "Waiting for devices. This code holds the book\'s key: show it only to your own devices and your co-workers\'.",
    ),
    "idTaken": MessageLookupByLibrary.simpleMessage("This id exists already"),
    "invoices": MessageLookupByLibrary.simpleMessage("Invoices"),
    "invoicing": MessageLookupByLibrary.simpleMessage("Offers & invoices"),
    "issue": MessageLookupByLibrary.simpleMessage("Issue"),
    "items": MessageLookupByLibrary.simpleMessage("Items"),
    "jrl": MessageLookupByLibrary.simpleMessage("Journal"),
    "keyEnter": MessageLookupByLibrary.simpleMessage("Enter the key"),
    "keyHint": MessageLookupByLibrary.simpleMessage(
      "Save with your password manager (Bitwarden asks). Without the key, or a backup and its passphrase, the book cannot be read — by design.",
    ),
    "keySave": MessageLookupByLibrary.simpleMessage("Save"),
    "keyToManager": MessageLookupByLibrary.simpleMessage(
      "Keep the key in the password manager",
    ),
    "kpl": MessageLookupByLibrary.simpleMessage("account plan"),
    "language": MessageLookupByLibrary.simpleMessage("Language of the letters"),
    "ledgerTitle": MessageLookupByLibrary.simpleMessage("Books & devices"),
    "letterhead": MessageLookupByLibrary.simpleMessage("Letterhead"),
    "letterheads": MessageLookupByLibrary.simpleMessage("Letterheads"),
    "loadDefault": MessageLookupByLibrary.simpleMessage("load"),
    "loadFile": MessageLookupByLibrary.simpleMessage("load"),
    "makeInvoice": MessageLookupByLibrary.simpleMessage("Make the invoice"),
    "manual": MessageLookupByLibrary.simpleMessage("manual"),
    "name": MessageLookupByLibrary.simpleMessage("Name"),
    "net": MessageLookupByLibrary.simpleMessage("Net"),
    "newInvoice": MessageLookupByLibrary.simpleMessage("New invoice"),
    "newOffer": MessageLookupByLibrary.simpleMessage("New offer"),
    "noCustomer": MessageLookupByLibrary.simpleMessage("Add a customer first."),
    "noDocuments": MessageLookupByLibrary.simpleMessage(
      "No offers or invoices yet.",
    ),
    "noHistory": MessageLookupByLibrary.simpleMessage(
      "This book is kept as plain files on this device. Start a history to sync it with your other devices (encrypted).",
    ),
    "noLetterhead": MessageLookupByLibrary.simpleMessage(
      "Set up a letterhead first (settings).",
    ),
    "noOps": MessageLookupByLibrary.simpleMessage(
      "This book has no stored operations.",
    ),
    "notBooked": MessageLookupByLibrary.simpleMessage(
      "Not booked: the open book lacks the letterhead\'s accounts",
    ),
    "offers": MessageLookupByLibrary.simpleMessage("Offers"),
    "passphrase": MessageLookupByLibrary.simpleMessage("Passphrase"),
    "passphraseAgain": MessageLookupByLibrary.simpleMessage("Passphrase again"),
    "passphrasesDiffer": MessageLookupByLibrary.simpleMessage(
      "The passphrases differ",
    ),
    "pasteInvitation": MessageLookupByLibrary.simpleMessage(
      "…or paste the invitation",
    ),
    "pay": MessageLookupByLibrary.simpleMessage("Payment received"),
    "payDays": MessageLookupByLibrary.simpleMessage("Payable within (days)"),
    "pdf": MessageLookupByLibrary.simpleMessage("PDF"),
    "penaltyRate": MessageLookupByLibrary.simpleMessage(
      "Late interest per year (%)",
    ),
    "phone": MessageLookupByLibrary.simpleMessage("Phone"),
    "preview": MessageLookupByLibrary.simpleMessage("Preview"),
    "quantity": MessageLookupByLibrary.simpleMessage("Quantity"),
    "rate": MessageLookupByLibrary.simpleMessage("Standard rate (%)"),
    "rates": MessageLookupByLibrary.simpleMessage(
      "Rates by category (cours=10, …)",
    ),
    "receivable": MessageLookupByLibrary.simpleMessage("Receivable"),
    "recoveryFee": MessageLookupByLibrary.simpleMessage(
      "Recovery fee (businesses)",
    ),
    "refuse": MessageLookupByLibrary.simpleMessage("Declined"),
    "regime": MessageLookupByLibrary.simpleMessage("Tax regime"),
    "remind": m5,
    "reminderDays": MessageLookupByLibrary.simpleMessage(
      "Reminders after (days: 15, 30, 45)",
    ),
    "reminders": MessageLookupByLibrary.simpleMessage("Reminders"),
    "remindersDue": m6,
    "replacedBy": m7,
    "required": MessageLookupByLibrary.simpleMessage("Required"),
    "restoreBackup": MessageLookupByLibrary.simpleMessage("Restore a backup"),
    "restored": m8,
    "revenue": MessageLookupByLibrary.simpleMessage("Revenue"),
    "reverseCharge": MessageLookupByLibrary.simpleMessage(
      "Reverse charge for (categories)",
    ),
    "save": MessageLookupByLibrary.simpleMessage("save"),
    "saveDraft": MessageLookupByLibrary.simpleMessage("Save draft"),
    "scanHub": MessageLookupByLibrary.simpleMessage("Scan the desktop\'s code"),
    "serviceDate": MessageLookupByLibrary.simpleMessage("Date of service"),
    "settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "shortId": MessageLookupByLibrary.simpleMessage("Short id"),
    "siret": MessageLookupByLibrary.simpleMessage("SIRET"),
    "startHistory": MessageLookupByLibrary.simpleMessage(
      "Start a history from the open book",
    ),
    "status_accepted": MessageLookupByLibrary.simpleMessage("accepted"),
    "status_cancelled": MessageLookupByLibrary.simpleMessage("cancelled"),
    "status_draft": MessageLookupByLibrary.simpleMessage("draft"),
    "status_invoiced": MessageLookupByLibrary.simpleMessage("invoiced"),
    "status_open": MessageLookupByLibrary.simpleMessage("open"),
    "status_overdue": MessageLookupByLibrary.simpleMessage("overdue"),
    "status_paid": MessageLookupByLibrary.simpleMessage("paid"),
    "status_refused": MessageLookupByLibrary.simpleMessage("declined"),
    "status_unpaid": MessageLookupByLibrary.simpleMessage("unpaid"),
    "stopHub": MessageLookupByLibrary.simpleMessage("Stop"),
    "subject": MessageLookupByLibrary.simpleMessage("Subject"),
    "syncNow": MessageLookupByLibrary.simpleMessage("Sync now"),
    "synced": m9,
    "taxNumber": MessageLookupByLibrary.simpleMessage("Tax number (DE)"),
    "unitPrice": MessageLookupByLibrary.simpleMessage("Unit price (net)"),
    "validDays": MessageLookupByLibrary.simpleMessage("Valid for (days)"),
    "vat": MessageLookupByLibrary.simpleMessage("VAT"),
    "vatAccount": MessageLookupByLibrary.simpleMessage("VAT collected"),
    "vatId": MessageLookupByLibrary.simpleMessage("VAT id"),
    "vatNote": MessageLookupByLibrary.simpleMessage(
      "Own franchise note (optional)",
    ),
    "vatRegime": MessageLookupByLibrary.simpleMessage("Charges VAT"),
    "working": MessageLookupByLibrary.simpleMessage("Working…"),
  };
}

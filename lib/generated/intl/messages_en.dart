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

  static String m2(konto) => "Extract for ${konto}";

  static String m3(level) => "Write reminder ${level}";

  static String m4(count) => "${count} reminders due";

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
    "bank": MessageLookupByLibrary.simpleMessage("Bank"),
    "bankAccount": MessageLookupByLibrary.simpleMessage("Bank (payments)"),
    "bilanz": MessageLookupByLibrary.simpleMessage("Balance"),
    "bookIt": MessageLookupByLibrary.simpleMessage("Book"),
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
    "chooseOp": MessageLookupByLibrary.simpleMessage("Choose an operation"),
    "country": MessageLookupByLibrary.simpleMessage("Country (FR, DE…)"),
    "customer": MessageLookupByLibrary.simpleMessage("Customer"),
    "customers": MessageLookupByLibrary.simpleMessage("Customers"),
    "delete": MessageLookupByLibrary.simpleMessage("Delete"),
    "deleteDraft": MessageLookupByLibrary.simpleMessage("Delete draft"),
    "description": MessageLookupByLibrary.simpleMessage("Description"),
    "email": MessageLookupByLibrary.simpleMessage("E-mail"),
    "extract": m2,
    "fastops": MessageLookupByLibrary.simpleMessage("Stored operations"),
    "footer": MessageLookupByLibrary.simpleMessage("Footer"),
    "franchise": MessageLookupByLibrary.simpleMessage(
      "No VAT (franchise, art. 293 B)",
    ),
    "gross": MessageLookupByLibrary.simpleMessage("Total"),
    "history": MessageLookupByLibrary.simpleMessage("History"),
    "idTaken": MessageLookupByLibrary.simpleMessage("This id exists already"),
    "invoices": MessageLookupByLibrary.simpleMessage("Invoices"),
    "invoicing": MessageLookupByLibrary.simpleMessage("Offers & invoices"),
    "issue": MessageLookupByLibrary.simpleMessage("Issue"),
    "items": MessageLookupByLibrary.simpleMessage("Items"),
    "jrl": MessageLookupByLibrary.simpleMessage("Journal"),
    "kpl": MessageLookupByLibrary.simpleMessage("account plan"),
    "language": MessageLookupByLibrary.simpleMessage("Language of the letters"),
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
    "remind": m3,
    "reminderDays": MessageLookupByLibrary.simpleMessage(
      "Reminders after (days: 15, 30, 45)",
    ),
    "reminders": MessageLookupByLibrary.simpleMessage("Reminders"),
    "remindersDue": m4,
    "required": MessageLookupByLibrary.simpleMessage("Required"),
    "revenue": MessageLookupByLibrary.simpleMessage("Revenue"),
    "reverseCharge": MessageLookupByLibrary.simpleMessage(
      "Reverse charge for (categories)",
    ),
    "save": MessageLookupByLibrary.simpleMessage("save"),
    "saveDraft": MessageLookupByLibrary.simpleMessage("Save draft"),
    "serviceDate": MessageLookupByLibrary.simpleMessage("Date of service"),
    "settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "shortId": MessageLookupByLibrary.simpleMessage("Short id"),
    "siret": MessageLookupByLibrary.simpleMessage("SIRET"),
    "status_accepted": MessageLookupByLibrary.simpleMessage("accepted"),
    "status_cancelled": MessageLookupByLibrary.simpleMessage("cancelled"),
    "status_draft": MessageLookupByLibrary.simpleMessage("draft"),
    "status_invoiced": MessageLookupByLibrary.simpleMessage("invoiced"),
    "status_open": MessageLookupByLibrary.simpleMessage("open"),
    "status_overdue": MessageLookupByLibrary.simpleMessage("overdue"),
    "status_paid": MessageLookupByLibrary.simpleMessage("paid"),
    "status_refused": MessageLookupByLibrary.simpleMessage("declined"),
    "status_unpaid": MessageLookupByLibrary.simpleMessage("unpaid"),
    "subject": MessageLookupByLibrary.simpleMessage("Subject"),
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
  };
}

// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de locale. All the
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
  String get localeName => 'de';

  static String m0(count) => "${count} Zeilen gebucht";

  static String m1(count) => "Im offenen Buch gebucht: ${count} Zeilen";

  static String m2(konto) => "Konto-Auszug von ${konto}";

  static String m3(level) => "Mahnstufe ${level} schreiben";

  static String m4(count) => "${count} Mahnungen fällig";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "AppTitle": MessageLookupByLibrary.simpleMessage("Noh Finanz Buchhaltung"),
    "JrlTitle": MessageLookupByLibrary.simpleMessage("Journal"),
    "KplTitle": MessageLookupByLibrary.simpleMessage("Kontoplan"),
    "NavTitle": MessageLookupByLibrary.simpleMessage("Navigation"),
    "Start": MessageLookupByLibrary.simpleMessage("Willkommen"),
    "accept": MessageLookupByLibrary.simpleMessage("Angenommen"),
    "addItem": MessageLookupByLibrary.simpleMessage("Position hinzufügen"),
    "address": MessageLookupByLibrary.simpleMessage(
      "Anschrift (je Zeile eine)",
    ),
    "amount": MessageLookupByLibrary.simpleMessage("Betrag"),
    "bank": MessageLookupByLibrary.simpleMessage("Bank"),
    "bankAccount": MessageLookupByLibrary.simpleMessage("Bank (Zahlungen)"),
    "bilanz": MessageLookupByLibrary.simpleMessage("Bilanz"),
    "bookIt": MessageLookupByLibrary.simpleMessage("Buchen"),
    "booked": m0,
    "booked2": m1,
    "booking": MessageLookupByLibrary.simpleMessage(
      "Buchung (Kontonummern; leer: keine Buchung)",
    ),
    "business": MessageLookupByLibrary.simpleMessage(
      "Unternehmen (keine Privatperson)",
    ),
    "category": MessageLookupByLibrary.simpleMessage(
      "Kategorie (z. B. 3dprint, cours)",
    ),
    "chooseOp": MessageLookupByLibrary.simpleMessage("Operation wählen"),
    "country": MessageLookupByLibrary.simpleMessage("Land (FR, DE…)"),
    "customer": MessageLookupByLibrary.simpleMessage("Kunde"),
    "customers": MessageLookupByLibrary.simpleMessage("Kunden"),
    "delete": MessageLookupByLibrary.simpleMessage("Löschen"),
    "deleteDraft": MessageLookupByLibrary.simpleMessage("Entwurf löschen"),
    "description": MessageLookupByLibrary.simpleMessage("Bezeichnung"),
    "email": MessageLookupByLibrary.simpleMessage("E-Mail"),
    "extract": m2,
    "fastops": MessageLookupByLibrary.simpleMessage("Schnellbuchungen"),
    "footer": MessageLookupByLibrary.simpleMessage("Fußzeile"),
    "franchise": MessageLookupByLibrary.simpleMessage(
      "Keine USt. (Franchise, Art. 293 B)",
    ),
    "gross": MessageLookupByLibrary.simpleMessage("Gesamt"),
    "history": MessageLookupByLibrary.simpleMessage("Verlauf"),
    "idTaken": MessageLookupByLibrary.simpleMessage(
      "Diesen Kurznamen gibt es schon",
    ),
    "invoices": MessageLookupByLibrary.simpleMessage("Rechnungen"),
    "invoicing": MessageLookupByLibrary.simpleMessage("Angebote & Rechnungen"),
    "issue": MessageLookupByLibrary.simpleMessage("Ausstellen"),
    "items": MessageLookupByLibrary.simpleMessage("Positionen"),
    "jrl": MessageLookupByLibrary.simpleMessage("Journal"),
    "kpl": MessageLookupByLibrary.simpleMessage("Kontoplan"),
    "language": MessageLookupByLibrary.simpleMessage("Sprache der Briefe"),
    "letterhead": MessageLookupByLibrary.simpleMessage("Briefkopf"),
    "letterheads": MessageLookupByLibrary.simpleMessage("Briefköpfe"),
    "loadDefault": MessageLookupByLibrary.simpleMessage("laden"),
    "loadFile": MessageLookupByLibrary.simpleMessage("laden"),
    "makeInvoice": MessageLookupByLibrary.simpleMessage("Rechnung erstellen"),
    "manual": MessageLookupByLibrary.simpleMessage("Handbuch"),
    "name": MessageLookupByLibrary.simpleMessage("Name"),
    "net": MessageLookupByLibrary.simpleMessage("Netto"),
    "newInvoice": MessageLookupByLibrary.simpleMessage("Neue Rechnung"),
    "newOffer": MessageLookupByLibrary.simpleMessage("Neues Angebot"),
    "noCustomer": MessageLookupByLibrary.simpleMessage(
      "Zuerst einen Kunden anlegen.",
    ),
    "noDocuments": MessageLookupByLibrary.simpleMessage(
      "Noch keine Angebote oder Rechnungen.",
    ),
    "noLetterhead": MessageLookupByLibrary.simpleMessage(
      "Zuerst einen Briefkopf anlegen (Einstellungen).",
    ),
    "noOps": MessageLookupByLibrary.simpleMessage(
      "Dieses Buch hat keine gespeicherten Operationen.",
    ),
    "notBooked": MessageLookupByLibrary.simpleMessage(
      "Nicht gebucht: dem offenen Buch fehlen die Konten des Briefkopfs",
    ),
    "offers": MessageLookupByLibrary.simpleMessage("Angebote"),
    "pay": MessageLookupByLibrary.simpleMessage("Zahlung erhalten"),
    "payDays": MessageLookupByLibrary.simpleMessage("Zahlbar innerhalb (Tage)"),
    "pdf": MessageLookupByLibrary.simpleMessage("PDF"),
    "penaltyRate": MessageLookupByLibrary.simpleMessage(
      "Verzugszinsen p. a. (%)",
    ),
    "phone": MessageLookupByLibrary.simpleMessage("Telefon"),
    "preview": MessageLookupByLibrary.simpleMessage("Vorschau"),
    "quantity": MessageLookupByLibrary.simpleMessage("Menge"),
    "rate": MessageLookupByLibrary.simpleMessage("Regelsatz (%)"),
    "rates": MessageLookupByLibrary.simpleMessage(
      "Sätze je Kategorie (cours=10, …)",
    ),
    "receivable": MessageLookupByLibrary.simpleMessage("Forderungen"),
    "recoveryFee": MessageLookupByLibrary.simpleMessage(
      "Verzugspauschale (Unternehmen)",
    ),
    "refuse": MessageLookupByLibrary.simpleMessage("Abgelehnt"),
    "regime": MessageLookupByLibrary.simpleMessage("Steuerregelung"),
    "remind": m3,
    "reminderDays": MessageLookupByLibrary.simpleMessage(
      "Mahnungen nach (Tagen: 15, 30, 45)",
    ),
    "reminders": MessageLookupByLibrary.simpleMessage("Mahnwesen"),
    "remindersDue": m4,
    "required": MessageLookupByLibrary.simpleMessage("Pflichtfeld"),
    "revenue": MessageLookupByLibrary.simpleMessage("Erlöse"),
    "reverseCharge": MessageLookupByLibrary.simpleMessage(
      "Steuerschuldumkehr für (Kategorien)",
    ),
    "save": MessageLookupByLibrary.simpleMessage("Speichern"),
    "saveDraft": MessageLookupByLibrary.simpleMessage("Entwurf speichern"),
    "serviceDate": MessageLookupByLibrary.simpleMessage("Leistungsdatum"),
    "settings": MessageLookupByLibrary.simpleMessage("Einstellungen"),
    "shortId": MessageLookupByLibrary.simpleMessage("Kurzname"),
    "siret": MessageLookupByLibrary.simpleMessage("SIRET"),
    "status_accepted": MessageLookupByLibrary.simpleMessage("angenommen"),
    "status_cancelled": MessageLookupByLibrary.simpleMessage("storniert"),
    "status_draft": MessageLookupByLibrary.simpleMessage("Entwurf"),
    "status_invoiced": MessageLookupByLibrary.simpleMessage("berechnet"),
    "status_open": MessageLookupByLibrary.simpleMessage("offen"),
    "status_overdue": MessageLookupByLibrary.simpleMessage("überfällig"),
    "status_paid": MessageLookupByLibrary.simpleMessage("bezahlt"),
    "status_refused": MessageLookupByLibrary.simpleMessage("abgelehnt"),
    "status_unpaid": MessageLookupByLibrary.simpleMessage("unbezahlt"),
    "subject": MessageLookupByLibrary.simpleMessage("Betreff"),
    "taxNumber": MessageLookupByLibrary.simpleMessage("Steuernummer"),
    "unitPrice": MessageLookupByLibrary.simpleMessage("Einzelpreis netto"),
    "validDays": MessageLookupByLibrary.simpleMessage("Gültig (Tage)"),
    "vat": MessageLookupByLibrary.simpleMessage("USt."),
    "vatAccount": MessageLookupByLibrary.simpleMessage("Umsatzsteuer"),
    "vatId": MessageLookupByLibrary.simpleMessage("USt-IdNr."),
    "vatNote": MessageLookupByLibrary.simpleMessage(
      "Eigener Franchise-Hinweis (optional)",
    ),
    "vatRegime": MessageLookupByLibrary.simpleMessage("Mit Umsatzsteuer"),
  };
}

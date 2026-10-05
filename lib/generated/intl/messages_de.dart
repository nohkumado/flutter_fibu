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

  static String m2(count, conflicts) =>
      "${count} Änderungen · ${conflicts} Konflikte";

  static String m3(device, series) =>
      "Dieses Gerät: ${device} · Rechnungsserie: ${series}";

  static String m4(konto) => "Konto-Auszug von ${konto}";

  static String m5(level) => "Mahnstufe ${level} schreiben";

  static String m6(count) => "${count} Mahnungen fällig";

  static String m7(kept, replaced) =>
      "behalten: ${kept} — ersetzt: ${replaced}";

  static String m8(count) => "${count} Änderungen zurückgespielt";

  static String m9(received, sent) =>
      "Abgeglichen: ${received} erhalten, ${sent} gesendet";

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
    "backup": MessageLookupByLibrary.simpleMessage("Sichern (Passphrase)"),
    "backupSaved": MessageLookupByLibrary.simpleMessage(
      "Sicherung gespeichert",
    ),
    "bank": MessageLookupByLibrary.simpleMessage("Bank"),
    "bankAccount": MessageLookupByLibrary.simpleMessage("Bank (Zahlungen)"),
    "beHub": MessageLookupByLibrary.simpleMessage(
      "Als Zentrale dienen (Code für die anderen Geräte zeigen)",
    ),
    "bilanz": MessageLookupByLibrary.simpleMessage("Bilanz"),
    "bookIt": MessageLookupByLibrary.simpleMessage("Buchen"),
    "bookName": MessageLookupByLibrary.simpleMessage(
      "Name des Buchs (z. B. compta2026)",
    ),
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
    "changesInfo": m2,
    "chooseOp": MessageLookupByLibrary.simpleMessage("Operation wählen"),
    "closeHistory": MessageLookupByLibrary.simpleMessage(
      "Zurück zu einfachen Dateien",
    ),
    "conflictsTitle": MessageLookupByLibrary.simpleMessage(
      "Gleichzeitig auf zwei Geräten geändert",
    ),
    "country": MessageLookupByLibrary.simpleMessage("Land (FR, DE…)"),
    "customer": MessageLookupByLibrary.simpleMessage("Kunde"),
    "customers": MessageLookupByLibrary.simpleMessage("Kunden"),
    "delete": MessageLookupByLibrary.simpleMessage("Löschen"),
    "deleteDraft": MessageLookupByLibrary.simpleMessage("Entwurf löschen"),
    "description": MessageLookupByLibrary.simpleMessage("Bezeichnung"),
    "deviceInfo": m3,
    "email": MessageLookupByLibrary.simpleMessage("E-Mail"),
    "extract": m4,
    "fastops": MessageLookupByLibrary.simpleMessage("Schnellbuchungen"),
    "footer": MessageLookupByLibrary.simpleMessage("Fußzeile"),
    "franchise": MessageLookupByLibrary.simpleMessage(
      "Keine USt. (Franchise, Art. 293 B)",
    ),
    "gross": MessageLookupByLibrary.simpleMessage("Gesamt"),
    "history": MessageLookupByLibrary.simpleMessage("Verlauf"),
    "hubRunning": MessageLookupByLibrary.simpleMessage(
      "Warte auf Geräte. Dieser Code enthält den Schlüssel des Buchs: nur deinen eigenen Geräten und denen deiner Mitarbeiter zeigen.",
    ),
    "idTaken": MessageLookupByLibrary.simpleMessage(
      "Diesen Kurznamen gibt es schon",
    ),
    "invoices": MessageLookupByLibrary.simpleMessage("Rechnungen"),
    "invoicing": MessageLookupByLibrary.simpleMessage("Angebote & Rechnungen"),
    "issue": MessageLookupByLibrary.simpleMessage("Ausstellen"),
    "items": MessageLookupByLibrary.simpleMessage("Positionen"),
    "jrl": MessageLookupByLibrary.simpleMessage("Journal"),
    "keyEnter": MessageLookupByLibrary.simpleMessage("Schlüssel eingeben"),
    "keyHint": MessageLookupByLibrary.simpleMessage(
      "Mit dem Passwortmanager speichern (Bitwarden fragt nach). Ohne Schlüssel oder Sicherung samt Passphrase ist das Buch nicht lesbar — mit Absicht.",
    ),
    "keySave": MessageLookupByLibrary.simpleMessage("Speichern"),
    "keyToManager": MessageLookupByLibrary.simpleMessage(
      "Schlüssel im Passwortmanager ablegen",
    ),
    "kpl": MessageLookupByLibrary.simpleMessage("Kontoplan"),
    "language": MessageLookupByLibrary.simpleMessage("Sprache der Briefe"),
    "ledgerTitle": MessageLookupByLibrary.simpleMessage("Bücher & Geräte"),
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
    "noHistory": MessageLookupByLibrary.simpleMessage(
      "Dieses Buch liegt als einfache Dateien auf diesem Gerät. Starte einen Verlauf, um es (verschlüsselt) mit deinen anderen Geräten abzugleichen.",
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
    "passphrase": MessageLookupByLibrary.simpleMessage("Passphrase"),
    "passphraseAgain": MessageLookupByLibrary.simpleMessage(
      "Passphrase wiederholen",
    ),
    "passphrasesDiffer": MessageLookupByLibrary.simpleMessage(
      "Die Passphrasen sind verschieden",
    ),
    "pasteInvitation": MessageLookupByLibrary.simpleMessage(
      "…oder die Einladung einfügen",
    ),
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
    "remind": m5,
    "reminderDays": MessageLookupByLibrary.simpleMessage(
      "Mahnungen nach (Tagen: 15, 30, 45)",
    ),
    "reminders": MessageLookupByLibrary.simpleMessage("Mahnwesen"),
    "remindersDue": m6,
    "replacedBy": m7,
    "required": MessageLookupByLibrary.simpleMessage("Pflichtfeld"),
    "restoreBackup": MessageLookupByLibrary.simpleMessage(
      "Sicherung zurückspielen",
    ),
    "restored": m8,
    "revenue": MessageLookupByLibrary.simpleMessage("Erlöse"),
    "reverseCharge": MessageLookupByLibrary.simpleMessage(
      "Steuerschuldumkehr für (Kategorien)",
    ),
    "save": MessageLookupByLibrary.simpleMessage("Speichern"),
    "saveDraft": MessageLookupByLibrary.simpleMessage("Entwurf speichern"),
    "scanHub": MessageLookupByLibrary.simpleMessage(
      "Code des Desktops scannen",
    ),
    "serviceDate": MessageLookupByLibrary.simpleMessage("Leistungsdatum"),
    "settings": MessageLookupByLibrary.simpleMessage("Einstellungen"),
    "shortId": MessageLookupByLibrary.simpleMessage("Kurzname"),
    "siret": MessageLookupByLibrary.simpleMessage("SIRET"),
    "startHistory": MessageLookupByLibrary.simpleMessage(
      "Verlauf aus dem offenen Buch starten",
    ),
    "status_accepted": MessageLookupByLibrary.simpleMessage("angenommen"),
    "status_cancelled": MessageLookupByLibrary.simpleMessage("storniert"),
    "status_draft": MessageLookupByLibrary.simpleMessage("Entwurf"),
    "status_invoiced": MessageLookupByLibrary.simpleMessage("berechnet"),
    "status_open": MessageLookupByLibrary.simpleMessage("offen"),
    "status_overdue": MessageLookupByLibrary.simpleMessage("überfällig"),
    "status_paid": MessageLookupByLibrary.simpleMessage("bezahlt"),
    "status_refused": MessageLookupByLibrary.simpleMessage("abgelehnt"),
    "status_unpaid": MessageLookupByLibrary.simpleMessage("unbezahlt"),
    "stopHub": MessageLookupByLibrary.simpleMessage("Beenden"),
    "subject": MessageLookupByLibrary.simpleMessage("Betreff"),
    "syncNow": MessageLookupByLibrary.simpleMessage("Jetzt abgleichen"),
    "synced": m9,
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
    "working": MessageLookupByLibrary.simpleMessage("Arbeite…"),
  };
}

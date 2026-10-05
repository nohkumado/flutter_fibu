# Changelog

## Unreleased

- Books & devices (drawer): a book kept as nohfibu's encrypted history.
  Start one from the open book (with the invoice archive and the
  letterheads); every action — journal lines, stored ops, offers,
  invoices, payments, customers, letterheads — is recorded as a change of
  this device. Sync with the desktop: scan its code (camera on Android,
  camera or picture on Linux) or paste the invitation; or be the hub
  (desktop): the app serves the book on the local network and shows the
  pairing code. Backup under a passphrase (saved where you choose, e.g. a
  Nextcloud folder) and restore. The key: on a phone in secure storage
  (Android Keystore), on the desktop in the key file the `ledger` command
  uses; "keep the key in the password manager" shows it as a login so
  Bitwarden (or any autofill service) offers to save it, "enter the key"
  lets it fill the key back in. Conflicts (changed on two devices at the
  same time) are listed. With a history, invoice numbers are in this
  device's series (e.g. TABLET-2026-0001).
- Android: INTERNET and ACCESS_LOCAL_NETWORK in the release manifest (sync).
- Android: no cloud backup and no device-to-device transfer of the app's
  data (allowBackup false, data extraction rules) — books, invoices,
  customers and letterheads with bank details stay on the device.
- Offers & invoices ("Angebote & Rechnungen" in the drawer), on nohfibu's
  workflow — the same archive and letterheads as the facture command line
  (~/.config/nohfibu on Linux, the app's directory on Android): the list
  with status and the reminders due; new offer or invoice (letterhead,
  customer, category, subject, service date, items; tax and totals live);
  a document's page with what its status allows — issue, delete a draft,
  accepted / declined, make the invoice, payment received, write the
  reminder due — its history and its PDF (preview, share, print).
  Invoices and payments are booked into the open book when the letterhead
  books and the book has its accounts (else a note says why not).
- Settings: editors for the letterheads (issuer, legal ids, tax regime,
  rates and reverse charge by category, bank, logo, reminders, booking
  accounts — written as the YAML the command line reads) and the customers.
- French as third language of the app.
- nohfibu 0.2.0: book format 2 (version row, account roles), balances shown
  in their normal direction on the account plan (no minus on liabilities
  and income).
- A journal line typed in the app: "12" is 12 € (was 12 cents), "12,50"
  works, dates as 15.10.2018 / 15-10-2018 / 2018-10-15 (nohfibu's Amount
  and FibuDate).
- Stored operations ("Schnellbuchungen" in the drawer): choose an op of the
  open book, answer its questions as a form (date, account dropdowns for
  ranges, amounts, texts), the journal lines previewed live (or what is
  still wrong), "Book" adds them — nohfibu's `Operation.questions()` /
  `fill()`. The unused dialog scaffold (fastoperation.dart) is gone.
- intl_utils as dev dependency: `dart run intl_utils:generate` rebuilds
  lib/generated from the .arb files.
- Builds again: Linux, web and Android regenerated from the current Flutter
  template (android/ had been deleted, linux/ held only generated files, web/
  was missing) and versioned; app id `eu.nohkumado.flutter_fibu` (was
  com.example); Android at the fleet baseline (Gradle 9.3.1, AGP 9.1.0,
  Kotlin 2.4.0, built-in Kotlin, SDK 37).
- Dependencies at their latest majors: nohfibu 0.1.0 over git (was a path
  dependency), flutter_riverpod 3 (the four StateNotifiers are Notifiers;
  the book notifies with `ref.notifyListeners()` instead of swapping in an
  empty Book), file_picker 13 (`FilePicker.pickFile`), settings_ui 4.
  flutter_html (unmaintained, no longer compiles) replaced by
  flutter_widget_from_html_core for the manual.
- First start without a book no longer crashes (`analyseFname`, now one
  function in book_file_name.dart instead of two copies); load and save
  wait until a book is chosen.
- The picked book file is stored in the settings before it is loaded (it
  was computed and dropped, so the old file was loaded again).
- Settings changes create a new FibuSettings (copyWith), so the screens
  update.
- Widget test: the template's counter test replaced by a real smoke test.
- .idea/ and .flutter-plugins-dependencies no longer tracked.

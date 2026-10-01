// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
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
  String get localeName => 'fr';

  static String m0(count) => "${count} lignes passées";

  static String m1(count) => "Passé dans le livre ouvert : ${count} lignes";

  static String m2(konto) => "Extrait du compte ${konto}";

  static String m3(level) => "Rédiger le rappel ${level}";

  static String m4(count) => "${count} rappels à envoyer";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "AppTitle": MessageLookupByLibrary.simpleMessage(
      "Noh Finance — comptabilité",
    ),
    "JrlTitle": MessageLookupByLibrary.simpleMessage("Journal"),
    "KplTitle": MessageLookupByLibrary.simpleMessage("Plan comptable"),
    "NavTitle": MessageLookupByLibrary.simpleMessage("Navigation"),
    "Start": MessageLookupByLibrary.simpleMessage("Bienvenue"),
    "accept": MessageLookupByLibrary.simpleMessage("Accepté"),
    "addItem": MessageLookupByLibrary.simpleMessage("Ajouter une ligne"),
    "address": MessageLookupByLibrary.simpleMessage(
      "Adresse (une ligne par ligne)",
    ),
    "amount": MessageLookupByLibrary.simpleMessage("Montant"),
    "bank": MessageLookupByLibrary.simpleMessage("Banque"),
    "bankAccount": MessageLookupByLibrary.simpleMessage("Banque (paiements)"),
    "bilanz": MessageLookupByLibrary.simpleMessage("Bilan"),
    "bookIt": MessageLookupByLibrary.simpleMessage("Passer l\'écriture"),
    "booked": m0,
    "booked2": m1,
    "booking": MessageLookupByLibrary.simpleMessage(
      "Comptabilisation (numéros de compte ; vide : aucune)",
    ),
    "business": MessageLookupByLibrary.simpleMessage(
      "Professionnel (pas un particulier)",
    ),
    "category": MessageLookupByLibrary.simpleMessage(
      "Catégorie (p. ex. 3dprint, cours)",
    ),
    "chooseOp": MessageLookupByLibrary.simpleMessage("Choisir une opération"),
    "country": MessageLookupByLibrary.simpleMessage("Pays (FR, DE…)"),
    "customer": MessageLookupByLibrary.simpleMessage("Client"),
    "customers": MessageLookupByLibrary.simpleMessage("Clients"),
    "delete": MessageLookupByLibrary.simpleMessage("Supprimer"),
    "deleteDraft": MessageLookupByLibrary.simpleMessage(
      "Supprimer le brouillon",
    ),
    "description": MessageLookupByLibrary.simpleMessage("Désignation"),
    "email": MessageLookupByLibrary.simpleMessage("E-mail"),
    "extract": m2,
    "fastops": MessageLookupByLibrary.simpleMessage("Opérations enregistrées"),
    "footer": MessageLookupByLibrary.simpleMessage("Pied de page"),
    "franchise": MessageLookupByLibrary.simpleMessage(
      "Franchise en base (art. 293 B)",
    ),
    "gross": MessageLookupByLibrary.simpleMessage("TTC"),
    "history": MessageLookupByLibrary.simpleMessage("Historique"),
    "idTaken": MessageLookupByLibrary.simpleMessage(
      "Cet identifiant existe déjà",
    ),
    "invoices": MessageLookupByLibrary.simpleMessage("Factures"),
    "invoicing": MessageLookupByLibrary.simpleMessage("Devis & factures"),
    "issue": MessageLookupByLibrary.simpleMessage("Émettre"),
    "items": MessageLookupByLibrary.simpleMessage("Lignes"),
    "jrl": MessageLookupByLibrary.simpleMessage("Journal"),
    "kpl": MessageLookupByLibrary.simpleMessage("Plan comptable"),
    "language": MessageLookupByLibrary.simpleMessage("Langue des courriers"),
    "letterhead": MessageLookupByLibrary.simpleMessage("En-tête"),
    "letterheads": MessageLookupByLibrary.simpleMessage("En-têtes"),
    "loadDefault": MessageLookupByLibrary.simpleMessage("charger"),
    "loadFile": MessageLookupByLibrary.simpleMessage("charger"),
    "makeInvoice": MessageLookupByLibrary.simpleMessage("Établir la facture"),
    "manual": MessageLookupByLibrary.simpleMessage("Manuel"),
    "name": MessageLookupByLibrary.simpleMessage("Nom"),
    "net": MessageLookupByLibrary.simpleMessage("HT"),
    "newInvoice": MessageLookupByLibrary.simpleMessage("Nouvelle facture"),
    "newOffer": MessageLookupByLibrary.simpleMessage("Nouveau devis"),
    "noCustomer": MessageLookupByLibrary.simpleMessage(
      "Ajoutez d\'abord un client.",
    ),
    "noDocuments": MessageLookupByLibrary.simpleMessage(
      "Pas encore de devis ni de facture.",
    ),
    "noLetterhead": MessageLookupByLibrary.simpleMessage(
      "Créez d\'abord un en-tête (réglages).",
    ),
    "noOps": MessageLookupByLibrary.simpleMessage(
      "Ce livre n\'a pas d\'opérations enregistrées.",
    ),
    "notBooked": MessageLookupByLibrary.simpleMessage(
      "Non passé : le livre ouvert n\'a pas les comptes de l\'en-tête",
    ),
    "offers": MessageLookupByLibrary.simpleMessage("Devis"),
    "pay": MessageLookupByLibrary.simpleMessage("Paiement reçu"),
    "payDays": MessageLookupByLibrary.simpleMessage("Payable sous (jours)"),
    "pdf": MessageLookupByLibrary.simpleMessage("PDF"),
    "penaltyRate": MessageLookupByLibrary.simpleMessage(
      "Pénalités de retard annuelles (%)",
    ),
    "phone": MessageLookupByLibrary.simpleMessage("Téléphone"),
    "preview": MessageLookupByLibrary.simpleMessage("Aperçu"),
    "quantity": MessageLookupByLibrary.simpleMessage("Quantité"),
    "rate": MessageLookupByLibrary.simpleMessage("Taux normal (%)"),
    "rates": MessageLookupByLibrary.simpleMessage(
      "Taux par catégorie (cours=10, …)",
    ),
    "receivable": MessageLookupByLibrary.simpleMessage("Clients"),
    "recoveryFee": MessageLookupByLibrary.simpleMessage(
      "Indemnité de recouvrement (pros)",
    ),
    "refuse": MessageLookupByLibrary.simpleMessage("Refusé"),
    "regime": MessageLookupByLibrary.simpleMessage("Régime de TVA"),
    "remind": m3,
    "reminderDays": MessageLookupByLibrary.simpleMessage(
      "Rappels après (jours : 15, 30, 45)",
    ),
    "reminders": MessageLookupByLibrary.simpleMessage("Relances"),
    "remindersDue": m4,
    "required": MessageLookupByLibrary.simpleMessage("Obligatoire"),
    "revenue": MessageLookupByLibrary.simpleMessage("Produits"),
    "reverseCharge": MessageLookupByLibrary.simpleMessage(
      "Autoliquidation pour (catégories)",
    ),
    "save": MessageLookupByLibrary.simpleMessage("Enregistrer"),
    "saveDraft": MessageLookupByLibrary.simpleMessage(
      "Enregistrer le brouillon",
    ),
    "serviceDate": MessageLookupByLibrary.simpleMessage(
      "Date de la prestation",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("Réglages"),
    "shortId": MessageLookupByLibrary.simpleMessage("Identifiant"),
    "siret": MessageLookupByLibrary.simpleMessage("SIRET"),
    "status_accepted": MessageLookupByLibrary.simpleMessage("accepté"),
    "status_cancelled": MessageLookupByLibrary.simpleMessage("annulé"),
    "status_draft": MessageLookupByLibrary.simpleMessage("brouillon"),
    "status_invoiced": MessageLookupByLibrary.simpleMessage("facturé"),
    "status_open": MessageLookupByLibrary.simpleMessage("en attente"),
    "status_overdue": MessageLookupByLibrary.simpleMessage("en retard"),
    "status_paid": MessageLookupByLibrary.simpleMessage("payé"),
    "status_refused": MessageLookupByLibrary.simpleMessage("refusé"),
    "status_unpaid": MessageLookupByLibrary.simpleMessage("à payer"),
    "subject": MessageLookupByLibrary.simpleMessage("Objet"),
    "taxNumber": MessageLookupByLibrary.simpleMessage("Numéro fiscal (DE)"),
    "unitPrice": MessageLookupByLibrary.simpleMessage("Prix unitaire HT"),
    "validDays": MessageLookupByLibrary.simpleMessage("Valable (jours)"),
    "vat": MessageLookupByLibrary.simpleMessage("TVA"),
    "vatAccount": MessageLookupByLibrary.simpleMessage("TVA collectée"),
    "vatId": MessageLookupByLibrary.simpleMessage("N° TVA intracommunautaire"),
    "vatNote": MessageLookupByLibrary.simpleMessage(
      "Mention de franchise propre (facultatif)",
    ),
    "vatRegime": MessageLookupByLibrary.simpleMessage("Assujetti à la TVA"),
  };
}

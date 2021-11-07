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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
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
    return Intl.message(
      'Side Menu',
      name: 'NavTitle',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get Start {
    return Intl.message(
      'Welcome',
      name: 'Start',
      desc: '',
      args: [],
    );
  }

  /// `account plan`
  String get kpl {
    return Intl.message(
      'account plan',
      name: 'kpl',
      desc: '',
      args: [],
    );
  }

  /// `Journal`
  String get jrl {
    return Intl.message(
      'Journal',
      name: 'jrl',
      desc: '',
      args: [],
    );
  }

  /// `Balance`
  String get bilanz {
    return Intl.message(
      'Balance',
      name: 'bilanz',
      desc: '',
      args: [],
    );
  }

  /// `Account Plan`
  String get KplTitle {
    return Intl.message(
      'Account Plan',
      name: 'KplTitle',
      desc: '',
      args: [],
    );
  }

  /// `Journal`
  String get JrlTitle {
    return Intl.message(
      'Journal',
      name: 'JrlTitle',
      desc: '',
      args: [],
    );
  }

  /// `save`
  String get save {
    return Intl.message(
      'save',
      name: 'save',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
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

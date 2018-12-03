import '../style/StringZh.dart';
import '../style/StringEn.dart';
import '../style/StringBase.dart';
import 'dart:ui';
import 'package:flutter/material.dart';

class DefaultLocalizations {
  final Locale locale;

  DefaultLocalizations(this.locale);

  static Map<String, StringBase> _localizedValues = {
    'en': new StringEn(),
    'zh': new StringZh(),
  };

  //根据不通的 languageCode 来选择对应的语言
  StringBase get currentLocalized {
    return _localizedValues[locale.languageCode];
  }

  //通过 Localizations 加载当前的 DefaultLocalizations
  static DefaultLocalizations of(BuildContext context) {
    return Localizations.of(context, DefaultLocalizations);
  }
}

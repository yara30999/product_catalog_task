import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:products_app/core/my_app.dart';
import 'package:products_app/core/resourses/language_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [
        LocalizationUtils.englishLocal,
        LocalizationUtils.arabicLocal,
      ],
      path: 'assets/lang',
      fallbackLocale: LocalizationUtils.englishLocal,
      child: const MyApp(),
    ),
  );
}

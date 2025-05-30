import 'package:chatapp/src/common/localization/localization.dart';
import 'package:chatapp/src/common/theme/theme.dart';
import 'package:chatapp/src/common/widget/window_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// {@template app}
/// App widget.
/// {@endtemplate}
class App extends StatelessWidget {
  /// {@macro app}
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Chat App',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const <LocalizationsDelegate<Object?>>[
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          Localization.delegate,
        ],
        theme: View.of(context).platformDispatcher.platformBrightness == Brightness.dark
            ? AppTheme.darkTheme
            : AppTheme.lightTheme,
        home:const Placeholder(),
        supportedLocales: Localization.supportedLocales,
        locale: const Locale('en', 'US'), // TODO(plugfox): implement locale
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: WindowScope(
            title: Localization.of(context).title,
            child: child ?? const SizedBox.shrink(),
          ),
        ),
      );
}

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '/blocs/magic_bloc/magic_bloc.dart';

import '/routes/app_navigator_states.dart';
import '/routes/app_navigation.dart';

import 'providers/http_override.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magic Test',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MagicBloc(),
          ),
          BlocProvider(
            create: (context) => AppNavigatorController(),
          ),
        ],
        child: const AppNavigator(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

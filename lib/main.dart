import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sample_riverpod/src/screen/state_notifier_provider_screen.dart';
import 'package:sample_riverpod/src/screen/change_notifier_provider_creen.dart';
import 'package:sample_riverpod/src/screen/state_provider_screen.dart';
import 'package:sample_riverpod/src/screen/stream_provider_screen.dart';
import 'package:sample_riverpod/src/screen/future_provider_screen.dart';
import 'package:sample_riverpod/src/screen/provider_screen.dart';
import 'package:sample_riverpod/src/home_screen.dart';

import 'package:sample_riverpod/src/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Samples Riverpod',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: Routes.homeScreen,
        routes: {
          Routes.homeScreen: (_) => const HomeScreen(),
          Routes.providerScreen: (_) => const ProviderScreen(),
          Routes.stateNotifierProviderScreen: (_) =>
              const StateNotifierProviderScreen(),
          Routes.futureProviderScreen: (_) => const FutureProviderScreen(),
          Routes.changeNotifierProviderScreen: (_) =>
              const ChangeNotifierProviderScreen(),
          Routes.streamProviderScreen: (_) => const StreamProviderScreen(),
          Routes.stateProviderScreen: (_) => const StateProviderScreen(),
        },
      ),
    );
  }
}

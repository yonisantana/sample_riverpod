import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class _RandomNotifier extends StateNotifier<int> {
  _RandomNotifier() : super(Random().nextInt(9999));

  void generate() {
    final random = Random();
    state = random.nextInt(9999);
  }
}

final randomNumberProvider =
    StateNotifierProvider.autoDispose<_RandomNotifier, int>(
        (ref) => _RandomNotifier());

class StateNotifierProviderScreen extends StatelessWidget {
  const StateNotifierProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'StateNotifierProvider',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const _RandomConsumer(),
            const SizedBox(height: 20.0),
            Consumer(
              builder: (_, ref, __) {
                return ElevatedButton(
                  child: const Text('Generar Número'),
                  onPressed: () {
                    ref.read(randomNumberProvider.notifier).generate();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _RandomConsumer extends ConsumerWidget {
  const _RandomConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef widgetRef) {
    return Text(widgetRef.watch(randomNumberProvider).toString());
  }
}

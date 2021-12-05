import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterNotifier with ChangeNotifier {
  int _value = 0;

  int get value => _value;

  void increment() {
    _value++;
    notifyListeners();
  }
}

// FutureProvider.autoDispose: destroys state if no-longer listened
final counterProvider = ChangeNotifierProvider((ref) => CounterNotifier());

class ChangeNotifierProviderScreen extends StatelessWidget {
  const ChangeNotifierProviderScreen({Key? key}) : super(key: key);

  void _increment({
    required WidgetRef ref,
  }) {
    // Read the provider without listening to it.
    ref.read(counterProvider).increment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChangeNotifierProvider'),
      ),
      body: Consumer(
        builder: (_, ref, __) {
          /*Listens to the value exposed by counterProvider*/
          final counterNotifier = ref.watch(counterProvider);
          return Stack(
            children: [
              Center(
                child: Text('${counterNotifier.value}'),
              ),
              _buildAddButton(
                ref: ref,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildAddButton({
    required WidgetRef ref,
  }) =>
      Positioned(
        bottom: 16,
        right: 16,
        child: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => _increment(ref: ref),
        ),
      );
}

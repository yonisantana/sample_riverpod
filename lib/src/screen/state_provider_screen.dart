import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({Key? key}) : super(key: key);

  void _watchChanges({
    required BuildContext context,
    required WidgetRef ref,
  }) {
    ref.listen(counterStateProvider, (previous, current) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Value: $current'),
          duration: const Duration(
            milliseconds: 500,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _watchChanges(
      context: context,
      ref: ref,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('StateProvider'),
      ),
      body: Center(
        child: Text(ref.watch(counterStateProvider).toString()),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final state = ref.read(counterStateProvider.state);
          state.state++;
        },
      ),
    );
  }
}

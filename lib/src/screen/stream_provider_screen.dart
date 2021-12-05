import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = StreamProvider.autoDispose<int>((ref) {
  return Stream.periodic(
    const Duration(milliseconds: 100),
    (count) {
      return count++;
    },
  ).take(100);
});

class StreamProviderScreen extends StatelessWidget {
  const StreamProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StreamProvider'),
      ),
      body: Center(
        child: Consumer(
          builder: (_, ref, __) {
            final asyncValue = ref.watch(streamProvider);

            return asyncValue.when(
              data: (data) {
                return Text(data.toString());
              },
              error: (e, stack) {
                return Text('$e');
              },
              loading: () => const CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

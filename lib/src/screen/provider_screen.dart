import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final message1Provider = Provider<String>((ref) => 'Consumer');
final message2Provider = Provider<String>((ref) => 'ConsumerWidget');
final message3Provider = Provider<String>((ref) => 'ConsumerStatefulWidget');

class ProviderScreen extends StatelessWidget {
  const ProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: Column(
        children: const [
          Expanded(
            child: _WithConsumer(),
          ),
          Expanded(
            child: _WithConsumerWidget(),
          ),
          Expanded(
            child: _WithConsumerStatefulWidget(),
          ),
        ],
      ),
    );
  }
}

class _WithConsumer extends StatelessWidget {
  const _WithConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        final message = ref.watch(message1Provider);
        return Center(
          child: Text(
            message,
          ),
        );
      },
    );
  }
}

class _WithConsumerWidget extends ConsumerWidget {
  const _WithConsumerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) => Center(
        child: Text(
          ref.watch(message2Provider),
        ),
      );
}

class _WithConsumerStatefulWidget extends ConsumerStatefulWidget {
  const _WithConsumerStatefulWidget({Key? key}) : super(key: key);

  @override
  __WithConsumerStatefulWidgetState createState() =>
      __WithConsumerStatefulWidgetState();
}

class __WithConsumerStatefulWidgetState
    extends ConsumerState<_WithConsumerStatefulWidget> {
  late String message;

  @override
  void initState() {
    message = ref.read(message3Provider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Center(
        child: Text(
          message,
        ),
      );
}

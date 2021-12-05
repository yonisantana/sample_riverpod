import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

//(1)
class MyBloc {
  Future<int> get(String cityName) async {
    await Future.delayed(const Duration(seconds: 5));
    return (cityName == 'Morelia') ? 123 : 321;
  }
}

//(2)
final blocProvider = Provider((ref) => MyBloc());

//(3)
final responseProvider =
    FutureProvider.autoDispose.family<int, String>((ref, cityName) {
  final weatherClient = ref.read(blocProvider);
  return weatherClient.get(cityName);
});

class FutureProviderScreen extends StatelessWidget {
  const FutureProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureProvider'),
      ),
      body: Column(
        children: const [
          Expanded(
            child: _ItemOne(),
          ),
          Expanded(
            child: _ItemTwo(),
          ),
        ],
      ),
    );
  }
}

class _ItemOne extends StatelessWidget {
  const _ItemOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        final responseValue = ref.watch(responseProvider('Morelia'));

        return responseValue.when(
          data: (value) {
            return Center(
              child: Text('$value'),
            );
          },
          error: (e, stack) {
            return Text('$e');
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

class _ItemTwo extends StatelessWidget {
  const _ItemTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        final responseValue = ref.watch(responseProvider(''));

        return responseValue.when(
          data: (value) {
            return Center(
              child: Text('$value'),
            );
          },
          error: (e, stack) {
            return Text('$e');
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

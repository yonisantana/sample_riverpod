import 'package:flutter/material.dart';

import 'package:sample_riverpod/src/models/item_object.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Riverpod - Types of providers'),
        ),
        body: const _ItemList(),
      );
}

class _ItemList extends StatelessWidget {
  const _ItemList({Key? key}) : super(key: key);

  void _goToScreen({
    required BuildContext context,
    required String routeName,
  }) =>
      Navigator.pushNamed(
        context,
        routeName,
      );

  @override
  Widget build(BuildContext context) {
    final list = ItemObject.getList();

    return ListView.separated(
      itemCount: list.length,
      separatorBuilder: (_, __) => Container(
        height: 1,
        color: Colors.black12,
      ),
      itemBuilder: (_, index) {
        final itemObject = list[index];
        return _Item(
          itemObject: itemObject,
          onTap: () {
            _goToScreen(
              context: context,
              routeName: itemObject.routeName,
            );
          },
        );
      },
    );
  }
}

class _Item extends StatelessWidget {
  final ItemObject itemObject;
  final VoidCallback onTap;

  const _Item({
    Key? key,
    required this.itemObject,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemObject.title,
              ),
              const SizedBox(height: 5.0),
              Text(
                itemObject.description,
                style: const TextStyle(
                  fontSize: 10.0,
                ),
              )
            ],
          ),
        ),
      );
}

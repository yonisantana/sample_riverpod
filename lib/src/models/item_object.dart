import 'package:sample_riverpod/src/routes/routes.dart';

class ItemObject {
  final String title;
  final String routeName;
  final String description;

  ItemObject({
    required this.title,
    required this.routeName,
    required this.description,
  });

  static List<ItemObject> getList() {
    final list = <ItemObject>[];
    list.add(ItemObject(
        title: 'Provider',
        routeName: Routes.providerScreen,
        description: 'Consumer, ConsumerWidget, ConsumerStatefulWidget'));
    list.add(ItemObject(
      title: 'FutureProvider',
      routeName: Routes.futureProviderScreen,
      description: 'FutureProvider & Provider',
    ));
    list.add(ItemObject(
      title: 'ChangeNotifierProvider',
      routeName: Routes.changeNotifierProviderScreen,
      description: 'ChangeNotifierProvider & ChangeNotifier Class',
    ));
    list.add(ItemObject(
      title: 'StateNotifierProvider',
      routeName: Routes.stateNotifierProviderScreen,
      description: 'StateNotifierProvider & StateNotifier Class',
    ));
    list.add(ItemObject(
      title: 'StreamProvider',
      routeName: Routes.streamProviderScreen,
      description: 'Obtaining and communicating data',
    ));
    list.add(ItemObject(
      title: 'StateProvider',
      routeName: Routes.stateProviderScreen,
      description: 'Hear Provider status changes and display SnackBar',
    ));
    return list;
  }
}

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'concurrency_list.dart';
import 'exchange.dart';
import 'favorite.dart';

final List<Widget> tapNavigation = [
  const ConcurrencyList(),
  const Favorite(),
  const Exchange()
];

final tapIndexProvider = StateProvider((ref) => 0);

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final tapedIndex = ref.watch(tapIndexProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Concurrency'),backgroundColor: Colors.green,
      ),
      body: tapNavigation[tapedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: tapedIndex,
          onTap: (index) {
            ref.watch(tapIndexProvider.notifier).update((state) => index);
          },
          items: const [
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: 'Favorite', icon: Icon(Icons.favorite)),
            BottomNavigationBarItem(
                label: 'Exchange', icon: Icon(Icons.currency_exchange)),
          ]),
    );
  }
}

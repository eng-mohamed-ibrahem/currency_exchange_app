import 'package:concurrency_exchange_app/controller/provider/concurrency.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loveProvider = StateProvider((ref) => false);

class ConcurrencyList extends ConsumerWidget {
  const ConcurrencyList({super.key});

  @override
  Widget build(BuildContext context, ref) {
    ref.watch(loveProvider);

    final list = ref.watch(concurrencyProvider);
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(list[index].countryCode),
          subtitle: Text(list[index].currencyToDollar.toString()),
          trailing: IconButton(
            onPressed: () {
              list[index].favorite = !list[index].favorite;

              ref.watch(loveProvider.notifier).update((state) => !state);
            },
            icon: list[index].favorite
                ? const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : const Icon(
                    Icons.favorite_border_outlined,
                  ),
          ),
        );
      },
    );
  }
}

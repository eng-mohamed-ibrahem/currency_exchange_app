import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controller/provider/concurrency.dart';

class Favorite extends ConsumerWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final list = ref
        .watch(concurrencyProvider)
        .where((element) => element.favorite == true)
        .toList();

    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(list[index].countryCode),
          subtitle: Text(list[index].currencyToDollar.toString()),
        );
      },
    );
  }
}

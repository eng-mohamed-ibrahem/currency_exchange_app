import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../controller/dio_helper.dart';
import '../../controller/provider/concurrency.dart';
import '../../models/currency_model.dart';
import 'home.dart';

class Splash extends ConsumerWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context, ref) {

    
    DioHelper.getRequest().then((data) {
      for (var item in data.keys) {
        ref.read(concurrencyProvider.notifier).add(
              CurrencyModel(
                countryCode: item,
                currencyToDollar: data[item],
              ),
            );
      }
    }).whenComplete(() => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const Home(),
        ),
        (route) => false));

    return const Stack(
      alignment: Alignment.center,
      children: [
        Text(
          'Loading...',
          style: TextStyle(fontSize: 50),
        )
      ],
    );
  }
}

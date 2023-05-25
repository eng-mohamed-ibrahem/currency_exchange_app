import 'package:concurrency_exchange_app/models/currency_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final concurrencyProvider =
    StateNotifierProvider<_ConcurrencyState, List<CurrencyModel>>(
  (ref) => _ConcurrencyState([]),
);

class _ConcurrencyState extends StateNotifier<List<CurrencyModel>> {
  _ConcurrencyState(super.state);
  
  add(CurrencyModel model) {
    state.add(model);
  }
}

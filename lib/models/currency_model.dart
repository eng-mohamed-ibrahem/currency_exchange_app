class CurrencyModel {
  final String countryCode;
  final double currencyToDollar;
  bool favorite;
  CurrencyModel(
      {required this.countryCode,
      required this.currencyToDollar,
      this.favorite = false});
}

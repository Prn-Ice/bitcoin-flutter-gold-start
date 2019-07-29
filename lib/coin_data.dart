import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NGN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const bitcoinAverageURL =
    'https://apiv2.bitcoinaverage.com/indices/global/ticker';

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    Map<String, double> cryptoData = {};

    //TODO 4: Use a for loop here to loop through the cryptoList and request the data for each of them in turn.
    for (String crypto in cryptoList) {
      String requestURL = '$bitcoinAverageURL/$crypto$selectedCurrency';
      http.Response response = await http.get(requestURL);
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        var lastPrice = decodedData['last'];
        cryptoData[crypto] = lastPrice;
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }

    return cryptoData;
  }
  //TODO 5: Return a Map of the results instead of a single value.

}

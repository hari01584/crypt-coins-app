import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../pojo/gecko_market.dart';
import '../../pojo/gecko_coin.dart';

Future<List<GeckoMarket>> getGeckoMarket() async {
  List<GeckoMarket> market = [];

  final response = await http
        .get(Uri.parse('https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=100&page=1&sparkline=false'));
  if (response.statusCode == 200) {
    var js = jsonDecode(response.body);
    js.forEach((element) {
      var i = GeckoMarket.fromJson(element);
      market.add(i);
    });

    return market;
  } else {
    throw Exception('Failed to load market data');
  }
}

Future<GeckoCoin> getCoinData(String coinId) async {
  final response = await http
        .get(Uri.parse('https://api.coingecko.com/api/v3/coins/'+coinId));
  if (response.statusCode == 200) {
    return GeckoCoin.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load market data');
  }
}

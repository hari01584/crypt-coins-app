import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../pojo/gecko_market.dart';

Future<GeckoMarket> getMarketStats() async {
  // Response response = await get(Uri.parse("https://api.wazirx.com/api/v2/market-status"));
  final response = await http
        .get(Uri.parse('https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=100&page=1&sparkline=false'));
  if (response.statusCode == 200) {
    return GeckoMarket.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load market data');
  }
}

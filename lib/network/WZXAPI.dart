import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../pojo/WZXMarketStat.dart';


Future<WZXMarketStat> getMarketStats() async {
  // Response response = await get(Uri.parse("https://api.wazirx.com/api/v2/market-status"));
  final response = await http
        .get(Uri.parse('https://api.wazirx.com/api/v2/market-status'));
  if (response.statusCode == 200) {
    return WZXMarketStat.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load market data');
  }
}

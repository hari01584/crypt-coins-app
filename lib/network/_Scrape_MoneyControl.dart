import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
import 'package:html/dom.dart';
import '../../pojo/NewsFrame.dart';

Future<List<NewsFrame>> getLiveNews() async {
  List<NewsFrame> news = [];

  final response = await http
        .get(Uri.parse('https://www.moneycontrol.com/news/tags/cryptocurrency.html'));
  if (response.statusCode == 200) {
    return __startParser(response.body);

  } else {
    throw Exception('Failed to load market data');
  }
  return news;
}

Future<List<NewsFrame>> __startParser(body) async {
  List<NewsFrame> news = [];

  var document = parse(body);
  var a = document.querySelector("#cagetory");
  if(a==null) return news;

  List<Element> newsItems = a.getElementsByClassName('clearfix');
  for (var i = 0; i < newsItems.length; i++) {
    Element it = newsItems[i];

    var imgE = it.querySelector("a > img");
    if(imgE==null) continue;
    final String imgUrl = imgE.attributes['data']!.split("?")[0];

    var headlineE = it.querySelector("h2 > a");
    if(headlineE==null) continue;
    final String headline = headlineE.attributes['title']!;
    final String postUrl = headlineE.attributes['href']!;

    var descE = it.querySelector("p");
    if(descE==null) continue;
    final String desc = descE.text;

    var timeE = it.querySelector("span");
    if(timeE==null) continue;
    final String time = timeE.text;

    NewsFrame newsItem = NewsFrame(
      postUrl,
      imgUrl,
      headline,
      desc,
      time,
    );

    news.add(newsItem);
  }

  return news;
}

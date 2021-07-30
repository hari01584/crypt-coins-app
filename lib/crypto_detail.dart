import 'package:flutter/material.dart';
import 'network/coin_geckp_api.dart';
import 'pojo/gecko_coin.dart';
import 'package:html/parser.dart';

class CryptoDetailCard extends StatefulWidget {
  final String id;
  CryptoDetailCard({required this.id});

  @override
  _CryptoDetailCardState createState() => _CryptoDetailCardState();
}

class _CryptoDetailCardState extends State<CryptoDetailCard> {
  late Future<GeckoCoin> futureGeckoCoin;

  @override
  void initState() {
    super.initState();
    futureGeckoCoin = getCoinData(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding:
            const EdgeInsets.only(top: 10, left: 10.0, right: 10, bottom: 10),
        child: buildMainPage(widget.id),
      ),
    );
  }

  Widget buildMainPage(String id){
    return FutureBuilder<GeckoCoin>(
          builder: (ctx, snapshot) {
            if (ConnectionState.active != null && !snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            if (ConnectionState.done != null &&
                snapshot.hasError &&
                snapshot.data != null) {
              return Center(child: Text('Something went wrong :('));
            }
            var data = snapshot.data!;

            return Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.grey.shade300,
              ),
              padding: EdgeInsets.all(10),
              child: ListView(children: [
                Column(
                  children: [
                    Image.network(
                        data.image!),
                    Text(
                      data.name!,
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
                    ),
                    Text(
                      '₹ '+data.currentPriceInr!,
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          _parseHtmlString(data.description!),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.black54),
                        ),
                      ),
                    )
                  ],
                )
              ]),
            );
          },

          // Future that needs to be resolved
          // inorder to display something on the Canvas
          future: getCoinData(id),
    );
  }

  String _parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = parse(document.body!.text).documentElement!.text;

  return parsedString;
  }

}

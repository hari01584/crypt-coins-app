import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'network/WZXAPI.dart';
import 'pojo/WZXMarketStat.dart';

var arrowWidget;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<WZXMarketStat> futureMarket;

  @override
  void initState() {
    super.initState();
    futureMarket = getMarketStats();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            height: 45,
            child: TextField(
                textInputAction: TextInputAction.search,
                onSubmitted: (value) {},
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.blue,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.blue)),
                  hintText: 'Search Crypto',
                )),
          ),
        ),
        Expanded(
          child: btcCoinsWidget(),

          // child: ListView(
          //   children: [
          //     CryptoCard(
          //       image: 'https://picsum.photos/400',
          //       cryptoName: 'BTC',
          //       cryptoExcerpt:
          //           'Bitcoin is one of the largest crypto currency of the world',
          //       price: 3023000,
          //       change: 4.5,
          //     ),
          //     CryptoCard(
          //       image: 'https://picsum.photos/400',
          //       cryptoName: 'BTC',
          //       cryptoExcerpt:
          //           'Bitcoin is one of the largest crypto currency of the world',
          //       price: 3023000,
          //       change: 4.5,
          //     ),
          //     CryptoCard(
          //       image: 'https://picsum.photos/400',
          //       cryptoName: 'BTC',
          //       cryptoExcerpt:
          //           'Bitcoin is one of the largest crypto currency of the world',
          //       price: 3023000,
          //       change: 4.5,
          //     ),
          //   ],
          // ),
        )
      ],
    ));
  }

  Widget upArrow() {
    return Icon(
      Icons.arrow_upward_rounded,
      color: Colors.green,
    );
  }

  Widget downArrow() {
    return Icon(
      Icons.arrow_downward_rounded,
      color: Colors.red,
    );
  }

  Widget btcCoinsWidget() {
    return FutureBuilder<WZXMarketStat>(
      builder: (context, snapshot) {
        if (ConnectionState.active != null && !snapshot.hasData) {
          return Center(child: Text('Loading'));
        }
        if (ConnectionState.done != null &&
            snapshot.hasError &&
            snapshot.data != null) {
          return Center(child: Text('Something went wrong :('));
        }

        var stats = snapshot.data!;
        var markets = stats.markets!;
        print("loaded " + stats.markets![1]!.baseMarket!);

        return Container(
            child: ListView.builder(
                itemCount: markets.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  if ((double.parse((100 *
                              (stats.markets![index]!.open! -
                                  double.parse(stats.markets![index]!.last!)) /
                              stats.markets![index]!.open!)
                          .toStringAsFixed(2))) >
                      0) {
                    arrowWidget = upArrow();
                  } else {
                    arrowWidget = downArrow();
                  }
                  return CryptoCard(
                      image: 'https://picsum.photos/400',
                      cryptoName:
                          stats.markets![index]!.baseMarket!.toUpperCase(),
                      cryptoExcerpt: 'Ligma balls bich',
                      price: double.parse(stats.markets![index]!.last!),
                      change: double.parse((100 *
                              (stats.markets![index]!.open! -
                                  double.parse(stats.markets![index]!.last!)) /
                              stats.markets![index]!.open!)
                          .toStringAsFixed(2)));
                }));
      },
      future: getMarketStats(),
    );
  }
}

class CryptoCard extends StatelessWidget {
  final String cryptoName;
  final String cryptoExcerpt;
  final double price;
  final double change;
  final String image;
  CryptoCard(
      {required this.cryptoName,
      required this.cryptoExcerpt,
      required this.price,
      required this.change,
      required this.image});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 4.0),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          padding:
              EdgeInsets.only(top: 3.0, bottom: 3.0, left: 6.0, right: 6.0),
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Row(
            children: [
              Expanded(
                child: Image.network(
                  image,
                  height: 60,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text(
                        cryptoName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(cryptoExcerpt),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text('₹ ${price.toString()}'),
                    ),
                    Row(
                      children: [
                        arrowWidget,
                        Text('${change.toString()}%'),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

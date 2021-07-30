import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'network/WZXAPI.dart';
import 'pojo/WZXMarketStat.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';

var arrowWidget;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<WZXMarketStat> futureMarket;
  List<WZXMarketStatMarkets?> _marketData = [];
  List<WZXMarketStatMarkets?> _copyMarketData = [];
  bool isMarketLoaded = false;

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
                onSubmitted: (value) => _onSearchValueChange(value),
                onChanged: (value) => _onSearchValueChange(value),
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

  void _onSearchValueChange(String q) {
    _marketData = [];
    _copyMarketData.forEach((value) {
      var b = value!.baseMarket!;
      if (b.startsWith(q.toLowerCase())) {
        _marketData.add(value);
      }
    });

    setState(() {});
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
          return Center(child: CircularProgressIndicator());
        }
        if (ConnectionState.done != null &&
            snapshot.hasError &&
            snapshot.data != null) {
          return Center(child: Text('Something went wrong :('));
        }

        var stats = snapshot.data!;
        if (!isMarketLoaded) {
          _marketData = stats.markets!;
          print("loaded " + _marketData[1]!.baseMarket!);
          _marketData.removeWhere((item) => item!.quoteMarket != 'inr');
          _marketData.removeWhere((item) => item!.status == 'suspended');
          _copyMarketData = []..addAll(_marketData);

          isMarketLoaded = true;
        } else {
          print("Already loaded");
        }

        return Container(
            child: ListView.builder(
                itemCount: _marketData.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  if (_marketData[index] == null ||
                      _marketData[index]!.last == null ||
                      _marketData[index]!.open == null ||
                      _marketData[index]!.baseMarket == null ||
                      _marketData[index]!.quoteMarket == null ||
                      _marketData[index]!.last == null) return Container();

                  if ((double.parse((100 *
                              (_marketData[index]!.open! -
                                  double.parse(_marketData[index]!.last!)) /
                              _marketData[index]!.open!)
                          .toStringAsFixed(2))) >
                      0) {
                    arrowWidget = upArrow();
                  } else {
                    arrowWidget = downArrow();
                  }
                  return SwipeActionCell(
                    key: Key(_marketData[index]!.baseMarket!),
                    performsFirstActionWithFullSwipe: true,
                    trailingActions: <SwipeAction>[
                      SwipeAction(
                          title: "Add to Favorites",
                          onTap: (CompletionHandler handler) async {},
                          color: Colors.green),
                    ],
                    child: CryptoCard(
                        image: 'https://media.wazirx.com/media/' +
                            _marketData[index]!.baseMarket! +
                            '/84.png',
                        cryptoName:
                            _marketData[index]!.baseMarket!.toUpperCase(),
                        cryptoExcerpt: _marketData[index]!.quoteMarket!,
                        price: double.parse(_marketData[index]!.last!),
                        change: double.parse((100 *
                                (_marketData[index]!.open! -
                                    double.parse(_marketData[index]!.last!)) /
                                _marketData[index]!.open!)
                            .toStringAsFixed(2))),
                  );
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
                  height: 45,
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

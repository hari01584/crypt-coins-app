import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          child: ListView(
            children: [
              CryptoCard(
                image: 'images/bitcoin.png',
                cryptoName: 'BTC',
                cryptoExcerpt:
                    'Bitcoin is one of the largest crypto currency of the world',
                price: 3023000,
                change: 4.5,
              ),
              CryptoCard(
                image: 'images/bitcoin.png',
                cryptoName: 'BTC',
                cryptoExcerpt:
                    'Bitcoin is one of the largest crypto currency of the world',
                price: 3023000,
                change: 4.5,
              ),
              CryptoCard(
                image: 'images/bitcoin.png',
                cryptoName: 'BTC',
                cryptoExcerpt:
                    'Bitcoin is one of the largest crypto currency of the world',
                price: 3023000,
                change: 4.5,
              ),
              CryptoCard(
                image: 'images/bitcoin.png',
                cryptoName: 'BTC',
                cryptoExcerpt:
                    'Bitcoin is one of the largest crypto currency of the world',
                price: 3023000,
                change: 4.5,
              ),
              CryptoCard(
                image: 'images/bitcoin.png',
                cryptoName: 'BTC',
                cryptoExcerpt:
                    'Bitcoin is one of the largest crypto currency of the world',
                price: 3023000,
                change: 4.5,
              ),
              CryptoCard(
                image: 'images/bitcoin.png',
                cryptoName: 'BTC',
                cryptoExcerpt:
                    'Bitcoin is one of the largest crypto currency of the world',
                price: 3023000,
                change: 4.5,
              ),
              CryptoCard(
                image: 'images/bitcoin.png',
                cryptoName: 'BTC',
                cryptoExcerpt:
                    'Bitcoin is one of the largest crypto currency of the world',
                price: 3023000,
                change: 4.5,
              )
            ],
          ),
        )
      ],
    ));
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
      padding: const EdgeInsets.all(4.0),
      child: TextButton(
        onPressed: () {},
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Row(
            children: [
              Expanded(
                child: Image.asset(
                  image,
                  width: 50,
                  height: 50,
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
                        Icon(Icons.arrow_upward_rounded),
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

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
            children: [CryptoCard()],
          ),
        )
      ],
    ));
  }
}

class CryptoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                  'images/bitcoin.png',
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
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        'BTC',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                          'Bitcoin-One of the most largest crypto-currency in the world'),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text('₹ 30,30000'),
                    ),
                    Row(
                      children: [
                        Icon(Icons.arrow_upward_rounded),
                        Text('2.3%'),
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

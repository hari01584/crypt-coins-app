import 'package:flutter/material.dart';

class CryptoDetailCard extends StatelessWidget {
  final String id;
  CryptoDetailCard({required this.id});
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
        child: Container(
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
                    'https://assets.coingecko.com/coins/images/1/small/bitcoin.png?1547033579'),
                Text(
                  'BITCOIN',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
                Text(
                  '₹ 2844899',
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'Bitcoin is a cryptocurrency. It is a decentralized digital currency that is based on cryptography. As such, it can operate without the need of a central authority like a central bank or a company. It is unlike government-issued or fiat currencies such as US Dollars or Euro in which they are controlled by the country’s central bank. The decentralized nature allows it to operate on a peer-to-peer network whereby users are able to send funds to each other without going through intermediaries.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.black54),
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}

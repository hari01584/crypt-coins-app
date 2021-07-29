import 'package:flutter/material.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}


class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: Alignment(0.0, -0.95),
              child: Text(
                'Crypto News',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize:26.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            new  Container(
              margin: const EdgeInsets.only(top: 40.0),
              child : Card(
  clipBehavior: Clip.antiAliasWithSaveLayer,
  color: Color(0xFFF5F5F5),
  elevation: 3,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  ),
  child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Image.network(
        'https://picsum.photos/seed/789/300',
        width: double.infinity,
        height: 120,
        fit: BoxFit.cover,
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(15, 15, 15, 25),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Card Title',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Me",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum gravida mattis lorem, et posuere tortor rutrum vitae. Vivamus lacinia fringilla libero, at maximus quam imperdiet sed. Pellentesque egestas eget ex a consectetur.',
                style: TextStyle(
                  fontFamily: 'Poppins',
                ),
              ),
            )
          ],
        ),
      )
    ],
  ),
)
            ),
          ],
        ),
      );
  }
}

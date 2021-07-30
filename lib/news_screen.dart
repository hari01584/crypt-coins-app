import 'package:flutter/material.dart';
import 'pojo/NewsFrame.dart';
import 'network/_Scrape_MoneyControl.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}


class _NewsScreenState extends State<NewsScreen> {
  late Future<List<NewsFrame>> futureNews;

  @override
  void initState() {
    super.initState();
    futureNews = getLiveNews();
    futureNews.then((value) {
      print("Lets seeee " + value.length.toString());
    });
    print("Here");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            
            Expanded(
              child: newsWidget()
            ),
          ],
        ),
      );
  }

  Widget newsWidget() {
    // return NewsCard(
    //   postUrl: "abcd",
    //   imgUrl: "https://picsum.photos/seed/789/300",
    //   headline: "Finally a really really very really long big text So cccccccccccccccccccccccccccc",
    //   desc: "Okay bich come on man",
    //   time: "Y"
    // );
    return FutureBuilder<List<NewsFrame>>(
      builder: (context, snapshot) {
          if (ConnectionState.active != null && !snapshot.hasData) {
            return Center(child: Text('Loading'));
          }
          if (ConnectionState.done != null && snapshot.hasError && snapshot.data != null) {
          return Center(child: Text('Something went wrong :('));
          }
          List<NewsFrame> news = snapshot.data!;
          print("News Items Count: "+news.length.toString());

          return Container(
                  child: ListView.builder(
                  itemCount: news.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    var newsitem = news[index];
                    return NewsCard(
                      postUrl: newsitem.postUrl!,
                      imgUrl: newsitem.imgUrl!,
                      headline: newsitem.headline!,
                      desc: newsitem.desc!,
                      time: newsitem.time!
                    );
                  }
                )
              );
        },
        future: getLiveNews(),
      );
  }

}

class NewsCard extends StatelessWidget {
  final String postUrl;
  final String imgUrl;
  final String headline;
  final String desc;
  final String time;

  NewsCard({
    required this.postUrl,
    required this.imgUrl,
    required this.headline,
    required this.desc,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: Color(0xFFF5F5F5),
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network(
                    imgUrl,
                    width: double.infinity,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 15, 15, 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        // Padding(
                        //   padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        //   child: Row(
                        //     mainAxisSize: MainAxisSize.max,
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Text(
                        //         headline,
                        //         style: TextStyle(
                        //           fontFamily: 'Poppins',
                        //           fontSize: 15,
                        //           fontWeight: FontWeight.w600,
                        //         ),
                        //       ),
                        //       Text(
                        //         time,
                        //         style: TextStyle(
                        //           fontFamily: 'Poppins',
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        Text(
                          "Head: " + headline,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                          child: Text(
                            "Desc: " + desc,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                          child: Text(
                            "At: " + time,
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
          );
  }
}

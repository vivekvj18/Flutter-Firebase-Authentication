import 'package:firebase_signin/TU_BACKEND/TU_Fetch.dart';
import 'package:firebase_signin/TU_COMPONENTS/TU_Appbar.dart';
import 'package:firebase_signin/TU_COMPONENTS/TU_Newsbox.dart';
import 'package:firebase_signin/TU_COMPONENTS/TU_Searchbar.dart';
import 'package:firebase_signin/TU_UTILS/TU_Colors.dart';
import 'package:firebase_signin/TU_UTILS/TU_ERROR_IMAGE.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List> news;

  @override
  void initState() {
    super.initState();
    news = fetchnews();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor:Color.fromARGB(255, 69, 68, 68) ,
        appBar: appbar(),
        body: Column(
          children: [
            SearchBar(),
            Expanded(
              child: Container(
                  width: w,
                  child: FutureBuilder<List>(
                    future: fetchnews(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return NewsBox(
                                url: snapshot.data![index]['url'],
                                imageurl:
                                    snapshot.data![index]['urlToImage'] != null
                                        ? snapshot.data![index]['urlToImage']
                                        : Constants.imageurl,
                                title: snapshot.data![index]['title'],
                                time: snapshot.data![index]['publishedAt'],
                                description: snapshot.data![index]
                                        ['description']
                                    .toString(),
                              );
                            });
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }

                      // By default, show a loading spinner.
                      return Center(
                          child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ));
                    },
                  )),
            ),
          ],
        ));
  }
}
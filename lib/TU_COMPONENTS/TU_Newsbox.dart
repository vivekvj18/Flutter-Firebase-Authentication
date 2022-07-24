import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_signin/TU_COMPONENTS/TU_BottomScreen.dart';
import 'package:firebase_signin/TU_COMPONENTS/TU_Components.dart';
import 'package:firebase_signin/TU_UTILS/TU_Colors.dart';
import 'package:firebase_signin/TU_UTILS/TU_Text.dart';
import 'package:flutter/material.dart';

class NewsBox extends StatelessWidget {
  final String imageurl, title, time, description, url;
  const NewsBox(
      {Key? key,
      required this.imageurl,
      required this.title,
      required this.time,
      required this.description,
      required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        InkWell(
          onTap: () {
            showMyBottomSheet(context, title, description, imageurl, url);
          },
          child: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(left: 5, right: 5, top: 5),
            width: w,
            color: AppColors.newscolor,
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: imageurl,
                  imageBuilder: (context, imageProvider) => Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.yellow),
                  ),
                  placeholder: (context, url) =>
                      CircularProgressIndicator(color: AppColors.primary),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      modifiedText(
                          color: AppColors.black, size: 18, text: title),
                      SizedBox(height: 5),
                      modifiedText(
                          color: AppColors.primary, size: 14, text: time),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        DividerWidget()
      ],
    );
  }
}
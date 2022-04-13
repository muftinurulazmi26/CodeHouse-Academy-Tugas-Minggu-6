import 'package:flutter/material.dart';

import 'package:news_apps/model/news.dart';
import 'package:news_apps/theme.dart';

class PhotoCard extends StatelessWidget {
  late News news;

  PhotoCard({
    Key? key,
    required this.news,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: greyColor4,
            ),
            child: news.urlToImage.isEmpty
                ? Image.asset(
                    "assets/images/no_images.png",
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    news.urlToImage,
                    fit: BoxFit.cover,
                  ),
          ),
          Positioned(
            top: 0.0,
            right: 1.0,
            child: Text(
              news.publishedAt,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: whiteColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              margin: const EdgeInsets.only(left: 8, bottom: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            news.author,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: whiteColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              news.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 14,
                                color: whiteColor,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

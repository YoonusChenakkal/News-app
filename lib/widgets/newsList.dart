import 'package:flutter/material.dart';

class newsList extends StatelessWidget {
  newsList({super.key, required this.article});
  var article;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      color: Colors.grey[100],
      height: MediaQuery.of(context).size.height / 8,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Container(
              margin: EdgeInsets.all(6),
              height: MediaQuery.of(context).size.height / 8,
              width: MediaQuery.of(context).size.width / 3.4,
              // color: Colors.amber,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: article.urlToImage != null
                    ? NetworkImage(article.urlToImage)
                    : NetworkImage(
                        'https://imgs.search.brave.com/udmDGOGRJTYO6lmJ0ADA03YoW4CdO6jPKGzXWvx1XRI/rs:fit:860:0:0/g:ce/aHR0cHM6Ly90My5m/dGNkbi5uZXQvanBn/LzAyLzY4LzU1LzYw/LzM2MF9GXzI2ODU1/NjAxMl9jMVdCYUtG/TjVyalJ4UjJleVYz/M3puSzRxblllS1pq/bS5qcGc'),
                fit: BoxFit.cover,
              ))),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                // width: MediaQuery.of(context).size.width/1.446,
                // color: Colors.brown,
                child: Column(
                  children: [
                    Text(
                      article.title,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 3.0),
                    Text(
                      article.description ?? '',
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 16.0, overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

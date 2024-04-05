import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:online_news/model.dart';
import 'package:online_news/widgets/newsList.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  News? _news;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    final queryParameters = {
      'country': 'IN',
      'apiKey': 'afbe19f351d641b4a6ce1625ef1d0343'
    };

    var url = Uri.http('newsapi.org', '/v2/top-headlines', queryParameters);
    print(url);
    var response = await http.get(url);
    print('Response $response');
    if (response.statusCode == 200) {
      setState(() {
        _news = newsFromJson(response.body);
      });
    } else {
      print('Failed to fetch data. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _news != null
          ? ListView.builder(
              itemCount: _news!.articles.length,
              itemBuilder: (context, index) {
                var article = _news!.articles[index];
                return newsList(article: article,);
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}

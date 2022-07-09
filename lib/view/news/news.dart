import 'package:bucket/view/news/business_news/business_news.dart';
import 'package:bucket/view/news/techcrunch_news/techcrunch_news.dart';
import 'package:bucket/view/news/tesla_news/tesla_news.dart';
import 'package:bucket/view_model/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'apple_news/apple_news.dart';

class News extends StatefulWidget{
  const News({Key? key}): super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
    
  @override 
  Widget build(context){
    final appTheme = Provider.of<AppTheme>(context);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: appTheme.backgroundtheme(),
        appBar: AppBar(
          backgroundColor: appTheme.appBarTheme(),
          elevation: 0.0,
          title: const Text("News",
          style: TextStyle(
            color: Colors.white
          )
        ),
        bottom: const TabBar(
          indicatorColor: Colors.white,
          indicatorWeight: 3.0,
          isScrollable: true,
          tabs: [
            Tab(
              text: "Apple"),
            Tab(
              text: "Tech crunch"),
            Tab(
              text: "Tesla"),
            Tab(
              text: "Business",
            )
          ],
        )
      ),
      body: const TabBarView(
        children: [
           AppleNews(),
           TeslaNews(),
           TechCrunchNews(),
           BusinessNews()
        ],
      ),
      ),
    );
  }



}


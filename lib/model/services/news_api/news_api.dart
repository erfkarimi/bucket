import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../../news_model/news_model.dart';

class NewsApi{
  var client = http.Client();
  var newsModel = NewsModel();

  Future<NewsModel> getAppleNews() async{
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    String currentDate = formatter.format(now);
 
    try{
    var response = await client.get(Uri.parse('https://newsapi.org/v2/everything?q=apple&from=$currentDate&to=$currentDate&sortBy=popularity&apiKey=API_KEY'));
    if(response.statusCode == 200){
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);

      newsModel = NewsModel.fromJson(jsonMap);
    }
    } catch(error){
      return newsModel;
    }
    return newsModel;

    
  }

  Future<NewsModel> getTechCrunchNews() async{
    try{
    var response = await client.get(Uri.parse('https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=API_KEY'));
    if(response.statusCode == 200){
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);

      newsModel = NewsModel.fromJson(jsonMap);
    }
    } catch(error){
      return newsModel;
    }
    return newsModel;

    
  }
  
  Future<NewsModel> getTeslaNews() async{
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    String currentDate = formatter.format(now);
    
    try{
    var response = await client.get(Uri.parse('https://newsapi.org/v2/everything?q=tesla&from=$currentDate&sortBy=publishedAt&apiKey=API_KEY'));
    if(response.statusCode == 200){
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);

      newsModel = NewsModel.fromJson(jsonMap);
    }
    } catch(error){
      return newsModel;
    }
    return newsModel;

  }

  Future<NewsModel> getTopBusinessHeadline() async{
    try{
    var response = await client.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=API_KEY'));
    if(response.statusCode == 200){
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);

      newsModel = NewsModel.fromJson(jsonMap);
    }
    } catch(error){
      return newsModel;
    }
    return newsModel;

  }
  
  
}
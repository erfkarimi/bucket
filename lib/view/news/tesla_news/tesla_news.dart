import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../model/news_model/news_model.dart';
import '../../../model/services/news_api/news_api.dart';
import '../../../view_model/app_theme.dart';

class TeslaNews extends StatefulWidget {
  const TeslaNews({ Key? key }) : super(key: key);

  @override
  State<TeslaNews> createState() => _TeslaNewsState();
}

class _TeslaNewsState extends State<TeslaNews> {
  late Future<NewsModel> _teslaNewsModel;
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<AppTheme>(context);
    _teslaNewsModel = NewsApi().getTeslaNews();
    return FutureBuilder<NewsModel>(
          future: _teslaNewsModel,
          builder: (context, snapshot){
            if(snapshot.hasData){
                return ListView.builder(
                 itemCount: snapshot.data!.articles.length,
                  itemBuilder: (context,  index){
                    var article  = snapshot.data!.articles[index];
                    return GestureDetector(
                      onTap: (){
                        newsDescription(article.description.toString(),
                          article.url.toString());
                      },
                      child: Container(
                                height: 370,
                                margin: const EdgeInsets.all(15),
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color:appTheme.buttonTheme(),
                                   borderRadius: BorderRadius.circular(25)
                                    ),
                                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                        ),
                          child: Image.network(article.urlToImage.toString(),
                                  fit: BoxFit.cover,),
                        ),
                        const SizedBox(height: 20),
                        Flexible(
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(article.title.toString(),
                                  style: TextStyle(
                                    color: appTheme.buttonTitleTheme(),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold
                                  ),),
                              ),
                            ],
                          ),
                        ),
                      ],
                                    ),
                                  ),
                    );
              }
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            ); 
            
          },
        );
  }

  void newsDescription(String description, String newsUrl){
    final appTheme = Provider.of<AppTheme>(context, listen: false);
    showDialog(context: context,
     builder: (context){
       return AlertDialog(
         backgroundColor: appTheme.buttonTheme(),
         title: Text("Description",
         style: TextStyle(
           color: appTheme.buttonTitleTheme()
         )),
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(25)
         ),
         content: Text(description,
         maxLines: 10,
         style: TextStyle(
           color: appTheme.buttonTitleTheme()
         ),
         ),
           actions: [
             TextButton(
              child: const Text("OK"),
              onPressed: (){
                Navigator.pop(context);
              }),
              TextButton(
              child: const Text("Go to website"),
              onPressed: (){
                openWebsite(newsUrl);
              })
           ],
       );
     });
  }    
}

Future<void> openWebsite(newsUrl) async{
    try{
      await launch(newsUrl);
    } catch(error){
      showToastMessage(error);
      }
}

void showToastMessage(Object error){
  Fluttertoast.showToast(
        msg: "$error",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey.shade400,
        textColor: Colors.white,
        fontSize: 16.0
    );
}
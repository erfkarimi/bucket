class NewsModel {
    NewsModel({
        this.articles = const [],
    });
    
    List<Article> articles;

    factory NewsModel.fromJson(Map<String, dynamic> json){
      return NewsModel(
        articles: List<Article>
        .from(json["articles"]
        .map((element) => Article.fromJson(element))),
        );
    } 

}

class Article {
    Article({
        this.title,
        this.description,
        this.url,
        this.urlToImage,
    });

    String? title;
    String? description;
    String? url;
    String? urlToImage;

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
    );

}



class HomeModel{
  String? quote;
  String? author;
  String? cate;
  bool? isLike;

  HomeModel({this.quote, this.author, this.cate,this.isLike});
  List<HomeModel> HomeModelList = [];

  factory HomeModel.fromquote(Map m1)
  {
    return HomeModel(quote: m1['quote'],author: m1['author'],cate: m1['cate'],isLike: m1['like']);
  }

  HomeModel.toList(List l1)
  {
    for(int i=0; i<l1.length; i++)
      {
        HomeModelList.add(HomeModel.fromquote(l1[i]));
      }
  }
}
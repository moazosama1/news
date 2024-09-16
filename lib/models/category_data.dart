import 'dart:ui';
// business entertainment general health science sports technology
class CategoryData {
  String name;
  String nameImage;
  Color color;
  String id;
  CategoryData({
    required this.name ,
    required this.id ,
    required this.nameImage ,
    required this.color ,
  });
   static List<CategoryData> category = [
    CategoryData(
        id: "sports",
        nameImage: "assets/image/ball.png",
        color:const Color(0xffC91C22),
        name: "Sports"),
    CategoryData(
        id: "general",
        nameImage: "assets/image/Politics.png",
        color:const Color(0xff003E90),
        name: "General"),
    CategoryData(
      id: "health",
        nameImage: "assets/image/health.png",
        color:const Color(0xffED1E79),
        name: "Health"),
    CategoryData(
        id: "business",
        nameImage: "assets/image/bussines.png",
        color:const Color(0xffCF7E48),
        name: "business"),
    CategoryData(
      id: "entertainment",
        nameImage: "assets/image/environment.png",
        color:const Color(0xffF2D352),
        name: "Environment"),
    CategoryData(
      id: "science",
        nameImage: "assets/image/science.png",
        color:const Color(0xff4882CF),
        name: "Science"),
  ];
}

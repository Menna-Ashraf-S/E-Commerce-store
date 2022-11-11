import 'rating.dart';
class ProductsData{


late int id;
late double price;
late String title ;
late String description;
late String category;
late String image;
late Rating rating;


ProductsData({

required this.id,
required this.price,
required this.title,
required this.description,
required this.category,
required this.image,
required this.rating

});

ProductsData.fromMap(Map<String,dynamic>map)
{
this.id=map['id'] as int;

this.title=map['title'] as String;

this.price= double .parse(map['price'].toString()  );

this.description=map['description'] as String;

this.category=map['category'] as String;

this.image=map['image'] as String;


this.rating=Rating.fromMap(map['rating']);


}


Map<String,dynamic> toMap()
{

Map <String,dynamic> map={

'id': this.id,
'price':this.price,
'title':this.title,
'description': this.description,
'category':this.category,
'image':this.image,
'rating':this.rating.toMap()


};

return map;







}





}
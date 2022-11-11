import 'dart:convert';
import 'package:http/http.dart ';
import 'package:flutter_pro/Model_products/products.dart';



class Api_products{

late String category;

 void categorys( String category2)
 {
    category=category2;
 }



  Future<List<ProductsData>> my_api ()

async {
   Response req= await get(Uri.parse("https://fakestoreapi.com/products/category/${category}"));
  


  if (req.statusCode==200)
  {    
   
    
    

   return  (json.decode(req.body) as List).map((e) => ProductsData.fromMap(e)).toList();
   

 
 
  
  }
  else
  throw('Request fail');








}
}






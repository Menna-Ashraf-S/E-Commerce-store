import 'package:flutter/material.dart';
import 'package:flutter_pro/pages/details.dart';
import 'package:flutter_pro/pages/detailsWO.dart';
import 'package:flutter_pro/pages/detailsWS.dart';
import 'package:flutter_pro/pages/products.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
       initialRoute: '/products',
      routes: <String,WidgetBuilder>{
        '/' :(context) => Home() ,
        '/products' :(context) =>Products() ,
        '/details' :(context) => Details(),
        '/detailsWO' :(context) => DetailsWO(), 
        '/detailsWS' :(context) => DetailsWS(),
        }
    );
  }
}

class Home  extends StatefulWidget {
 
  @override
  _HomeState  createState() => _HomeState();
  
}


class _HomeState extends State < Home > {


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: null 
    );

  }
  
  }
  

  
	
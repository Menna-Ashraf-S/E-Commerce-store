import 'package:flutter/material.dart';
import 'package:flutter_pro/local/navigat_details.dart';
import 'package:rate/rate.dart';


class DetailsWO  extends StatefulWidget {
 
  @override
  _HomeState  createState() => _HomeState();
  
}


class _HomeState extends State < DetailsWO > {

int quantity = 1 ;
  

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Navigat_Details ;

    return Scaffold(
     appBar:  AppBar(
      leading: const BackButton(
        color: Colors.black,
      ),
            title: Text('${args.category}\'s details',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold , color: Colors.black,
              fontSize: 22),
            
            
            
            ) ,
            centerTitle: true,
            backgroundColor: Colors.grey[300],
              shape: 
              RoundedRectangleBorder( 
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(28),
      ),
    ),
     toolbarHeight: 60,

     actions: [
      IconButton(
        icon: Icon(
          Icons.shopping_cart_outlined , size: 25, color: Colors.black,
          ),
        onPressed: (){}, ),
      IconButton(
        icon: Icon(
          Icons.favorite , size: 28, color: Colors.red[600]),
        onPressed: (){}, ),
      SizedBox(width: 5), 
     ],
          ),
      
      body:  SingleChildScrollView (
        child: Container(
          child: Column(
            children:<Widget> [
              SizedBox(height: 30,),
              Padding(
                        padding: const EdgeInsets.only(left: 15 , right: 15),
                        child: Container( 
                          width: double.infinity, height: 210,
                          decoration: BoxDecoration( 
                            border: Border.all(width: 1 , color: Color.fromARGB(255, 150, 154, 156)),
                            borderRadius: BorderRadius.all(Radius.circular(25), 
                          ),
                          ),
                          child: ClipRRect(
                        child: Image.network('${args.image}',fit: BoxFit.fill,),
                      ),  
                        ),
                      ),
              SizedBox(height: 25,),
              
              Padding(
                padding: const EdgeInsets.only(left: 22 , right: 15),
                child: Container(
                  width: double.infinity,
                  child: Text('${args.title}',
                  style: TextStyle(
                    fontSize: 25 , fontWeight: FontWeight.w800 ,color: Color.fromARGB(255, 28, 27, 27) ,
                  ),
                  ),
                ),
              ),
              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.only(left: 75 , right: 75),
                child: Divider(
                  thickness: 1,
                ),
              ),

              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: 
                  Row(
                    children: <Widget>[
                      Text('${args.price} \$ ' ,
                      style: TextStyle(
                        fontSize: 30 , fontWeight: FontWeight.bold , color: Color.fromARGB(255, 28, 27, 27) ,
                      ),
                      ),

                        SizedBox(width: MediaQuery.of(context).size.width*0.35), 
                       GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (quantity<=1)
                                      {
                                        quantity = 1;
                                      }
                                        else
                                      {
                                        quantity -- ;
                                      }
                                      
                                    });
                                  },
                                  child: Container( width: 30, height: 30,
                                  decoration: BoxDecoration(color: Color.fromARGB(255, 169, 171, 172), 
                                  borderRadius: BorderRadius.all(Radius.circular(5),
                                  ),
                                  ),
                                    child: Icon(Icons.remove , size: 18, color: Colors.white, ),
                                    ),
                                    ),

                                    SizedBox(width: 10,),
                              
                      
                              
                                 Text('${quantity}',
                                 style: TextStyle(
                                  fontSize: 18 ,  color: Colors.black, fontWeight: FontWeight.bold
                                ),
                                ),
                              
                              SizedBox(width: 10,),

                               GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      quantity ++ ;
                                    });
                                  },
                                  child: Container( width: 30, height: 30,
                                  decoration: BoxDecoration(color: Color.fromARGB(255, 169, 171, 172),
                                   borderRadius: BorderRadius.all(Radius.circular(5),
                                  ),
                                  ),
                                    child: Icon(Icons.add , size: 18, color: Colors.white, ),
                                    ),
                                    ),
                    ],
                  ),
                
              ),

             

              SizedBox(height: 8,),

              Padding(
                padding: const EdgeInsets.only(left: 15 , right: 15),
                child: Row(
                  children: <Widget> [
                    Rate(
                              iconSize: 30,
                              color: Colors.red,
                              allowHalf: true,
                              allowClear: true,
                              initialValue: args.rating ,
                              readOnly: true ,
                              ),
                    SizedBox(width: 5,),
                    Text('${args.count} reviews' , 
                    style: TextStyle(
                      fontSize: 16 , fontWeight: FontWeight.w500 , color:  Color.fromARGB(255, 146, 148, 150),
                    ),
                    ),
                  ],
                ),
                
              ),

               SizedBox(height: 5,),

              Padding(
                padding: const EdgeInsets.only(left: 55 , right: 55),
                child: Divider(
                  thickness: 1,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 15 , right: 15 , top: 15),
                child: Container(
                  width: double.infinity,
                  child: Text('Description: ',
                  style: TextStyle(
                    fontSize: 20 , color: Color.fromARGB(255, 28, 27, 27) ,fontWeight: FontWeight.w500 ,
                  ),
                  ),
                ),
              ),
              SizedBox(height: 10,), 
              Padding(
                padding: const EdgeInsets.only(left: 10 ,right: 10),
                child: Container(
                  width: double.infinity,
                  child: Text(args.description ,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18 , fontWeight: FontWeight.w500 ,color: Color.fromARGB(255, 105, 107, 108),
                  ),
                  ),
                ),
              ),
              SizedBox(height: 15,),

              Padding(
                padding: const EdgeInsets.only(left: 30 ,right: 30),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    child: 
                    Text ('Add to Cart',
                    style: TextStyle(
                      fontSize: 20 , fontWeight: FontWeight.w500 ,color: Colors.white ,
                    ),
                    ) ,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 169, 171, 172),
                      shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.all(Radius.circular(20),),
                      ),
                       ),
                    onPressed: (){}, ),
                ),
              ),

              SizedBox(height: 30,),

            ],
          ),
        )
        ,)
    );

  }
  
  }
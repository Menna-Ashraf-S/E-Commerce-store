import 'package:flutter/material.dart';
import 'package:flutter_pro/Model_products/products.dart';
import 'package:flutter_pro/local/navigat_details.dart';
import 'package:flutter_pro/network/api.getProducts.dart';


class Products extends StatefulWidget {
  const Products({ Key? key }) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        leading: const BackButton(
        color: Colors.black,
      ),
            title: Text('Products',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold , color: Colors.black,
              fontSize: 30),
            
            
            
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


            body: FutureBuilder<List<ProductsData>>(


              future:  Api_products().my_api() ,
              builder: (context,snapshot)
              
              {
               print(snapshot.data);



               if(!snapshot.hasData){
        return Center(child: CircularProgressIndicator());}

        else{

       



          return  GridView.builder(
              
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                  mainAxisSpacing: 5 ,
                  crossAxisSpacing: 5 ,
                  childAspectRatio: (0.82 / 1.32) ,
                  
                  
                  ),
                  itemCount:  snapshot.data!.length,
                  
                
                    itemBuilder: (context,index)
                    {
                         ProductsData product = snapshot.data![index];
              
                    return GestureDetector(
              
                             
                              child: Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                   
                                   // mainAxisSize: MainAxisSize.min,
                                    
                                    
                                    children: [
                                     
                                     Container(
                                      width: 175,
                                      height: 190 ,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey ,width: 1 ,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                          ),
                    
                                      child: ClipRRect( borderRadius: BorderRadius.circular (20),
                                        child: Image.network('${product.image}' ,
                                       width: 175,height: 190 ,),
                                      )
                                     ),
                                     
                                        
                                
                                     Padding(
                                       padding: const EdgeInsets.all(5.0),
                                       child: Container( width: 175 , height: 51,
                                         child: Text(product.title,
                                         textAlign: TextAlign.center,
                                         style: TextStyle (
                                             
                                           
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Color.fromARGB(255, 150, 154, 156),
                                            
                                                                 
                                         ),
                                         
                                         
                                         ),
                                       ),
                                     ),
                                     
                                              
                                   Text('${product.price} \$ ',
                                   textAlign: TextAlign.center,
                                       style: TextStyle (
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.black
                                       ),
                                       ),       
                                              
                                    ]),
                                ),
                              ),
                            
                          
              
                                    
                       onTap: ()  async{
                            if (product.category == 'electronics'){
                              Navigator.pushNamed(context, '/detailsWO',
                            arguments: Navigat_Details(image: product.image, title: product.title, price: product.price ,
                             description: product.description , rating: product.rating.rate , count: product.rating.count,
                             category: product.category) );
                            }
                            else if (product.category == 'jewelery'){
                              Navigator.pushNamed(context, '/detailsWS',
                            arguments: Navigat_Details(image: product.image, title: product.title, price: product.price ,
                             description: product.description , rating: product.rating.rate , count: product.rating.count,
                             category: product.category) );
                            }
                            else {
                              Navigator.pushNamed(context, '/details',
                            arguments: Navigat_Details(image: product.image, title: product.title, price: product.price ,
                             description: product.description , rating: product.rating.rate , count: product.rating.count,
                             category: product.category) );
                            }
                        
                        setState(() {
                          
                        });
                       },
              
                      );
              
              
                      
              
                       
              
              
              
              
                      
                    }
                     
                      
                      
                      );
              
               
              }
              }
            
              
              
              
              
               ),
              
      
    );
  }
}


    
                 
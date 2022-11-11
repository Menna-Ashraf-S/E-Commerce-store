import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int num = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Cart',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        elevation: 0,
      ),
      body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: Card(
                child: ListTile(
                  leading: SizedBox(
                      // height: 100,
                      width: 70,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          'https://www.shutterstock.com/image-photo/stability-cushion-running-shoes-new-600w-1958445436.jpg',
                          fit: BoxFit.cover,
                          height: 200,
                        ),
                      )),
                  title: const Padding(
                    padding: EdgeInsets.all(
                      10.0,
                    ),
                    child: Text(
                      'Shoes',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(
                      8.0,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Text(
                              "\$500",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              'QTY:',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '$num',
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  trailing: Column(
                    children: [
                      const SizedBox(
                        height: 3,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Container(
                          height: 25,
                          width: 30,
                          color: Colors.black12,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                num++;
                              });
                            },
                            color: Colors.white,
                            icon: const Icon(
                              Icons.add,
                              color: Colors.black,
                              size: 12.5,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Container(
                          height: 25,
                          width: 30,
                          color: Colors.black12,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                num == 1 ? num = 1 : num--;
                              });
                            },
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.black,
                              size: 12.5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

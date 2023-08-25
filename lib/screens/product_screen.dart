import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarkar_groups_assignment/constants/text_styles.dart';
import 'package:sarkar_groups_assignment/global/global.dart';
import 'package:sarkar_groups_assignment/providers/home_screen_category.dart';

class ProductScreen extends StatelessWidget {
  int index;
  ProductScreen({
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var indexProvider = Provider.of<HomeScreenCategory>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              //TODO: shopping cart button
            },
            icon: const Icon(Icons.shopping_bag_outlined),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                
                indexProvider.updateProductScreenImageUrl(0);
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
              ),
            ),
          ],
        ),
        centerTitle: true,
        title: const Text(
          "Details",
          style: appBarTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<HomeScreenCategory>(
              builder: (context, value, child) {
                return Container(
                  height: screenHeight * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Image.asset(
                        imgSubUrls[index][value.productScreenImageUrl],
                        fit: BoxFit.fill,
                      )),
                );
              }
            ),
            Consumer<HomeScreenCategory>(
              builder: (context, value, child) {
                return Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        productHeadline[index],
                        style: TextStyle(
                          fontSize: 36,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Row(
                      children: [
                        
                        const SizedBox(
                          width: 2,
                        ),
                        GestureDetector(
                          onTap: (){
                            value.updateProductScreenImageUrl(0);
                          },
                          child: CircleAvatar(
                            radius: value.productScreenImageUrl == 0 ? 18 : 10,
                            backgroundColor: Colors.grey.shade700,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        GestureDetector(
                          onTap: (){
                            value.updateProductScreenImageUrl(1);
                          },
                          child: CircleAvatar(
                            radius: value.productScreenImageUrl == 1 ? 18 : 10,
                            backgroundColor: Colors.red,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),

                        GestureDetector(
                          onTap: (){
                            value.updateProductScreenImageUrl(2);
                          },
                          child: CircleAvatar(
                            radius: value.productScreenImageUrl == 2 ? 18 : 10,
                            backgroundColor: Colors.green,
                          ),
                        ),
                      ],
                    )),
                  ],
                );
              }
            ),
            Row(
              children: [
                const Icon(
                  Icons.star_half,
                  color: Colors.yellow,
                ),
                Text(
                  "${stars[index]}",
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  " ${reviews[index]} reviews",
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            Consumer<HomeScreenCategory>(
              builder: (context, value, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color:
                            value.sizeIndex == 0 ? Colors.black : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextButton(
                        onPressed: () {
                          value.changeSizeIndex(0);
                        },
                        child: Text(
                          "S",
                          style: TextStyle(
                              color: value.sizeIndex == 0
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color:
                            value.sizeIndex == 1 ? Colors.black : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextButton(
                        onPressed: () {
                          value.changeSizeIndex(1);
                        },
                        child: Text(
                          "M",
                          style: TextStyle(
                              color: value.sizeIndex == 1
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color:
                            value.sizeIndex == 2 ? Colors.black : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextButton(
                        onPressed: () {
                          value.changeSizeIndex(2);
                        },
                        child: Text(
                          "L",
                          style: TextStyle(
                              color: value.sizeIndex == 2
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color:
                            value.sizeIndex == 3 ? Colors.black : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextButton(
                        onPressed: () {
                          value.changeSizeIndex(3);
                        },
                        child: Text(
                          "XL",
                          style: TextStyle(
                              color: value.sizeIndex == 3
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Rs. ${prices[index]}",
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Container(
                  //height: 30,
                  padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_bag_outlined, color: Colors.white,),
                      Text("Add to Bag", style: TextStyle(color: Colors.white, ),)
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

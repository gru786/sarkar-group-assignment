import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarkar_groups_assignment/constants/text_styles.dart';
import 'package:sarkar_groups_assignment/global/global.dart';
import 'package:sarkar_groups_assignment/providers/home_screen_category.dart';
import 'package:sarkar_groups_assignment/screens/product_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              //TODO: search button
            },
            icon: const Icon(Icons.search_sharp),
          ),
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
        leading: const Row(
          children: [
            SizedBox(
              width: 10,
            ),
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage("assets/images/me.jpg"),
            ),
          ],
        ),
        title: const Text(
          "Hi, Gaurav",
          style: appBarTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    const Text(
                      "Explore the ",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "best",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 6,
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "Collections",
                        style: TextStyle(
                            color: Colors.lightGreenAccent,
                            fontSize: 24,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Text(
                      "for you ☺",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Categories",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 1),
            ),
            const SizedBox(
              height: 8,
            ),
            Consumer<HomeScreenCategory>(
              builder: (context, value, child) {
                return Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: value.selectedIndex == 0
                              ? Colors.black
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextButton(
                          onPressed: () {
                            value.changeIndex(0);
                          },
                          child: Text(
                            "All",
                            style: TextStyle(
                                color: value.selectedIndex == 0
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: value.selectedIndex == 1
                              ? Colors.black
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextButton(
                          onPressed: () {
                            value.changeIndex(1);
                          },
                          child: Text(
                            "Men's",
                            style: TextStyle(
                                color: value.selectedIndex == 1
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: value.selectedIndex == 2
                              ? Colors.black
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextButton(
                          onPressed: () {
                            value.changeIndex(2);
                          },
                          child: Text(
                            "Women's",
                            style: TextStyle(
                                color: value.selectedIndex == 2
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: value.selectedIndex == 3
                              ? Colors.black
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextButton(
                          onPressed: () {
                            value.changeIndex(3);
                          },
                          child: Text(
                            "Kids",
                            style: TextStyle(
                                color: value.selectedIndex == 3
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.6,
              child: Consumer<HomeScreenCategory>(
                builder: (context, value, child) {
                  var currentSelectedIndex = value.selectedIndex;
                  if (currentSelectedIndex == 0) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.5),
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (c) => ProductScreen(
                                  index: index,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Card(
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Image.asset(
                                    imgUrls[index],
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                Text(productHeadline[index]),
                                Text(
                                  "Rs. ${prices[index]}",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: 4,
                    );
                  } else if (currentSelectedIndex == 1) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.5),
                      itemBuilder: (_, index) {
                        if (index == 0 || index == 3) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (c) => ProductScreen(
                                    index: index,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Card(
                                    elevation: 4,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Image.asset(
                                      imgUrls[index],
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  Text(productHeadline[index]),
                                  Text(
                                    "Rs. ${prices[index]}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                        else{
                          return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Card(
                                    elevation: 4,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Image.asset(
                                      imgUrls[index],
                                      opacity: AlwaysStoppedAnimation(0.3),
                                      filterQuality: FilterQuality.high,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  Text(productHeadline[index], style: TextStyle(color: Colors.grey.shade300),),
                                  Text(
                                    "Rs. ${prices[index]}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold,color: Colors.grey.shade300),
                                  ),
                                ],
                              ),
                            );
                        }
                      },
                      itemCount: 4,
                    );
                  }
                  else if(currentSelectedIndex == 2){
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.5),
                      itemBuilder: (_, index) {
                        if (index == 1 ) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (c) => ProductScreen(
                                    index: index,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Card(
                                    elevation: 4,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Image.asset(
                                      imgUrls[index],
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  Text(productHeadline[index]),
                                  Text(
                                    "Rs. ${prices[index]}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                        else{
                          return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Card(
                                    elevation: 4,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Image.asset(
                                      imgUrls[index],
                                      opacity: AlwaysStoppedAnimation(0.3),
                                      filterQuality: FilterQuality.high,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  Text(productHeadline[index], style: TextStyle(color: Colors.grey.shade300),),
                                  Text(
                                    "Rs. ${prices[index]}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold,color: Colors.grey.shade300),
                                  ),
                                ],
                              ),
                            );
                        }
                      },
                      itemCount: 4,
                    );
                  }
                  else {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.5),
                      itemBuilder: (_, index) {
                        if (index == 2) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (c) => ProductScreen(
                                    index: index,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Card(
                                    elevation: 4,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Image.asset(
                                      imgUrls[index],
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  Text(productHeadline[index]),
                                  Text(
                                    "Rs. ${prices[index]}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                        else{
                          return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Card(
                                    elevation: 4,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Image.asset(
                                      imgUrls[index],
                                      opacity: AlwaysStoppedAnimation(0.3),
                                      filterQuality: FilterQuality.high,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  Text(productHeadline[index], style: TextStyle(color: Colors.grey.shade300),),
                                  Text(
                                    "Rs. ${prices[index]}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold,color: Colors.grey.shade300),
                                  ),
                                ],
                              ),
                            );
                        }
                      },
                      itemCount: 4,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

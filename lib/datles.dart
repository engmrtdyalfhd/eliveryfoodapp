import 'package:deliveryfoodapp/widget/widget_supper.dart';
import 'package:flutter/material.dart';

class Datles extends StatefulWidget {
  const Datles({super.key});

  @override
  State<Datles> createState() => _DatlesState();
}

class _DatlesState extends State<Datles> {
  int a = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.black,
              ),
            ),
            Image.asset(
              'assets/images/salad2.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 15),

            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mediterranean ",
                      style: AppWidget.semiboldTextFiledStyle(),
                    ),
                    Text(
                      "Chickpea Salad ",
                      style: AppWidget.boldTextFiledStyle(),
                    ),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    if (a > 1) {
                      --a;
                    }

                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.remove, color: Colors.white),
                  ),
                ),
                SizedBox(width: 20),
                Text(a.toString(), style: AppWidget.semiboldTextFiledStyle()),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    ++a;
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Loren ipusm   Mediterranean  Chickpea Salad    Chickpea Salad Chickpea Salad Chickpea Salad Chickpea Salad Chickpea Salad Chickpea Salad Chickpea Salad Chickpea Salad Chickpea Salad Chickpea Salad         ",
              style: AppWidget.LightTextFiledStyle(),
              maxLines: 3,
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Text("Deliver Time", style: AppWidget.semiboldTextFiledStyle()),
                SizedBox(width: 5),
                Icon(Icons.alarm, color: Colors.black54),
                SizedBox(width: 5),
                Text("30 min", style: AppWidget.semiboldTextFiledStyle()),
              ],
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Totel Price ",
                        style: AppWidget.boldTextFiledStyle(),
                      ),
                      Text("\$30 ", style: AppWidget.boldTextFiledStyle()),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Add to Cart",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: "Poppins",
                          ),
                        ),
                        SizedBox(width: 30.0),
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}

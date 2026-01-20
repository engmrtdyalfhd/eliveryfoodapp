import 'package:deliveryfoodapp/datles.dart';
import 'package:deliveryfoodapp/widget/widget_supper.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool icecresam = false, pizza = false, salad = false, burger = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Helloe Sheve", style: AppWidget.boldTextFiledStyle()),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.shopping_cart, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text("Delicise Food", style: AppWidget.HaedlineTextFiledStyle()),
            Text(
              " Descover Get Delicise Food",
              style: AppWidget.LightTextFiledStyle(),
            ),
            SizedBox(height: 30),
            ShowItem(),
            SizedBox(height: 30),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Datles();
                          },
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      padding: EdgeInsets.all(4),
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/images/salad2.png",
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Vaggie Taco House",
                                style: AppWidget.semiboldTextFiledStyle(),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Vaggie Taco House",
                                style: AppWidget.LightTextFiledStyle(),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "\$20.00",
                                style: AppWidget.semiboldTextFiledStyle(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/salad2.png",
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Mac Vige Salad ",
                            style: AppWidget.semiboldTextFiledStyle(),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "spciy with Online ",
                            style: AppWidget.LightTextFiledStyle(),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "\$25",
                            style: AppWidget.semiboldTextFiledStyle(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/salad2.png",
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Vaggie Taco House",
                            style: AppWidget.semiboldTextFiledStyle(),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Vaggie Taco House",
                            style: AppWidget.LightTextFiledStyle(),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "\$20.00",
                            style: AppWidget.semiboldTextFiledStyle(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(right: 20),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/images/salad2.png",
                        height: 120,
                        width: 120,
                      ),
                      SizedBox(width: 20),
                      Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Mediterranean Chickpea Salad",
                              style: AppWidget.semiboldTextFiledStyle(),
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Honey goot Chease",
                              style: AppWidget.LightTextFiledStyle(),
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "\$30.00",
                              style: AppWidget.semiboldTextFiledStyle(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ShowItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            pizza = true;
            icecresam = false;
            salad = false;
            burger = false;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),

            child: Container(
              decoration: BoxDecoration(
                color: pizza ? Colors.orangeAccent : Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                "assets/images/pizza.png",
                height: 50,
                width: 40,
                fit: BoxFit.cover,
                color: pizza ? Colors.white : Colors.orangeAccent,
              ),
            ),
          ),
        ),

        GestureDetector(
          onTap: () {
            pizza = false;
            icecresam = false;
            salad = true;
            burger = false;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),

            child: Container(
              decoration: BoxDecoration(
                color: salad ? Colors.orangeAccent : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                "assets/images/salad.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: salad ? Colors.white : Colors.orangeAccent,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            pizza = false;
            icecresam = false;
            salad = false;
            burger = true;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),

            child: Container(
              decoration: BoxDecoration(
                color: burger ? Colors.orangeAccent : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                "assets/images/burger.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: burger ? Colors.white : Colors.orangeAccent,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            pizza = false;
            icecresam = true;
            salad = false;
            burger = false;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),

            child: Container(
              decoration: BoxDecoration(
                color: icecresam ? Colors.orangeAccent : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(10),
              child: Image.asset(
                "assets/images/ice-cream.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: icecresam ? Colors.white : Colors.orangeAccent,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

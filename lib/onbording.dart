import 'package:deliveryfoodapp/signup.dart';
import 'package:deliveryfoodapp/widget/content_model.dart';
import 'package:deliveryfoodapp/widget/widget_supper.dart';
import 'package:flutter/material.dart';

class Onbording extends StatefulWidget {
  const Onbording({super.key});

  @override
  State<Onbording> createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  int currentIndex = 0;
  late PageController _controller;

  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contains.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: Column(
                    children: [
                      Image.asset(
                        contains[i].image,
                        height: 450,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 30),
                      Text(
                        contains[i].title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: "Poppins1",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        contains[i].description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Poppins1",
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contains.length,
                (index) => buildDot(index, context),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (currentIndex == contains.length - 1) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Signup()),
                );
              }
              _controller.nextPage(
                duration: Duration(microseconds: 100),
                curve: Curves.bounceIn,
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              height: 60,
              margin: EdgeInsets.all(40),
              width: double.infinity,
              child: Center(
                child: Text(
                  currentIndex == contains.length - 1 ? "Get Started" : "Next",

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: currentIndex == index ? Colors.deepOrange : Colors.black38,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}

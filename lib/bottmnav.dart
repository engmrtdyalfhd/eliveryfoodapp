import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:deliveryfoodapp/home.dart';
import 'package:deliveryfoodapp/order.dart';
import 'package:deliveryfoodapp/profile.dart';
import 'package:deliveryfoodapp/wallet.dart';
import 'package:flutter/material.dart';

class Bottmnav extends StatefulWidget {
  const Bottmnav({super.key});

  @override
  State<Bottmnav> createState() => _BottmnavState();
}

class _BottmnavState extends State<Bottmnav> {
  int currentTabIndex = 0;
  late List<Widget> pages;
  late Widget currentPage;
  late Home homePage;
  late Profile profile;
  late Wallet wallet;
  late Order order;

  @override
  void initState() {
    super.initState();
    homePage = const Home();
    profile = const Profile();
    wallet = const Wallet();
    order = const Order();
    pages = [homePage, wallet, order, profile];
    // currentPage = homePage;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: Colors.white,
        color: Colors.black,
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
            // currentPage = pages[index];
          });
        },
        items: const [
          Icon(Icons.home_outlined, size: 30, color: Colors.white),
          Icon(Icons.account_balance_wallet, size: 30, color: Colors.white),
          Icon(Icons.shopping_bag, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
      ),
      body: pages[currentTabIndex],
    );
  }
}

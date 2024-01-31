import 'package:flutter/material.dart';
import 'package:interview1/features/cart/view/cart_page.dart';
import 'package:interview1/features/history/view/history_page.dart';
import 'package:interview1/features/home/view/home_page.dart';

class NavWidget extends StatelessWidget {
  const NavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "DOG SHOP",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                  fontWeight: FontWeight.w700),
            ),
          ),
          backgroundColor: Colors.deepPurple[800],
          bottom: const TabBar(
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            tabs: [
              Tab(text: "Home"),
              Tab(text: "Cart"),
              Tab(text: "History"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            HomePage(),
            CartPage(),
            HistoryPage(),
          ],
        ),
      ),
    );
  }
}

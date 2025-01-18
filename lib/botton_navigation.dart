import 'package:flutter/material.dart';
import 'package:product_api/cart.dart';
import 'package:product_api/home.dart';
import 'package:product_api/profile.dart';


class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectIndex=0;
  // var listPage=[Home(),Cart(),ProfilePage()];
  var listPage = [
    Home(),
    Cart(),
    ProfilePage(username: '', email: ''), // Example default values
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listPage[_selectIndex],
       bottomNavigationBar: BottomNavigationBar(
         onTap: (value){
           setState(() {
             _selectIndex=value;
           });
         },
         items: const [
           BottomNavigationBarItem(
               icon: Icon(Icons.home),
             label: "Home"
           ),
           BottomNavigationBarItem(
               icon: Icon(Icons.shopping_cart),
               label: "Card"
           ),
           BottomNavigationBarItem(
               icon: Icon(Icons.person),
               label: "Profile"
           ),
         ],
         currentIndex: _selectIndex,
         unselectedItemColor: Colors.grey,
         selectedItemColor: Colors.blue,type: BottomNavigationBarType.fixed,
       ),
    );
  }
}

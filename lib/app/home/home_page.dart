import 'package:flutter/material.dart';
import 'package:i_need/app/add/add_page_content.dart';
import 'package:i_need/app/login/user_page/user_page.dart';
import 'package:i_need/app/shopping_list_page/shopping_list_page_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('iNeed'),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const UserProfile(),
                ),
              );
            },
            icon: const Icon(
              Icons.person,
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_rounded),
            label: 'Shop List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Add Product',
          ),
        ],
      ),
      body: Builder(builder: (context) {
        if (currentIndex == 1) {
          return AddPage(
            onSave: () {
              setState(
                () {
                  currentIndex = 0;
                },
              );
            },
          );
        }
        return const ShoppingListPageContent();
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:i_need/app/Add/add_page.dart';
import 'package:i_need/app/login/user_page/user_page.dart';

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
            label: 'HomePage',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'AddPage',
          ),
        ],
      ),
      body: Builder(builder: (context) {
        if (currentIndex == 1) {
          return const AddPage();
        }
        return StreamBuilder<Object>(
          stream: null,
          builder: (context, snapshot) {
            return const Center(
              child: Text('HomePage'),
            );
          }
        );
      }),
    );
  }
}

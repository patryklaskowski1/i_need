import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  var productName = '';
  var shopName = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: 'Podaj nazwę produktu',
            ),
            onChanged: (newValue) {
              setState(
                () {
                  productName = newValue;
                },
              );
            },
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Podaj nazwę/rodzaj sklepu',
            ),
            onChanged: (newValue) {
              setState(
                () {
                  shopName = newValue;
                },
              );
            },
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Dodaj'),
          ),
        ],
      ),
    );
  }
}

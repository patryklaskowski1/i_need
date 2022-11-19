import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({
    required this.onSave,
    Key? key,
  }) : super(key: key);

  final Function onSave;

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  var productName = '';
  var shopName = '';
  String categoryName = 'Inne';

  final List<String> listCategorys = [
    'Pieczywo',
    'Wędliny',
    'Owoce',
    'Warzywa',
    'Nabiał',
    'Inne',
    'Słodycze',
    'Przekąski',
    'Napoje',
    'Chemia',
    'Elektronika',
    'Części do auta',
    'Materiały budowlane',
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
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
            const SizedBox(
              height: 30,
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
            const SizedBox(
              height: 30,
            ),
            DropdownButton<String>(
              focusColor: Colors.white,
              value: categoryName,
              style: const TextStyle(color: Colors.white),
              iconEnabledColor: Colors.black,
              items:
                  listCategorys.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 42,
                    ),
                    child: Text(
                      value,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                );
              }).toList(),
              hint: const Text(
                "Wybierz kategorie",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
              onChanged: (String? value) {
                setState(() {
                  categoryName = value!;
                });
              },
            ),
            const SizedBox(
              height: 36,
            ),
            ElevatedButton(
              onPressed: productName.isEmpty || shopName.isEmpty
                  ? null
                  : () {
                      FirebaseFirestore.instance.collection('shoppingList').add(
                        {
                          'product': productName,
                          'shopName': shopName,
                          'category': categoryName,
                        },
                      );
                      widget.onSave();
                    },
              child: const Text('Dodaj'),
            ),
          ],
        ),
      ),
    );
  }
}

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
  var categoryName = '';

  final List<String> listCategorys = ['pieczywo', 'warzywa', 'owoce', 'napoje'];

  String dropdownValue = 'pieczywo';

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
              height: 18,
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
              height: 18,
            ),
            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? value) {
                setState(() {
                  categoryName = value!;
                });
              },
              items:
                  listCategorys.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 26,
            ),
            ElevatedButton(
              onPressed: productName.isEmpty ||
                      shopName.isEmpty ||
                      categoryName.isEmpty
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

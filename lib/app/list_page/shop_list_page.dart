
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShopListPage extends StatelessWidget {
  const ShopListPage({
    Key? key,
    required this.documents,
  }) : super(key: key);

  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (final document in documents) ...[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(document['product']),
                Text(document['shopName']),
                const Text('Kategoria'),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_need/app/shopping_list_page/cubit/shopping_list_page_cubit.dart';

class ShoppingListPageContent extends StatelessWidget {
  const ShoppingListPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShoppingListPageCubit()..start(),
      child: BlocBuilder<ShoppingListPageCubit, ShoppingListPageState>(
        builder: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            return Center(
              child: Text('Someting went wrong ${state.errorMessage}!'),
            );
          }
          if (state.isLoading == true) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final documents = state.documents;

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
                      Text(document['category']),
                    ],
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}

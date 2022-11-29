part of 'shopping_list_page_cubit.dart';


class ShoppingListPageState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final bool isLoading;
  final String errorMessage;

  const ShoppingListPageState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}

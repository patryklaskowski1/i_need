import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'shopping_list_page_state.dart';

class ShoppingListPageCubit extends Cubit<ShoppingListPageState> {
  ShoppingListPageCubit()
      : super(
          const ShoppingListPageState(
            documents: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const ShoppingListPageState(
        documents: [],
        errorMessage: '',
        isLoading: true,
      ),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection('shoppingList')
        .snapshots()
        .listen((data) {
      emit(
        ShoppingListPageState(
          documents: data.docs,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError(
        (error) {
          emit(
            ShoppingListPageState(
              documents: const [],
              isLoading: false,
              errorMessage: error.toString(),
            ),
          );
        },
      );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}

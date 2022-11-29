import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'add_page_state.dart';

class AddPageCubit extends Cubit<AddPageState> {
  AddPageCubit() : super(const AddPageState());

  StreamSubscription? _streamSubscription;
  Future<void> add(
    String product,
    String shopName,
    String category,
  ) async {
    try {
      _streamSubscription =
          (await FirebaseFirestore.instance.collection('shoppingList').add(
        {
          'product': product,
          'shopName': shopName,
          'category': category,
        },
      )) as StreamSubscription?;
      emit(
        const AddPageState(
          saved: true,
        ),
      );
    } catch (error) {
      emit(
        AddPageState(
          errorMessage: error.toString(),
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}

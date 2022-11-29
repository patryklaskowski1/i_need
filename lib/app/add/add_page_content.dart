import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_need/app/add/cubit/add_page_cubit.dart';

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
  String? _product;
  String? _shopName;
  String? _category;

  List<String> listOfCategory = [
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
    return BlocProvider(
      create: (context) => AddPageCubit(),
      child: BlocListener<AddPageCubit, AddPageState>(
        listener: (context, state) {
          if (state.saved) {
            Navigator.of(context).pop();
          }
          if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: BlocBuilder<AddPageCubit, AddPageState>(
          builder: (context, state) {
            if (state.errorMessage.isNotEmpty) {
              return Center(
                child: Text('Someting went wrong ${state.errorMessage}!'),
              );
            }

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
                            _product = newValue;
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
                            _shopName = newValue;
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    DropdownButton<String>(
                      focusColor: Colors.white,
                      value: _category,
                      style: const TextStyle(color: Colors.white),
                      iconEnabledColor: Colors.black,
                      items: listOfCategory
                          .map<DropdownMenuItem<String>>((String value) {
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
                        "Choose an category",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      onChanged: (newValue) {
                        setState(
                          () {
                            _category = newValue;
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    ElevatedButton(
                      onPressed: _product == null || _shopName == null
                          ? null
                          : () {
                              context.read<AddPageCubit>().add(
                                    _product!,
                                    _shopName!,
                                    _category!,
                                  );
                              widget.onSave();
                            },
                      child: const Text('Dodaj'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

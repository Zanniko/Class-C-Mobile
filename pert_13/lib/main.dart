import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pert_13/bloc/item_bloc.dart';
import 'package:pert_13/cubit/counter_cubit.dart';
import 'package:pert_13/model/item_repository.dart';
import 'package:pert_13/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ItemRepository itemRepository = FakeItemRepository();
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CounterCubit(),
          ),
          BlocProvider(
            create: (context) => ItemBloc(repository: itemRepository),
          ),
        ],
        child: HomePage(),
      )
    );
  }
}

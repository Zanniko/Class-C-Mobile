import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pert_13/bloc/item_bloc.dart';
import 'package:pert_13/bloc/item_event.dart';
import 'package:pert_13/bloc/item_state.dart';
import 'package:pert_13/cubit/counter_cubit.dart';
import 'package:pert_13/cubit/counter_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bloc and Cubit Example')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Card(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'counter (cubit)',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      BlocBuilder<CounterCubit, CounterState>(
                        builder: (context, state) {
                          return Text(
                            '${state.count}',
                            style: TextStyle(fontSize: 36),
                          );
                        },
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            // onPressed: () => context.read<CounterBloc>().add(DecrementEvent()),
                            onPressed:
                                () => context.read<CounterCubit>().decrement(),
                            child: Text('-'),
                          ),
                          ElevatedButton(
                            // onPressed: () => context.read<CounterBloc>().add(IncrementEvent()),
                            onPressed:
                                () => context.read<CounterCubit>().increment(),
                            child: Text('+'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Card(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        'Item List(BLoC)',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          context.read<ItemBloc>().add(LoadItemsEvent());
                        },
                        child: Text('Load Items'),
                      ),
                      SizedBox(height: 20),
                      BlocBuilder<ItemBloc, ItemState>(
                        builder: (context, state) {
                          if (state is ItemsInitial) {
                            return Text('press the button to load items');
                          } else if (state is ItemsLoading) {
                            return CircularProgressIndicator();
                          } else if (state is ItemsLoaded) {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.items.length,
                              itemBuilder: (context, index) {
                                final item = state.items[index];
                                return ListTile(
                                  leading: CircleAvatar(
                                    child: Text('${item.id}'),
                                  ),
                                  title: Text(item.name),
                                );
                              },
                            );
                          } else if (state is ItemsError) {
                            return Text('Error : ${state.message}');
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

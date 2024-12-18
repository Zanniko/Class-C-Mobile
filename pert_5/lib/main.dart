import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoProvider extends ChangeNotifier{
  final List<String> _todos = [];

  List<String> get todos => _todos;

  void addTodo(String todo){
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodoAt(int index){
    todos.removeAt(index);
    notifyListeners();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TodoList',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TodoScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final todoProvider = Provider.of<TodoProvider>(context);


    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple ToDoList"),
        backgroundColor: Colors.blue
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Enter a todo',
                      border: OutlineInputBorder()
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                ElevatedButton(
                  onPressed: () {
                    if(_controller.text.isNotEmpty){
                      todoProvider.addTodo(_controller.text);
                      _controller.clear();
                    }
                  },
                  child: const Text("Add"),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: todoProvider.todos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(todoProvider.todos[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red,),
                      onPressed: () {
                        todoProvider.removeTodoAt(index);
                      },
                    )
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}





















//demo stateful widget counter

// //statefull widget
// class CounterPage extends StatefulWidget {
//   const CounterPage({super.key});

//   @override
//   State<CounterPage> createState() => _CounterPageState();
// }

// class _CounterPageState extends State<CounterPage> {
//   int _counter = 0;

//   void _increment(){
//     setState(() {
//       _counter++;
//     });
//   }

//   //init state dan dispose bisa di overrride
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Stateful Widget Showcase"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("button has been pressed $_counter times"),
//             ElevatedButton(
//               onPressed: _increment,
//               child: const Text("press this button to increase counter")
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
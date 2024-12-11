import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // lakukan hot reload bisa lewat terminal r atau kalau lewat debug ctrl+s
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pertemuan 4',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
    
  }
}

// kalau ingin salah satu widget this show hanya boleh satu di uncomment


// widget ke 1
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Home Page",
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//           ),
//         ),
//         backgroundColor: Colors.blue,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 //shift + alt + down arrow
//                 Container(
//                   color: Colors.red,
//                   width: 100.0,
//                   height: 60.0,
//                 ),
//                 Container(
//                   color: Colors.blue,
//                   width: 100.0,
//                   height: 60.0,
//                 ),
//                 Container(
//                   color: Colors.green,
//                   width: 100.0,
//                   height: 60.0,
//                 )
//               ],
//             ),
//             const SizedBox(height: 40.0,),
//             const Text("this is column widget that contain row widget")
//           ],
//         ),
//       ),
//     );
//   }
// }


//widget ke dua
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Page",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(100.0),
            width: 600,
            color: Colors.green,
            child: const Text(
              "this is a text inside a container",
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ),
        ),
      ),
    );
  }
}

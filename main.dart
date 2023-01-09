
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.dark,
    ),
    home: const MyApp(),
  )
);

// void main() async{
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late String name, description;
  late double price;

  getName(name){
    this.name = name;
    // ignore: avoid_print
    print(this.name);
  }

  getDescription(description){
    this.description = description;
    // ignore: avoid_print
    print(this.description);
  }

  getPrice(price) {
    this.price = double.parse(price);
    // ignore: avoid_print
    print(this.price);
  }

  createData(){
    // ignore: avoid_print
    print("create");
  }

  readData(){
    // ignore: avoid_print
    DocumentReference documentReference = FirebaseFirestore.instance.collection("Disches").doc(name);

    documentReference.get().then((datasnapshot){
      // ignore: avoid_print
      print(datasnapshot.get("name"));
      // ignore: avoid_print
      print(datasnapshot.get("description"));
      // ignore: avoid_print
      print(datasnapshot.get("price"));
    });
  }

  updateData(){
    // ignore: avoid_print
    print("update");
  }

  deleteData(){
    // ignore: avoid_print
    print("delete");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: const Text("Data Product CRUD"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column (
          children: <Widget>[
            TextField(
              decoration: const InputDecoration (
                hintText: "Name Product"
              ),
              onChanged: (String name) {
                getName(name);
              },
            ),
            TextField(
              decoration: const InputDecoration (
                  hintText: "Description"
              ),
              onChanged: (String description) {
                getDescription(description);
              },
            ),
            TextField(
              decoration: const InputDecoration (
                  hintText: "Price"
              ),
              onChanged: (String price) {
                getPrice(price);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 22.0),
                    child: ElevatedButton(
                      child: const Text("Create"),
                      onPressed:(){
                        createData();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 22.0),
                    child: ElevatedButton(
                      child: const Text("Read"),
                      onPressed:(){
                        readData();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 22.0),
                    child: ElevatedButton(
                      child: const Text("Update"),
                      onPressed:(){
                        updateData();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 22.0),
                    child: ElevatedButton(
                      child: const Text("Delete"),
                      onPressed:(){
                        deleteData();
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}

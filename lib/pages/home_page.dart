import 'package:firebase_setup/services/firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import the http package
import 'dart:convert'; // Import the convert package for JSON decoding

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //FireStore
  final FirestoreService firestoreService = FirestoreService();

  //Text Controller
  final TextEditingController textController = TextEditingController();

  List<dynamic> apiData = [];

  //open a dialog box to add a note
  void openNoteBox() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
        ),
        actions: [
          //button to Save
          ElevatedButton(
            onPressed: () {
              //Add a new Note
              firestoreService.addNote(textController.text);

              //clear the text controller
              textController.clear();

              //close the dialogBox
              Navigator.pop(context);
            },
            child: Text("Add"),
          )
        ],
      ),
    );
  }


  // Fetch data from the API
  Future<void> fetchApiData() async {
    print("fetch is work api");
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      // print(response);
      apiData = json.decode(response.body);
      setState(() {}); // Trigger a rebuild
      // print("fetch is work");
      // print(apiData);
    } else {
      throw Exception('Failed to fetch data from API');
    }
  }

   // Store API data in Firebase Firestore
  void storeApiDataInFirestore() {
    fetchApiData();
    print("fetch is work");
    
    for (var data in apiData) {
      print("fetch is work in loop");
      firestoreService.addData(data);
      
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Notes")),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: storeApiDataInFirestore,
              child: const Text('Fetch'),
            ),
            SizedBox(height: 16),
            
            
            FloatingActionButton(
              onPressed: openNoteBox,
              child: const Icon(Icons.add),
            ),
          ],
        ));
  }
}

// FloatingActionButton(
// onPressed: openNoteBox,
// child: const Icon(Icons.add),
// ),

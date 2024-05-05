import 'package:firebase_setup/services/firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  //FireStore
  final FirestoreService firestoreService=FirestoreService();


  //Text Controller
  final TextEditingController textController=TextEditingController();

  //open a dialog box to add a note
  void openNoteBox(){
    showDialog(context:context,builder:(context) => AlertDialog(
      content: TextField(
        controller: textController,
      ),
      actions: [

        //button to Save
        ElevatedButton(
          onPressed: (){
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
    ),);
  }

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Notes")),
      floatingActionButton: FloatingActionButton(
        onPressed: openNoteBox,
        child: const Icon(Icons.add),
        ),
    );
  }
}
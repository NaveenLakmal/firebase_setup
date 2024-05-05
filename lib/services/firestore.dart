import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{


  //get collction of notes
  final CollectionReference notes=FirebaseFirestore.instance.collection('notes');

  // CREATE: add a new note
  Future<void> addNote(String note){
    return notes.add({
      'note':note,
      'timestamp':Timestamp.now(),
      
    });
  }

  // READ:get notes from databse

  // UPDATE:update notes give a doc Id

  // DELETE:Delete a note give a doc Id 
}
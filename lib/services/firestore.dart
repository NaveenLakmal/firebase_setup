import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{


  //get collction of notes
  final CollectionReference notes=FirebaseFirestore.instance.collection('notes');

   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addData(Map<String, dynamic> data) {
    return _firestore.collection('fetch_sample_user').add(data);
  }

  // CREATE: add a new note
  Future<void> addNote(String note){
    return notes.add({
      'note':note,
      'timestamp':Timestamp.now(),
      
    });
  }

  // READ:get notes from databse
  Stream<QuerySnapshot> getNotesStream(){
    final notesStream=notes.orderBy('timestamp',descending: true).snapshots();

    return notesStream;
  }

  //
  Stream<QuerySnapshot> getFDataStream(){
    // final notesStream2=_firestore.collection('fetch_sample_user').snapshots();

    // return notesStream2;
    return _firestore.collection('fetch_sample_user').snapshots();
  }

  // UPDATE:update notes give a doc Id

  // DELETE:Delete a note give a doc Id 
}

//https://youtu.be/PFP8GnJcJHA
// https://youtu.be/iQOvD0y-xnw
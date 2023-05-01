import 'package:book_app/modules/book/models/book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('books');

  final CollectionReference englishCollection =
      FirebaseFirestore.instance.collection('english_books');

  List<Book> _englishBookListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Book.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();
  }

  Stream<List<Book>> get englishBooks {
    return englishCollection.snapshots().map(_englishBookListFromSnapshot);
  }

  List<Book> _bookListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Book.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();
  }

  Stream<List<Book>> get books {
    return collection.snapshots().map(_bookListFromSnapshot);
  }
}

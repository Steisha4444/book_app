import 'package:book_app/modules/book/models/book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('books');

  Future<void> updateUserData(
    String name,
  ) async {
    return await collection.doc(uid).set({
      'name': name,
    });
  }

  List<Book> _bookListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Book.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();

    //   Book(
    //     id: int.parse(doc.get('bookId')),
    //     name: doc.get('bookName'),
    //     author: doc.get('author'),
    //     level: doc.get('level'),
    //     description: doc.get('description'),
    //     cover: doc.get('cover'),
    //     textUa: doc.get('contextUa'),
    //     textEn: doc.get('contextEn'),
    //     date: doc.get('publicationDate'),
    //     pages: doc.get('pages'),
    //     rate: doc.get('rating'),
    //     genres: doc.get('genres'),
    //     // name: doc.data['name'] ?? '',
    //     // strength: doc.data['strength'] ?? 0,
    //     // sugars: doc.data['sugars'] ?? '0'
    //   );
    // }).toList();
  }

  Stream<List<Book>> get books {
    return collection.snapshots().map(_bookListFromSnapshot);
  }
}

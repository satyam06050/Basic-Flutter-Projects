import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> create(
    String colName, String docName, String name, String animal, int age) async {
  await FirebaseFirestore.instance
      .collection(colName)
      .doc(docName)
      .set({'name': name, 'animal': animal, 'age': age});
  print("Database created");
}

Future<void> update(
    String colName, String docName, field, var newFieldValue) async {
  await FirebaseFirestore.instance
      .collection(colName)
      .doc(docName)
      .update({field: newFieldValue});

  print("Database updated");
}

Future<void> delete(String colName, String docName) async {
  await FirebaseFirestore.instance.collection(colName).doc(docName).delete();
  print("Database deleted");
}

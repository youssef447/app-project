import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class CrudServices {
  Stream<QuerySnapshot<Map<String, dynamic>>>  read() async* {
    FirebaseFirestore.instance.collection("interview").snapshots();
  }

  Future<void> add({required Map<String, dynamic> json}) async {
    await FirebaseFirestore.instance.collection("interview").add(json);
  }

  Future<void> delete(String id) async {
    // await FirebaseFirestore.instance.collection("bmi data").doc(docId).delete();
  }

  Future<void> update(
      {required String id, required Map<String, dynamic> json}) async {
    /*    await FirebaseFirestore.instance
        .collection("bmi data")
        .doc(docId)
        .update(json);  */
  }
}

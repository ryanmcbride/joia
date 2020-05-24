import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:joia/models/entry.dart';
import 'package:joia/root.dart';

class DataRepository {
  // 1
  final CollectionReference collection = Firestore.instance.collection('entries');
  // 2
  Stream<QuerySnapshot> getStream() {
    return collection.where('userID', isEqualTo: RootPage.userID).snapshots();
  }
  // 3
  Future<DocumentReference> addEntry(Entry entry) {
    return collection.add(entry.toJson());
  }
  // 4
  updatePet(Entry entry) async {
    await collection.document(entry.reference.documentID).updateData(entry.toJson());
  }
}
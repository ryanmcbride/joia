import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:joia/root.dart';

class Entry {
  // 1
  String entry;
  DateTime date;
  String userID;
  // 2
  DocumentReference reference;
  // 3
  Entry(this.entry, {this.date, this.userID, this.reference});
  // 4
  factory Entry.fromJson(Map<dynamic, dynamic> json) => _EntryFromJson(json);
  // 5
  Map<String, dynamic> toJson() => _EntryToJson(this);

  factory Entry.fromSnapshot(DocumentSnapshot snapshot) {
    Entry newEntry = Entry.fromJson(snapshot.data);
    newEntry.reference = snapshot.reference;
    return newEntry;
  }
  @override
  String toString() => "Entry<$entry>";
}

//1
Entry _EntryFromJson(Map<dynamic, dynamic> json) {
  return Entry(
    json['entry'] as String,
    date: json['date'] == null ? null : (json['date'] as Timestamp).toDate(),
    userID: json['userID'] as String,
  );
}

//2
Map<String, dynamic> _EntryToJson(Entry instance) => <String, dynamic>{
      'entry': instance.entry,
      'date': instance.date??Timestamp.now(),
      'userID': instance.userID??RootPage.userID,
    };

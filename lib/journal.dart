import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:joia/repository/data_repository.dart';
import 'package:joia/models/entry.dart';
import 'bottom_bar.dart';

class JournalPage extends StatefulWidget {
  JournalPage({Key key}) : super(key: key);

  @override
  _JournalPageState createState() => _JournalPageState();
}

class JournalEntry {
  JournalEntry({this.friend, this.date, this.entry, this.tags});
  String friend;
  String date;
  String entry;
  List<String> tags;
}

class _JournalPageState extends State<JournalPage> {
  final DataRepository repository = DataRepository();
  List<JournalEntry> litems = [
    JournalEntry(
        friend: "Edward Reyes",
        date: "Today",
        entry:
            "I smiled today because my friends took me out to lunch for my birthay and basically listened to me talk for an entire hour.",
        tags: ["Jessie Wallace", "Edith Turner"]),
    JournalEntry(
        friend: "Catherine Hudson",
        date: "Today",
        entry:
            "My day changed when Johnny stopped me at work and thanked me for the help that I had given him.  I wasn't having a good day, but it totally changed. He's such a good guy.",
        tags: ["johnny.rockets@fakemail.com"]),
    JournalEntry(
        friend: "Derek Boman",
        date: "Today",
        entry:
            "I laughed when Leo was outside in the snow for the first time this year.  He doesn't remember last year so it was fun to see his reaction. Mind blown.",
        tags: ["Leo Bowman"]),
    JournalEntry(
        friend: "Lily Morales",
        date: "Tue, Dec 12",
        entry:
            "I'm grateful that we made it home safely after spending the night at grandparents.",
        tags: ["Will Morales", "Cristy Morales"]),
  ];
  Widget journalBuilder(BuildContext ctxt, int index) {
    bool isDateRow = false;
    if (index == 0 || litems[index - 1].date != litems[index].date) {
      isDateRow = true;
    }
    Widget data = new Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      child: Row(
        children: <Widget>[
          Container(
            color: Colors.red,
            width: 75,
          ),
          Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Text(litems[index].entry, textAlign: TextAlign.left),
              ),
            ],
          ),
        ],
      ),
    );
    if (isDateRow) {
      return new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey)),
              ),
              height: 30,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                child: Text(litems[index].date),
              ),
            ),
            data,
          ]);
    } else {
      return data;
    }
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot snapshot) {
    final entry = Entry.fromSnapshot(snapshot);
    if (entry == null) {
      return Container();
    }
    return Container(
      height: 75,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      child: Row(
        children: <Widget>[
          Container(
            color: Colors.red,
            width: 75,
          ),
          Expanded(
            child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Text(entry.entry, textAlign: TextAlign.left),
              ),
            ],
          ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Journal"),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: repository.getStream(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return LinearProgressIndicator();
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildListItem(context, snapshot.data.documents[index]);
              },
            );
          }),
      bottomNavigationBar: CustomBottomBar(index: 1),
    );
  }
}

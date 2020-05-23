import 'package:flutter/material.dart';
import 'dart:math';
import 'bottom_bar.dart';

class WritePage extends StatefulWidget {
  final int pageNumber;

  const WritePage({Key key, this.pageNumber}) : super(key: key);

  @override
  _WritePageState createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  int _nextPage;
  void initState() {
    super.initState();
    _nextPage =
        this.widget.pageNumber == null ? 1 : (this.widget.pageNumber + 1);
  }

  @override
  Widget build(BuildContext context) {
    int nextPage =
        this.widget.pageNumber == null ? 1 : (this.widget.pageNumber + 1);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Write a Message"),
        actions: nextPage > 2
            ? <Widget>[]
            : <Widget>[
                FlatButton(
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              WritePage(pageNumber: _nextPage)),
                    );
                  },
                  child: Text("Next"),
                  shape:
                      CircleBorder(side: BorderSide(color: Colors.transparent)),
                ),
              ],
      ),
      body: Container(
          height: double.maxFinite,
          child: Column(
            //alignment:new Alignment(x, y)
            children: <Widget>[
              HeaderSection(screenNumber: nextPage),
              TextSection(),
              Container(
                  height: 50,
                  child: Row(
                    children: <Widget>[
                      ButtonTheme(
                        minWidth: 150.0,
                        child: OutlineButton(
                          color: Theme.of(context).primaryColor,
                          textColor: Theme.of(context).primaryColor,
                          disabledTextColor: Colors.black,
                          padding: EdgeInsets.all(8.0),
                          splashColor: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          onPressed: () {},
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                                child: Icon(
                                  Icons.person_add,
                                ),
                              ),
                              Text(
                                "Tag Friends",
                                style: TextStyle(fontSize: 12.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: ButtonTheme(
                          minWidth: 50.0,
                          child: OutlineButton(
                            color: Theme.of(context).primaryColor,
                            textColor: Theme.of(context).primaryColor,
                            disabledTextColor: Colors.black,
                            padding: EdgeInsets.all(8.0),
                            splashColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            onPressed: () {},
                            child: Icon(
                                  Icons.camera_alt,
                                ),
                          ),
                        ),
                      )
                    ],
                  )),
            ],
          )),
      bottomNavigationBar: CustomBottomBar(index: 0),
    );
  }
}

class TextSection extends StatefulWidget {
  const TextSection({Key key}) : super(key: key);

  @override
  _TextSectionState createState() => _TextSectionState();
}

class _TextSectionState extends State<TextSection> {
  TextEditingController _controller;
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

/* */
  @override
  Widget build(BuildContext context) {
    return new Expanded(
        child: TextField(
            decoration: null,
            keyboardType: TextInputType.text,
            maxLines: null,
            textAlign: TextAlign.left,
            controller: _controller,
            onSubmitted: (String text) {}));
  }
}

class HeaderSection extends StatefulWidget {
  final int screenNumber;

  const HeaderSection({Key key, this.screenNumber}) : super(key: key);

  @override
  _HeaderSectionState createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  int _hintNumber = 0;
  _HeaderSectionState() {
    _hintNumber = Random().nextInt(100) % hints.length;
  }
  List<String> hints = [
    "My day changed when...",
    "I laughed today when...",
    "I appreciate that...",
    "I smiled today because...",
    "I felt loved because...",
  ];
  @override
  Widget build(BuildContext context) {
    int screenNumber = this.widget.screenNumber;
    return new Positioned(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _hintNumber = (_hintNumber + 1) % hints.length;
          });
        },
        child: Container(
          height: 52,
          child: Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey))),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('$screenNumber of 3 Today',
                          style: TextStyle(
                              color: Color.fromARGB(255, 242, 191, 60))),
                      Text(hints[_hintNumber]),
                    ],
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomRight,
                    child: Icon(Icons.chevron_right),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

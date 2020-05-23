import 'package:flutter/material.dart';
import 'bottom_bar.dart';
import 'profile.dart';
import 'root.dart';

class SettingsPage extends StatelessWidget {
  static Function logoutCallback;
  Widget settingsRow(IconData icon, String str, [Function callback]) {
    return InkWell(
        onTap: () {
          callback?.call();
        },
        child: Container(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
              left: 10,
            ),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            child: Row(
              children: <Widget>[Icon(icon), Text(str)],
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Settings"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          settingsRow(Icons.person, "Profile",(){
            Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
          }),
          settingsRow(Icons.group, "Group Settings",(){
            print("group tapped");
          }),
          settingsRow(Icons.person, "Terms & Conditions",(){
            print("terms tapped");
          }),
          settingsRow(Icons.person, "About our Sponsor",(){
            print("about tapped");
          }),
          settingsRow(Icons.person, "Logout",(){
            RootPage.authObject.signOut();
            logoutCallback();
            Navigator.of(context).popUntil((route) => route.isFirst);
          }),
        ],
      ),
      bottomNavigationBar: CustomBottomBar(index: 3),
    );
  }
}

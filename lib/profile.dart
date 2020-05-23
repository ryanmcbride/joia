import 'package:flutter/material.dart';
import 'bottom_bar.dart';

class ProfilePage extends StatelessWidget {
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Profile"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          settingsRow(Icons.person, "Profile",(){
            print("profile tapped");
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
            print("logout tapped");
          }),
        ],
      ),
      bottomNavigationBar: CustomBottomBar(index: 3),
    );
  }
}

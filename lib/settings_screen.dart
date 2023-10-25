import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListView(
        children: [
          ListTile(
            title: Text('About'),
            leading: Icon(Icons.info),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AboutScreen()));
            },
          ),
          ListTile(
            title: Text('Help'),
            leading: Icon(Icons.help),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HelpScreen()));
            },
          ),
          // Other settings options can be added here
        ],
      ),
    );
  }
}

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About')),
      body: Center(
        child: Text('This is the About section of your app.'),
      ),
    );
  }
}

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Help')),
      body: Center(
        child: Text('This is the Help section of your app.'),
      ),
    );
  }
}

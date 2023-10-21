import 'package:chaos_cryptography/encryption.dart';
import 'package:encrypt/encrypt.dart' as encrypt ;
import 'package:flutter/material.dart';
import 'user_profile.dart';
import 'theme_manager.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(), // Provide the ThemeNotifier
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeNotifier>(context).getTheme(), // Use the theme from ThemeNotifier
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController tec = TextEditingController();
  var encryptedText, Plaintext;

  void toggleDarkMode(bool value) {
  final themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);
  themeNotifier.toggleTheme();
}

  // Function to navigate to the User Profile screen
  void navigateToUserProfile() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return UserProfileScreen();
    }));
  }

  // Function to navigate to the Settings screen
  void navigateToSettings() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return SettingsScreen();
    }));
  }

  // Function to navigate to the Group Chat screen
  void navigateToGroupChat() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return GroupChatScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chaos Cryptography"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.group),
            onPressed: navigateToGroupChat,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.person),
              title: Text('User Profile'),
              onTap: navigateToUserProfile,
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: navigateToSettings,
            ),
        ListTile(
  title: Text('Switch Theme'),
  trailing: Consumer<ThemeNotifier>(
    builder: (context, themeNotifier, child) {
      return Switch(
        value: themeNotifier.isDarkMode,
        onChanged: toggleDarkMode,
      ); // Refresh the UI to apply the new theme
              },
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: tec,
              ),
            ),
            Column(
              children: [
                Text(
                  "PLAIN TEXT",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(Plaintext == null ? "" : Plaintext),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "ENCRYPTED TEXT",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(encryptedText == null
                      ? ""
                      : encryptedText is encrypt.Encrypted
                          ? encryptedText.base64
                          : encryptedText),
                ),
              ],
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Plaintext = tec.text;
                    setState(() {
                      encryptedText = MyEncryptionDecryption.encryptAES(Plaintext);
                    });
                  },
                  child: Text("Encrypt"),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      encryptedText = MyEncryptionDecryption.decryptAES(encryptedText);
                    });
                  },
                  child: Text("Decrypt"),
                ),
              ],
             ),
          ],
        ),
    ),
      );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Center(
        child: Text('Settings Screen Content'),
      ),
    );
  }
}

class GroupChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Group Chat')),
      body: Center(
        child: Text('Group Chat Screen Content'),
      ),
    );
  }
}

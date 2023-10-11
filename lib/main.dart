import 'package:chaos_cryptography/encryption.dart';
import 'package:encrypt/encrypt.dart' as encrypt ;
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (title: Text("Chaos Cryptography"),),
      body: Center(
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: tec,
            ),
            ),
          Column(children: [
            Text("PLAIN TEXT",
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.w600
            ),
            ),
          Padding(padding: const EdgeInsets.all(8.0),
          child: Text(Plaintext == null ? "" : Plaintext),
          ),
          ],
          ),
          Column(
            children: [
              Text("ENCRYPTED TEXT",
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.w600
            ),
            ),
          Padding(padding: const EdgeInsets.all(8.0),
          child: Text(encryptedText == null? "" : encryptedText is encrypt.Encrypted ? encryptedText.base64 : encryptedText),
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
            
            SizedBox(width: 10,),

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
      )
    ); 
}
}
import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the controllers with default values
    nameController.text = 'John';
    phoneController.text = '+1 (123) 456-7890';
    bioController.text = 'Software Developer';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 60, // Adjust the size of the profile picture
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: bioController,
              decoration: InputDecoration(
                labelText: 'Bio',
              ),
            ),
            ElevatedButton(
  onPressed: () {
    // Save the edited information when the button is pressed
    // You can update your user profile with this data
    final updatedName = nameController.text;
    final updatedPhone = phoneController.text;
    final updatedBio = bioController.text;
    print('Updated Name: $updatedName');
    print('Updated Phone Number: $updatedPhone');
    print('Updated Bio: $updatedBio');
  },
  child: Text('Save'),
),
          ],
        ),
      ),
    );
  }
}

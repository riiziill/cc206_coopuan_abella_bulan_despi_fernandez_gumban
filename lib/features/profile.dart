import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final String name = "Rhesty John Fernandez";
  final String studentId = "2022M3456";
  final String email = "rhestyjohn.fernandez@wvsu.edu.ph";
  final String bio = "IDK";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 20,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Divider(
                  thickness: 2,
                  color: const Color.fromARGB(255, 60, 155, 193),
                  height:
                      160, // Adjust height to position the divider correctly
                ),
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/MAIN_LOGO.png'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  Text('$name',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  // Text(' $email', style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Container(
                //   alignment: Alignment.centerLeft,
                //   child: Text('Name: $name', style: TextStyle(fontSize: 13)),
                // ),
                SizedBox(height: 5),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text('Email: $email', style: TextStyle(fontSize: 13)),
                ),
                SizedBox(height: 5),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text('ID: $studentId', style: TextStyle(fontSize: 13)),
                ),
                SizedBox(height: 5),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text('Bio: $bio', style: TextStyle(fontSize: 13)),
                ),
              ],
            ),
            SizedBox(height: 15),
            Divider(
                thickness: 2, color: const Color.fromARGB(255, 60, 155, 193)),
            SizedBox(height: 24),
            SizedBox(
              width: 450,
              child: OutlinedButton(
                onPressed: () {},
                child: Text('Accessibility',
                    style:
                        TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  side: BorderSide(
                      color: const Color.fromARGB(255, 0, 0, 0), width: 0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            SizedBox(
              width: 450,
              child: OutlinedButton(
                onPressed: () {},
                child: Text('Account Setting',
                    style:
                        TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  side: BorderSide(
                      color: const Color.fromARGB(255, 0, 0, 0), width: 0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            SizedBox(
              width: 450,
              child: OutlinedButton(
                onPressed: () {
                  Report(context);
                },
                child: Text('Report A Problem',
                    style:
                        TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  side: BorderSide(
                      color: const Color.fromARGB(255, 0, 0, 0), width: 0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            SizedBox(
              width: 450,
              child: OutlinedButton(
                onPressed: () {
                  logout(context);
                },
                child: Text('Log Out',
                    style:
                        TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 221, 170),
                  side: BorderSide(
                      color: const Color.fromARGB(255, 0, 0, 0), width: 0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Logout'),
          content: Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  void Report(BuildContext context) {
    final TextEditingController _textFieldController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Problem'),
          content: TextField(
            controller: _textFieldController,
            decoration:
                InputDecoration(hintText: "Enter your problem or error here"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                String inputText = _textFieldController.text;
                Navigator.of(context).pop(); // Close the first dialog

                // Show the confirmation dialog
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Problem Reported'),
                      content:
                          Text('Your problem has been reported: $inputText'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pop(); // Close the confirmation dialog
                          },
                          child: Text('Done'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
  }
}

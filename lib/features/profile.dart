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
                onPressed: () {
                  Accesibility(context);
                },
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
                onPressed: () {
                  Account(context);
                },
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

  void Accesibility(BuildContext context) {
    final List<Color> colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
      Colors.orange,
    ];
    Color selectedColor = colors[0];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                width: 300,
                height: 200,
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Select App Color',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 20),
                    DropdownButton<Color>(
                      value: selectedColor,
                      onChanged: (Color? newValue) {
                        if (newValue != null) {
                          setState(() {
                            selectedColor = newValue;
                          });
                        }
                      },
                      items: colors.map<DropdownMenuItem<Color>>((Color color) {
                        return DropdownMenuItem<Color>(
                          value: color,
                          child: Container(
                            width: 70,
                            height: 30,
                            color: color,
                            child: Center(
                              child: Text(
                                colorToString(color),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Confirm'),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  String colorToString(Color color) {
    if (color == Colors.red) return 'Red';
    if (color == Colors.green) return 'Green';
    if (color == Colors.blue) return 'Blue';
    if (color == Colors.yellow) return 'Yellow';
    if (color == Colors.orange) return 'Orange';
    return 'Unknown';
  }

  void Account(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            width: 300,
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Account Settings',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  'Update Account Information',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 20),
                Container(
                  width: 500,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 500,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'ID',
                      border: OutlineInputBorder(),
                    ),
                    readOnly: true,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 500,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 500,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Bio',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 500,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Delete Account',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0))),
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 209, 68, 68)),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 500,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

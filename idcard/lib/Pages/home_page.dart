import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[800],
        title: Text('Id Card'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 55,
                backgroundImage: NetworkImage(
                    'https://e7.pngegg.com/pngimages/164/723/png-clipart-brown-haired-girl-3d-character-cartoon-girl-illustration-japanese-cute-girl-cartoon-characters-cartoon-character-child.png'),
              ),
            ),
            Divider(
                // color: Colors.grey[800],
                ),
            Text(
              "Name",
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "MAIT",
              style: TextStyle(
                color: Colors.pink[800],
                letterSpacing: 2,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              "Branch",
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "IT",
              style: TextStyle(
                color: Colors.pink[800],
                letterSpacing: 2,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              "Home Town",
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Delhi",
              style: TextStyle(
                color: Colors.pink[800],
                letterSpacing: 2,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Icon(Icons.email),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "beautiful@243gmail.com",
                  style: TextStyle(
                    color: Colors.pink[800],
                    letterSpacing: 2,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

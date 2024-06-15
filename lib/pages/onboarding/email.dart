import 'package:flutter/material.dart';
import 'package:playrx/pages/onboarding/choose_artist_page.dart';
import 'package:playrx/utils/font.dart';

class EnterEmailPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Account", style: FontStyles.heading1),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('What\'s your Email', style: FontStyles.bodyText2),
            Container(
              height: 51,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color.fromARGB(
                    255, 165, 164, 164), // Example background color
              ),
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: InputBorder.none, // Remove TextField's default border
                  labelText: 'me@some.com',
                  labelStyle: TextStyle(
                      color: Colors.white), // Example label text color
                  // Example suffix icon
                ),
              ),
            ),
            SizedBox(height: 10),
            Text('Enter Password', style: FontStyles.bodyText2),
            Container(
              height: 51,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(
                    255, 165, 164, 164), // Example background color
              ),
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  border: InputBorder.none, // Remove TextField's default border
                  labelText: 'Password',
                  labelStyle: TextStyle(
                      color: Colors.white), // Example label text color
                  suffixIcon: Icon(Icons.lock), // Example suffix icon
                ),
                obscureText: true,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => ChooseShowsPage()));
                },
                child: Text('Next', style: FontStyles.bodyText2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

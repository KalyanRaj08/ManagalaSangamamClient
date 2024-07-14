import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'FormPage.dart';
import 'Animation.dart';
import 'HomePage.dart';
import 'TNCPage.dart';
import 'TermsNCPage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Icon icon = Icon(Icons.remove_red_eye_outlined);
    bool v = true;
    final un = TextEditingController();
    final pa = TextEditingController();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 230, 158),
      body: Material(
        color: const Color.fromARGB(255, 254, 230, 158),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, snapshot) {
            return (snapshot.connectionState == ConnectionState.waiting)
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: ListView(
                      children: [
                        const SizedBox(height: 50),
                        Image.asset(
                          'images/LOGO1crop.png',
                          width: 400,
                          height: 200,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextField(
                            controller: un,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Colors.white,
                              labelText: "Username : ",
                              hintText: 'Username',
                              filled: true,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                            top: 15.0,
                            right: 15,
                            bottom: 15,
                          ),
                          child: TextField(
                            controller: pa,
                            obscureText: v,
                            obscuringCharacter: '*',
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Colors.white,
                              labelText: "Password : ",
                              hintText: 'Password',
                              filled: true,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: RawMaterialButton(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            fillColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0)),
                            onPressed: () async {
                              var index = snapshot.data!.docs.length;
                              for (int i = 0; i < index; i++) {
                                var data = snapshot.data!.docs[i].data()
                                    as Map<String, dynamic>;
                                if (un.text == data['id'].toString() &&
                                    un.text != '') {
                                  if (pa.text == data['pass'].toString()) {
                                    FocusScope.of(context).unfocus();
                                    await Future.delayed(
                                        const Duration(milliseconds: 100),
                                        () {});
                                    Navigator.push(
                                      context,
                                      AnimatePage(
                                        widget: HomePage(
                                          id: data['id'].toString(),
                                        ),
                                      ),
                                    );
                                  }
                                }
                              }
                              un.clear();
                              pa.clear();
                            },
                            child: const Text(
                              "LOGIN",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Do you have an account?",
                              style: TextStyle(
                                  fontSize: 12, color: Colors.blueAccent),
                            ),
                            TextButton(
                              onPressed: () async {
                                FocusScope.of(context).unfocus();
                                await Future.delayed(
                                    const Duration(milliseconds: 100), () {});
                                Navigator.push(
                                    context, AnimatePage(widget: TNCPage()));
                              },
                              child: const Text(
                                "Signup",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.blueAccent),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Registered but don't have an ID?",
                              style: TextStyle(
                                  fontSize: 12, color: Colors.blueAccent),
                            ),
                            Text(
                              "  Contact- 9944846915",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        TextButton(
                          onPressed: () async {
                            FocusScope.of(context).unfocus();
                            await Future.delayed(
                                const Duration(milliseconds: 100), () {});
                            Navigator.push(context,
                                AnimatePage(widget: TermsNCPage(id: '1')));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.document_scanner),
                              Text(
                                "Terms and Conditions",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.blueAccent),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}

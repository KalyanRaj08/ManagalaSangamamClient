import 'package:flutter/material.dart';

import 'Animation.dart';
import 'FormPage.dart';
import 'LoginPage.dart';

class TNCPage extends StatefulWidget {
  TNCPage({Key? key}) : super(key: key);

  @override
  State<TNCPage> createState() => _TNCPageState();
}

class _TNCPageState extends State<TNCPage> {
  bool B = false;
  bool C = false;
  bool D = false;
  bool E = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 230, 158),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () async {
              FocusScope.of(context).unfocus();
              await Future.delayed(const Duration(milliseconds: 100), () {});
              Navigator.push(context, AnimatePage(widget: LoginPage()));
            },
            icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(80.0)),
        ),
        elevation: 0,
        backgroundColor: Colors.amber,
        title: const Text('Terms & Conditions'),
      ),
      body: Container(
        color: const Color.fromARGB(255, 254, 230, 158),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  CheckboxListTile(
                    checkColor: Colors.black54,
                    activeColor: Colors.amber[100],
                    tristate: false,
                    contentPadding: const EdgeInsets.all(0.0),
                    value: C,
                    dense: true,
                    title: const Text(
                      'தமிழ்',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    onChanged: (val) {
                      setState(() {
                        C = val!;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  CheckboxListTile(
                    checkColor: Colors.black54,
                    activeColor: Colors.amber[100],
                    tristate: false,
                    contentPadding: const EdgeInsets.all(0.0),
                    value: D,
                    dense: true,
                    title: const Text(
                      'இந்து',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    onChanged: (val) {
                      setState(() {
                        D = val!;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  CheckboxListTile(
                    checkColor: Colors.black54,
                    activeColor: Colors.amber[100],
                    tristate: false,
                    contentPadding: const EdgeInsets.all(0.0),
                    value: E,
                    dense: true,
                    title: const Text(
                      'செட்டியார்',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    onChanged: (val) {
                      setState(() {
                        E = val!;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  CheckboxListTile(
                    checkColor: Colors.black54,
                    activeColor: Colors.amber[100],
                    tristate: false,
                    contentPadding: const EdgeInsets.all(0.0),
                    value: B,
                    dense: true,
                    title: const Text(
                      'Accept to Terms and Conditions.',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    onChanged: (val) {
                      setState(() {
                        B = val!;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        onPrimary: Colors.amber,
                      ),
                      onPressed: () async {
                        if (B == true && C == true && D == true && E == true) {
                          FocusScope.of(context).unfocus();
                          await Future.delayed(
                              const Duration(milliseconds: 100), () {});
                          Navigator.push(
                              context, AnimatePage(widget: FormPage()));
                        } else {
                          _error2(context);
                        }
                      },
                      child: const Text('Next'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Developed by KalyanRaj',
                        style: TextStyle(fontSize: 10),
                      ),
                      Icon(
                        Icons.info,
                        size: 10,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_error2(BuildContext context) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Container(
        padding: const EdgeInsets.all(25),
        height: 110,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 194, 65, 65),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.white,
              size: 30,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Failed",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    'All the check box should be ticked to be a part.',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            )
          ],
        ),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
}

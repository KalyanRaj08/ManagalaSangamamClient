import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'imagestorage.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:file_picker/file_picker.dart';
import 'Animation.dart';
import 'LoginPage.dart';
import 'widget/button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormPage extends StatefulWidget {
  FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  Sex? A;
  int? g;
  @override
  Widget build(BuildContext context) {
    var path1;
    var path2;
    final name = TextEditingController();
    final star = TextEditingController();
    final dob = TextEditingController();
    final study = TextEditingController();
    final job = TextEditingController();
    final salary = TextEditingController();
    final father = TextEditingController();
    final mother = TextEditingController();
    final city = TextEditingController();
    final div = TextEditingController();
    final age = TextEditingController();
    final no = TextEditingController();
    final pass = TextEditingController();

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
        title: const Text('Forms'),
      ),
      body: Container(
        color: const Color.fromARGB(255, 254, 230, 158),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'பெயர் : ',
                    hintText: 'Enter your Name',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    RadioButton(
                      title: Sex.Male.name,
                      value: Sex.Male,
                      values: A,
                      onChanged: (val) {
                        setState(() {
                          A = val;
                        });
                      },
                    ),
                    const SizedBox(width: 10),
                    RadioButton(
                      title: Sex.Female.name,
                      value: Sex.Female,
                      values: A,
                      onChanged: (val) {
                        setState(() {
                          A = val;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            '  ',
                            style: TextStyle(fontSize: 5.0),
                          ),
                          Text(
                            '   பிறந்த தேதி, நேரம் : ',
                            style:
                                TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                          Text(
                            '  ',
                            style: TextStyle(fontSize: 5.0),
                          ),
                          Text(
                            '      Press the line below to select!',
                            style: TextStyle(fontSize: 8),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black45),
                      ),
                    ),
                    DateTimeField(
                      controller: dob,
                      format: DateFormat('yyyy-MM-dd HH:mm'),
                      onShowPicker: (context, currentValue) async {
                        final date = await showDatePicker(
                            context: context,
                            firstDate: DateTime(1900),
                            initialDate: currentValue ?? DateTime.now(),
                            lastDate: DateTime(2100));
                        if (date != null) {
                          final time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.fromDateTime(
                                currentValue ?? DateTime.now()),
                          );
                          return DateTimeField.combine(date, time);
                        } else {
                          return currentValue;
                        }
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: age,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "வயது : ",
                    hintText: 'Enter your Age',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: study,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "கல்வி : ",
                    hintText: 'Enter your Qualification',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: job,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "வேலை : ",
                    hintText: 'Enter your Occupation',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: salary,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "சம்பளம் : ",
                    hintText: 'Enter your Salary',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: star,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "நட்சத்திரம் : ",
                    hintText: 'Enter your Birth Star',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: father,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "தந்தை : ",
                    hintText: 'Enter your Father\'s Name',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: mother,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "தாய் : ",
                    hintText: 'Enter your Mother\'s Name',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: city,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "ஊர் : ",
                    hintText: 'Enter your Hometown',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: div,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "பிரிவு : ",
                    hintText: 'Enter your Section',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: no,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "அலைபேசி : ",
                    hintText: 'Enter your Phone Number',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: double.infinity,
                  child: Row(
                    children: [
                      const Text(
                        '   உங்கள் புகைப்படம் : ',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      const SizedBox(width: 5),
                      ElevatedButton(
                        onPressed: () async {
                          final results = await FilePicker.platform.pickFiles(
                            allowMultiple: false,
                            type: FileType.custom,
                            allowedExtensions: ['png', 'jpg'],
                          );
                          if (results == null) {
                            _error2(context);
                          } else {
                            _info(context);
                          }
                          path1 = results?.files.single.path!;
                        },
                        child: Row(
                          children: const [
                            Icon(Icons.upgrade_sharp),
                            Text('Upload'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black45),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: double.infinity,
                  child: Row(
                    children: [
                      const Text(
                        '   ஜாதகம் புகைப்படம் : ',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      const SizedBox(width: 5),
                      ElevatedButton(
                        onPressed: () async {
                          final results = await FilePicker.platform.pickFiles(
                            allowMultiple: false,
                            type: FileType.custom,
                            allowedExtensions: ['png', 'jpg'],
                          );
                          if (results == null) {
                            _error2(context);
                          } else {
                            _info(context);
                          }
                          path2 = results?.files.single.path!;
                        },
                        child: Row(
                          children: const [
                            Icon(Icons.upgrade_sharp),
                            Text('Upload'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black45),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: pass,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "PASSWORD : ",
                    hintText: 'Enter a new Password',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.amber,
                  ),
                  onPressed: () async {
                    if ((no.text.length == 10)) {
                      try {
                        g = int.parse(no.text);
                        CreateUser(
                            name: name.text,
                            age: int.parse(age.text),
                            dob: DateTime.parse(dob.text),
                            div: div.text,
                            father: father.text,
                            mother: mother.text,
                            city: city.text,
                            job: job.text,
                            phone: no.text,
                            star: star.text,
                            salary: double.parse(salary.text),
                            study: study.text,
                            pass: pass.text,
                            sex: A.toString(),
                            p1: path1,
                            p2: path2);
                        _success(context);
                        FocusScope.of(context).unfocus();
                      } on Exception catch (_) {
                        _error(context);
                      } catch (_) {
                        _error(context);
                      }
                    } else {
                      _error1(context);
                    }
                  },
                  child: const Text('Create Account'),
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
      ),
    );
  }

  _success(BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          padding: const EdgeInsets.all(25),
          height: 120,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 88, 216, 95),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.white,
                size: 30,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Success",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      'User Created! Call 9944846915 for account validation.',
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

  _info(BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          padding: const EdgeInsets.all(25),
          height: 120,
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.info,
                color: Colors.white,
                size: 30,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Uploaded",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      'Press Create Accout after filling all details to upload',
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

  _error(BuildContext context) {
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
                      'Age, number and salary should be numbers only.',
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

  _error1(BuildContext context) {
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
                      'Mobile number should be 10 numbers.',
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
                      'File wasn\'t uploaded. Try again with png and jpg files.s',
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

  // ignore: non_constant_identifier_names
  CreateUser(
      {required String name,
      required int age,
      required DateTime dob,
      required String div,
      required String father,
      required String mother,
      required String job,
      required String city,
      required String phone,
      required String star,
      required double salary,
      required String study,
      required String pass,
      required String sex,
      required String p1,
      required String p2}) async {
    final docuser = FirebaseFirestore.instance.collection('users').doc();
    final Storage storage = Storage();
    final f = docuser.id;
    final json = {
      'fid': docuser.id,
      'id': '',
      'name': name,
      'age': age,
      'dob': dob,
      'div': div,
      'star': star,
      'father': father,
      'mother': mother,
      'city': city,
      'job': job,
      'phone': phone,
      'salary': salary,
      'study': study,
      'pass': pass,
      'sex': sex,
    };
    storage.uploadFile(p1, f + '1');
    storage.uploadFile(p2, f + '2');
    await docuser.set(json);
  }
}

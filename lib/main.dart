import 'dart:io';
import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';
import 'package:hive_flutter/adapters.dart';

import './popup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('NG Code');
    setWindowMinSize(const Size(650, 400));
    setWindowMaxSize(const Size(750, 450));
  }
  await Hive.initFlutter();
  await Hive.openBox('cards');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NG Code',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'NG Code'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

bool cond = false;

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController title = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController description = TextEditingController();

    var box = Hive.box("cards");
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0), // here the desired height
          child: AppBar(title: Text(widget.title))),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: Color.fromARGB(255, 34, 34, 34)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(67, 28, 28, 28)
                            .withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      )
                    ],
                    color: const Color.fromARGB(255, 49, 49, 49),
                    border: const Border(
                      right: BorderSide(
                        color: Color.fromARGB(21, 255, 0, 0),
                        width: 1.0,
                      ),
                    )),
                width: double.infinity,
                height: double.infinity,
                child: Center(
                    child: Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextFormField(
                          controller: title,
                          maxLength: 20,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 227, 227, 227),
                            fontSize: 13,
                          ),
                          cursorColor: const Color.fromARGB(255, 144, 144, 144),
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            contentPadding:
                                EdgeInsets.only(top: 10.0, left: 10, right: 10),
                            labelText: 'Title',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 24, 174, 255),
                                fontSize: 14),
                            hintText: 'Enter a Phone Number',
                            hintStyle: TextStyle(
                                color: Color.fromARGB(51, 237, 237, 237)),
                            focusColor: Colors.red,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 6, 6, 6))),
                            border:
                                OutlineInputBorder(borderSide: BorderSide()),
                          )),
                      TextFormField(
                          controller: email,
                          maxLength: 40,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 227, 227, 227),
                              fontSize: 13),
                          cursorColor: const Color.fromARGB(255, 144, 144, 144),
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            contentPadding:
                                EdgeInsets.only(top: 10.0, left: 10, right: 10),
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 24, 174, 255),
                                fontSize: 14),
                            hintText: 'Enter a Phone Number',
                            hintStyle: TextStyle(
                                color: Color.fromARGB(51, 237, 237, 237)),
                            focusColor: Colors.red,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 6, 6, 6))),
                            border:
                                OutlineInputBorder(borderSide: BorderSide()),
                          )),
                      TextFormField(
                          controller: password,
                          maxLength: 30,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 227, 227, 227),
                              fontSize: 13),
                          cursorColor: const Color.fromARGB(255, 144, 144, 144),
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            contentPadding:
                                EdgeInsets.only(top: 10.0, left: 10, right: 10),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 24, 174, 255),
                                fontSize: 14),
                            hintText: 'Enter a Phone Number',
                            hintStyle: TextStyle(
                                color: Color.fromARGB(51, 237, 237, 237)),
                            focusColor: Colors.red,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 6, 6, 6))),
                            border:
                                OutlineInputBorder(borderSide: BorderSide()),
                          )),
                      TextFormField(
                          controller: description,
                          maxLength: 30,
                          maxLines: 1,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 227, 227, 227),
                              fontSize: 14),
                          cursorColor: const Color.fromARGB(255, 144, 144, 144),
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            contentPadding:
                                EdgeInsets.only(top: 20.0, left: 10, right: 10),
                            labelText: 'Description',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 24, 174, 255),
                                fontSize: 14),
                            hintText: 'Enter a Phone Number',
                            hintStyle: TextStyle(
                                color: Color.fromARGB(51, 237, 237, 237)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 6, 6, 6))),
                            border:
                                OutlineInputBorder(borderSide: BorderSide()),
                          )),
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (title.text.isNotEmpty &&
                                      email.text.isNotEmpty &&
                                      password.text.isNotEmpty &&
                                      description.text.isNotEmpty) {
                                    box.put(title.text, [
                                      title.text,
                                      email.text,
                                      password.text,
                                      description.text
                                    ]);
                                  }
                                });
                              },
                              child: const Text("Save",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 188, 188, 188),
                                  ))))
                    ],
                  ),
                )),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: const Color.fromARGB(255, 35, 35, 35),
                padding: const EdgeInsets.all(5.0),
                child: GridView.count(
                  childAspectRatio: 2.4,
                  crossAxisCount: 2,
                  children: List.generate(box.values.length, (index) {
                    return Container(
                      margin: const EdgeInsets.all(5),
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: const Color.fromARGB(255, 55, 55, 55)),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${box.getAt(index)[0]}",
                                  style: const TextStyle(
                                      fontSize: 11,
                                      color:
                                          Color.fromARGB(255, 205, 205, 205)),
                                ),
                                Text(
                                  "${box.getAt(index)[1]}",
                                  style: const TextStyle(
                                      fontSize: 11,
                                      color:
                                          Color.fromARGB(255, 205, 205, 205)),
                                ),
                                Text(
                                  "${box.getAt(index)[2]}",
                                  style: const TextStyle(
                                      fontSize: 11,
                                      color:
                                          Color.fromARGB(255, 205, 205, 205)),
                                ),
                                Text(
                                  "${box.getAt(index)[3]}",
                                  style: const TextStyle(
                                      fontSize: 11,
                                      color:
                                          Color.fromARGB(255, 205, 205, 205)),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 20,
                              child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            PopUp(context, index: index),
                                      );
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size.infinite,
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: const Icon(
                                    Icons.delete,
                                    size: 17.0,
                                  )),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

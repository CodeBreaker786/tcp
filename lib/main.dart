import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String recevivedText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
              child: const Text("Sever "),
              onPressed: () async {
                await ServerSocket.bind('192.168.100.118', 3001, shared: true)
                    .then((serverSocket) {
                  serverSocket.listen((socket) {
                    socket.listen((s) {
                      setState(() {
                        recevivedText = utf8.decode(s).toString();
                      });
                      print(utf8.decode(s));
                    });
                  });
                });
              }),
          MaterialButton(
              child: const Text("client "),
              onPressed: () {
                Socket.connect('192.168.100.118.', 3001).then((socket) {
                  socket.write(
                    'Hello, World!,',
                  );
                });
                Text(
                  recevivedText,
                  style: TextStyle(fontSize: 30),
                );
              })
        ],
      ),
    );
  }
}

class ServerScreen extends StatefulWidget {
  const ServerScreen({Key? key}) : super(key: key);

  @override
  _ServerScreenState createState() => _ServerScreenState();
}

class _ServerScreenState extends State<ServerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

startServer() {}
startClient() {}

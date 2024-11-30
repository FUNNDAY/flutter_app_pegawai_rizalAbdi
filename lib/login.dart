import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Aplikasi',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blue, Colors.purple]),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            print('ini adalah tombol menu');
          },
          icon: Icon(Icons.menu),
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: () {
              print('ini setting');
            },
            icon: Icon(Icons.settings),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {
              print('ini tombol cari');
            },
            icon: Icon(Icons.search),
            color: Colors.white,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(
                  'https://cdn.7tv.app/emote/01FBPSF34G000CGY5JPH61WCPK/4x.webp'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person)),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.password)),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  print('Ini tombol masuk');
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                    backgroundColor: Colors.blueAccent,
                    shadowColor: Colors.blueGrey,
                    elevation: 10),
                child: Text(
                  'MASUK',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}

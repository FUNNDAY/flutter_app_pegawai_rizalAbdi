import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praktikum_android/api/service.dart';
import 'package:praktikum_android/dashboard.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _FormState = GlobalKey<FormState>();
  TextEditingController _user = TextEditingController();
  TextEditingController _pass = TextEditingController();

  Future _masuk() async {
    var response = await DataService().LoginService(_user.text, _pass.text);
    if (response == true) {
      Get.offAll(Dashboard());
    } else {
      Get.defaultDialog(
        title: 'user atau password salah',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Aplikasi',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blue, Colors.purple]),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            print('ini adalah tombol menu');
          },
          icon: const Icon(Icons.menu),
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: () {
              print('ini setting');
            },
            icon: const Icon(Icons.settings),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {
              print('ini tombol cari');
            },
            icon: const Icon(Icons.search),
            color: Colors.white,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Form(
          key: _FormState,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage(
                    'https://cdn.7tv.app/emote/01FXTA6FTG000B09ZDT0P8R347/4x.webp'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  if (value == '') {
                    return "username tidak boleh kosong";
                  }
                  return null;
                },
                controller: _user,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    labelText: 'Username',
                    prefixIcon: const Icon(Icons.person)),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value == '') {
                    return "password tidak boleh kosong";
                  }
                  return null;
                },
                controller: _pass,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.password)),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_FormState.currentState!.validate()) {
                      _masuk();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: Colors.blueAccent,
                      shadowColor: Colors.blueGrey,
                      elevation: 10),
                  child: const Text(
                    'MASUK',
                    style: TextStyle(color: Color.fromARGB(255, 100, 43, 43)),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

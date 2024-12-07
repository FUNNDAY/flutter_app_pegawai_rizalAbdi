import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praktikum_android/login.dart';
import 'package:praktikum_android/pages/calender.dart';
import 'package:praktikum_android/pages/home.dart';
import 'package:praktikum_android/pages/profile.dart';
// import 'package:praktikum_android/pages/';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Dashboard> {
  int _SelectedIndex = 0;

  final List<Widget> _Pages = [
    const Home(),
    const Profile(),
    const Calender(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _SelectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blue, Colors.purple]),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.defaultDialog(
                  title: 'Apakah anda ingin keluar aplikasi',
                  content: Container(),
                  textConfirm: 'ya',
                  textCancel: 'tidak',
                  onConfirm: () {
                    Get.offAll(const Login());
                  });
            },
            icon: const Icon(Icons.logout),
            color: Colors.white,
          ),
        ],
      ),
      body: _Pages[_SelectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _SelectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month), label: 'Kalender')
          ]),
    );
  }
}

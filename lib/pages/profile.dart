import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(
                  Radius.circular(16)), // Membuat sudut gambar melengkung
              child: Image.network(
                'https://cdn.7tv.app/emote/01FXTA6FTG000B09ZDT0P8R347/4x.webp',
                width: 200,
                height: 300, // Dimensi gambar potret
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20), // Jarak antara gambar dan teks
            Text(
              'NPM : 2210010177\nNAMA : MUHAMMAD RIZAL ABDI\nKELAS : 5N',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DetailArtikelPage extends StatelessWidget {
  final String judul;
  final String gambar;
  final String kategori;
  final String isi;
  final String user;
  final String created_at;

  const DetailArtikelPage({
    Key? key,
    required this.judul,
    required this.gambar,
    required this.kategori,
    required this.isi,
    required this.user,
    required this.created_at,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                judul,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                kategori,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Posted by $user',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 10),
              Text(
                created_at,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
              Image.network(gambar),
              SizedBox(height: 20),
              Text(
                isi,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

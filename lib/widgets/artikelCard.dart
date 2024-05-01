import 'package:flutter/material.dart';
import 'package:hackerio/views/detailartikel.dart';
import 'package:hackerio/services/bookmarkServices.dart'; // import BookmarkService
import 'package:hackerio/models/postingan.dart'; // import model postingan

class ArticleCard extends StatelessWidget {
  final String id;
  final String judul;
  final String gambar;
  final String kategori;
  final String isi;
  final String user;
  final String created_at;

  const ArticleCard({
    required this.id,
    required this.judul,
    required this.gambar,
    required this.isi,
    required this.kategori,
    required this.user,
    required this.created_at,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailArtikelPage(
              judul: judul,
              gambar: gambar,
              isi: isi,
              user: user,
              kategori: kategori,
              created_at: created_at,
            ),
          ),
        );
      },
      child: Card(
        color: Color.fromARGB(255, 144, 247, 153),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              gambar,
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    judul,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                  Container(height: 10),
                  Text(
                    kategori,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      const Spacer(),
                      Text(
                        user + "  |  ",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        created_at,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.bookmark),
                        onPressed: () {
                          // Panggil fungsi untuk menambahkan bookmark
                          final bookmarkService = BookmarkService();
                          bookmarkService.addBookmark(
                            postingan(
                              id: id,
                              judul: judul,
                              gambar: gambar,
                              isi: isi,
                              kategori: kategori,
                              user: user,
                              createdAt: created_at,
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Artikel ditambahkan ke bookmark')),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(height: 5),
          ],
        ),
      ),
    );
  }
}

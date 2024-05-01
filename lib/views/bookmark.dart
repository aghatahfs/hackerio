import 'package:flutter/material.dart';
import 'package:hackerio/services/bookmarkServices.dart';
import 'package:hackerio/models/postingan.dart'; // import model postingan
import 'package:hackerio/views/detailartikel.dart'; // import DetailArtikelPage

class BookmarkPage extends StatefulWidget {
  @override
  _BookmarkPageState createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  final BookmarkService _bookmarkService = BookmarkService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text(
          'Bookmark',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: FutureBuilder<List<postingan>>(
        future: Future.value(_bookmarkService.getAllBookmarks()), // Menggunakan Future.value untuk mengembalikan nilai langsung sebagai future
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final bookmarks = snapshot.data;
            if (bookmarks != null && bookmarks.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: bookmarks.map((bookmark) {
                    return Card(
                      color: Color.fromARGB(255, 29, 196, 43),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(bookmark.judul ?? ''),
                          subtitle: Text(bookmark.kategori ?? ''),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailArtikelPage(
                                  judul: bookmark.judul ?? '',
                                  gambar: bookmark.gambar ?? '',
                                  isi: bookmark.isi ?? '',
                                  user: bookmark.user ?? '',
                                  kategori: bookmark.kategori ?? '',
                                  created_at: bookmark.createdAt ?? '',
                                ),
                              ),
                            );
                          },
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                _bookmarkService.removeBookmark(bookmark.id ?? '');
                              });
                            },
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              );
            } else {
              return Center(child: Text('Tidak ada bookmark'));
            }
          }
        },
      ),
    );
  }
}

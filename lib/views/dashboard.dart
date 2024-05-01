import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hackerio/widgets/artikelCard.dart';
import 'package:hackerio/models/postingan.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final Dio _dio = Dio();

  List<postingan> _posts = [];

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  Future<void> _fetchPosts() async {
    try {
      Response response = await _dio
          .get('https://rafi.aghatahafis.my.id/cybersecurity/api.php');
      List<dynamic> responseData = response.data;

      setState(() {
        _posts = responseData.map((json) => postingan.fromJson(json)).toList();
      });
    } catch (e) {
      print('Error fetching posts: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _posts.length,
          itemBuilder: (BuildContext context, int index) {
            final postingan post = _posts[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ArticleCard(
                id: post.id ?? '',
                judul: post.judul ?? '',
                gambar: post.gambar ?? '',
                kategori: post.kategori ?? '',
                isi: post.isi ?? '',
                user: post.user ?? '',
                created_at: post.createdAt ?? ''
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:get_storage/get_storage.dart';
import 'package:hackerio/models/postingan.dart'; // import model postingan

class BookmarkService {
  final _box = GetStorage();

  Future<void> addBookmark(postingan post) async {
    await _box.write(post.id!, post.toJson());
  }

  Future<void> removeBookmark(String postId) async {
    await _box.remove(postId);
  }

  bool isBookmarked(String postId) {
    return _box.read(postId) != null;
  }

  List<postingan> getAllBookmarks() {
    final bookmarks = <postingan>[];
    _box.getKeys().forEach((key) {
      final bookmarkData = _box.read(key);
      if (bookmarkData != null) {
        bookmarks.add(postingan.fromJson(bookmarkData));
      }
    });
    return bookmarks;
  }
}

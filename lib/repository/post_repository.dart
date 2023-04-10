import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/post.dart';

class PostRepository {
  static Future<void> updatePost(Post postData) async {
    await FirebaseFirestore.instance.collection('posts').add(postData.toMap());
  }

  static Future<List<Post>> loadFeedList() async {
    var document = FirebaseFirestore.instance
        .collection('posts')
        .orderBy('createdAt', descending: true)
        .limit(10);

    var data = await document.get();
    // 맵으로 돌려 포스트로 데이터 파싱처리
    return data.docs.map<Post>((e) => Post.fromJson(e.id, e.data())).toList();
  }
}

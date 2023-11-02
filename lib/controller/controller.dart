import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../data/repository.dart';
import '../model/comment.dart';
import '../model/post.dart';
import '../model/user.dart';

class Controller extends GetxController {
  late final Repository _repository;

  Controller(this._repository);

  RxBool isLoading = true.obs;
  RxBool isLoadingComments = true.obs;
  Rx<List<Post>> postList = Rx<List<Post>>([]);
  Rx<List<Comment>> commentList = Rx<List<Comment>>([]);

  void fetchData() => _repository.getUsers().then((users) {
        if (users is List<User>) {
          _repository.getPosts().then((posts) {
            if (posts is List<Post>) {
              for (var post in posts) {
                for (var user in users) {
                  if (post.userId == user.id) {
                    post.nameOfUser = user.name;
                    post.username = user.username;
                  }
                }
              }
              postList.value = posts;
            } else {
              Get.snackbar("Error", "please check your internet connection",
                  margin: const EdgeInsets.only(top: 10, right: 10, left: 10));
            }
          });
        } else {
          Get.snackbar("Error", "please check your internet connection",
              margin: const EdgeInsets.only(top: 10, right: 10, left: 10));
        }
        isLoading.value = false;
      });

  void getComments(int postId) {
    commentList.value = [];
    _repository.getComments(postId).then((value) {
      if (value is List<Comment>) {
        commentList.value = value;
      } else {
        Get.snackbar("Error", "please check your internet connection",
            margin: const EdgeInsets.only(top: 10, right: 10, left: 10));
      }
      isLoadingComments.value = false ;
    });
  }

  void toggle(Post post) => post.isLiked.value = !post.isLiked.value;
}

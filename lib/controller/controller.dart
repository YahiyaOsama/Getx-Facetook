import 'package:get/get.dart';
import '../data/repository.dart';
import '../model/comment.dart';
import '../model/post.dart';
import '../model/user.dart';

class Controller extends GetxController {
  late final Repository _repository;

  Controller(this._repository);

  RxBool isLoading = true.obs;
  Rx<List<Post>> postList = Rx<List<Post>>([]);
  Rx<List<User>> userList = Rx<List<User>>([]);
  Rx<List<Comment>> commentList = Rx<List<Comment>>([]);

  void fetchData() => _repository.getPosts().then((value) {
        if (value is List<Post>) {
          postList.value = value;
          postList.value.forEach((post) {
            userList.value.forEach((user) {
              if (post.userId == user.id) {
                post.nameOfUser = user.name;
                post.username = user.username;
              }
            });
          });
        } else {
          Get.snackbar("Error", value);
        }
        isLoading.value = false;
      });

  void getUser() => _repository.getUsers().then((value) {
        if (value is List<User>) {
          userList.value = value;
        } else {
          Get.snackbar("Error", value);
        }
      });

  void getComments(int postId) {
    commentList.value = [];
    _repository.getComments(postId).then((value) {
      if (value is List<Comment>) {
        commentList.value = value;
      } else {
        Get.snackbar("Error", value);
      }
    });
  }

  void toggle(Post post) => post.isLiked.value = !post.isLiked.value;
}

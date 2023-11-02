import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:october_assignment/controller/controller.dart';
import 'package:october_assignment/view/res/color_manager.dart';
import 'package:october_assignment/view/res/extension.dart';
import 'package:october_assignment/view/res/values_manager.dart';
import 'widgets/custom_text_button.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Image(
          image: AssetImage(
            "assets/images/logo.png",
          ),
          width: 200,
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: controller.postList.value.length,
          itemBuilder: (context, i) {
            return Card(
              margin: const EdgeInsets.only(bottom: 20, right: 7, left: 7),
              elevation: 4,
              // margin: EdgeInsets.all(MediaQuery.sizeOf(context).width/50),
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                      color: i.isEven
                          ? ColorManager.primary.withOpacity(0.5)
                          : ColorManager.blackColor.withOpacity(0.5), width: 1)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  15.mh,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      16.mw,
                      Text(
                        controller.postList.value[i].nameOfUser,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                        textAlign: TextAlign.start,
                      ),
                      50.mw,
                      Text(
                        '@${controller.postList.value[i].username}',
                        style: const TextStyle(
                            color: Colors.black45, fontSize: 16),
                      ),
                    ],
                  ),
                  ListTile(
                    // trailing: Text("${homeController.postList.value[i].userId}"),
                    title: Text(controller.postList.value[i].title),
                    subtitle: Text(
                      controller.postList.value[i].body,
                    ),
                  ),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextButton(
                          text:
                              "Like${controller.postList.value[i].isLiked.value ? 'd' : ''}",
                          isLiked: controller.postList.value[i].isLiked.value,
                          onClickListener: () =>
                              controller.toggle(controller.postList.value[i]),
                        ),
                        CustomTextButton(
                          text: "Comments",
                          isLiked: false,
                          onClickListener: () {
                            controller
                                .getComments(controller.postList.value[i].id);
                            showModalBottomSheet(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(AppSiz.s30)),
                              ),
                              context: context,
                              builder: (c) {
                                return Obx(
                                  () => Container(
                                    height: MediaQuery.sizeOf(context).height,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: ListView.separated(
                                        itemBuilder: (_, i) {
                                          return ListTile(
                                            title: Text(
                                              controller
                                                  .commentList.value[i].name,
                                            ),
                                            subtitle: Text(
                                              controller
                                                  .commentList.value[i].body,
                                            ),
                                            leading: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.favorite,
                                                  size: 20,
                                                )),
                                          );
                                        },
                                        separatorBuilder: (_, i) {
                                          return Container(
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.all(10),
                                            height: 1,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 30, vertical: 5),
                                            color:
                                                Colors.black.withOpacity(0.2),
                                          );
                                        },
                                        itemCount: controller
                                            .commentList.value.length),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
      }),
    );
  }
}

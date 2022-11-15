import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:posts/model/post_model.dart';
import 'package:posts/util/networking/api_response.dart';
import 'package:posts/viewmodel/home_viewmodel.dart';
import 'package:posts/views/detail_view.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homeVM = Provider.of<HomeViewmodel>(context);
    return Scaffold(
      body: SafeArea(
          child: homeVM.allPostResponse.status == Status.LOADING
              ? const Center(child: CircularProgressIndicator())
              : homeVM.allPostResponse.status == Status.LOADING
                  ? Center(
                      child: GestureDetector(
                          onTap: (() => homeVM.getAllPost()),
                          child: Text(homeVM.allPostResponse.message)),
                    )
                  : ListView.builder(
                      itemCount: homeVM.allPostResponse.data?.length,
                      itemBuilder: (ctx, index) {
                        PostModel postModel =
                            homeVM.allPostResponse.data![index];
                        return Padding(
                            padding:
                                const EdgeInsets.all(10.0).copyWith(bottom: 20),
                            child: GestureDetector(
                              onTap: (() => Navigator.push(context,
                                      MaterialPageRoute(builder: (ctx) {
                                    return DetailView(postModel: postModel);
                                  }))),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${postModel.id ?? ""}"),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: Text("${postModel.title ?? ""}"))
                                ],
                              ),
                            ));
                      })),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:posts/model/post_model.dart';
import 'package:posts/util/networking/api_response.dart';
import 'package:posts/util/networking/api_url.dart';
import 'package:posts/util/networking/networking.dart';

class HomeViewmodel extends ChangeNotifier {
  HomeViewmodel() {
    getAllPost();
  }
  ApiDataResponse<List<PostModel>> _allPostResponse = ApiDataResponse.idle();

  ApiDataResponse<List<PostModel>> get allPostResponse => _allPostResponse;

  set allPostResponse(ApiDataResponse<List<PostModel>> allPostResponse) {
    _allPostResponse = allPostResponse;
    notifyListeners();
  }

  getAllPost() async {
    try {
      allPostResponse = ApiDataResponse.loading("");
      var response = await NetworkClient.get(url: ApiUrl.getPost);
      allPostResponse = ApiDataResponse.completed(postModelFromJson(response));
    } catch (e) {
      allPostResponse = ApiDataResponse.error(e.toString());
    }
  }
}

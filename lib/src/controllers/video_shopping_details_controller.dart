import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../models/video_shopping_details_model.dart';
import 'package:yoori_ecommerce/src/servers/repository.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoShoppingDetailsController extends GetxController{

  Rx<VideoShoppingDetailsModel> videoShoppingDetailsModel = VideoShoppingDetailsModel().obs;
  var isLoader=true.obs;
  var videoSlug = Get.parameters['videoSlug'];
  late YoutubePlayerController controller;
  var isPlayerReady = false.obs;
  ChewieController? chewieController;
  VideoPlayerController? videoPlayerController;

  var vimeoLink = "".obs;

  Future videoShoppingDetail(String videoSlug) async{
  await Repository().videoShoppingDetails(videoSlug)
      .then((value) async {
        if(value != null){
          videoShoppingDetailsModel.value = value;
          if(value.data!.video!.videoType=="youtube"){
            _youTubeVideoPlayer(videoShoppingDetailsModel.value.data!.video!.videoUrl.toString());
          }else if(value.data!.video!.videoType=="mp4"){
            await initializePlayer(videoShoppingDetailsModel.value.data!.video!.videoUrl.toString());
          }else if(value.data!.video!.videoType=="vimeo"){
            vimeoLink.value = 'https://vimeo.com/${videoShoppingDetailsModel.value.data!.video!.videoUrl.toString()}';
          }
        }
        isLoader.value=false;
        update();
  });
  }


  Future<void> initializePlayer(String videoUrl) async {
    videoPlayerController = VideoPlayerController.network(videoUrl);
    await videoPlayerController!.initialize();
    videoPlayerController!.setLooping(true);
    videoPlayerController!.setVolume(1.0);
    videoPlayerController!.play();
    _createChewieController();
    update();
  }

  void _createChewieController() {
    chewieController = ChewieController(
        videoPlayerController: videoPlayerController!,
        aspectRatio: 16 / 9,
        autoInitialize: true,
        autoPlay: true,
        looping: true,
        errorBuilder: (context, errorMesaage) {
          return Center(
            child: Text(
              errorMesaage,
              style: const TextStyle(color: Colors.red),
            ),
          );
        });
    update();
  }

  //Youtube Video player
  void _youTubeVideoPlayer(String videoUrl){
    controller = YoutubePlayerController(
      initialVideoId: videoUrl,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
  }


  findYoutubeVideoId(){
   return videoShoppingDetailsModel.value.data!.video!.videoUrl.toString();
  }

  bool productStyle(){
    String style = videoShoppingDetailsModel.value.data!.video!.style.toString();
    if(style=="style_1"||style=="style_2"){
      return true;
    }else{
      return false;
    }
  }



  @override
  void onInit(){
    videoShoppingDetail(videoSlug.toString());
    super.onInit();
  }

  // void listener() {
  //   if (isPlayerReady.value && !controller.value.isFullScreen) {
  //     update();
  //   }
  // }


}
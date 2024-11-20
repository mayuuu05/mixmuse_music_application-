

import 'package:flutter/cupertino.dart';
// import 'package:just_audio/just_audio.dart';


import '../model/song_model.dart';
import '../service/api_service.dart';


class SongProvider extends ChangeNotifier{

  SongModel? songModel;
  Result? result;
  // AudioPlayer audioPlayer = AudioPlayer();

  Duration? duration;
  bool isPlay = false;

  Future<void> getSongs()
  async {
    ApiService apiService = ApiService();

    Map<String,dynamic> json = await apiService.fetchSongs();
    songModel = SongModel.fromJson(json);
    notifyListeners();
  }

  void setSong(Result selectedSong)
  {
    result= selectedSong;
    notifyListeners();
  }

  Future<void> playSong(String url)
  async {
    // duration = await audioPlayer.setUrl(url);

    notifyListeners();
  }

  Future<void> songPlayOnClick()
  async {

    if(isPlay)
      {
        isPlay = false;
        // await audioPlayer.play();
        notifyListeners();
      }else{
      isPlay = true;
      // await audioPlayer.pause();
      notifyListeners();
    }

  }

  void getCurrentPosition()
  {
   // return  audioPlayer.positionStream;
  }

  Future<void> scrollSong(Duration position)
  async {
    // await audioPlayer.seek(position);
    notifyListeners();
  }
  SongProvider()
  {
    getSongs();
  }
}

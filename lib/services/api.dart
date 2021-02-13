import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:you_tube/models/video.dart';

const CHAVE = "AIzaSyDTgJndQ51CM7kkiRbpPuLRRSEkA0qZFiU";
const ID_CANAL = "UCcmoSeKToo-Xd-gaeip3TOg";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
    print(pesquisa);
    http.Response response = await http.get(
      URL_BASE +
          "search"
              "?part=snippet"
              "&type=video"
              "&maxResults=20"
              "&order=date"
              "&key=$CHAVE"
              "&channelId=$ID_CANAL"
              "&q=$pesquisa",
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);
      List<Video> videos = dadosJson["items"].map<Video>((map) {
        return Video.fromJson(map);
      }).toList();

      return videos;
    }
  }
}

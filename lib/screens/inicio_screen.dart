import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:you_tube/models/video.dart';
import 'package:you_tube/services/api.dart';

class InicioScreen extends StatefulWidget {
  InicioScreen({Key key, this.pesquisa}) : super(key: key);
  String pesquisa;

  @override
  _InicioScreenState createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioScreen> {
  _listarVideos(String query) {
    Api api = Api();

    return api.pesquisar(query);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
      builder: (context, snaphot) {
        switch (snaphot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.done:
            if (snaphot.hasData) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  List<Video> videos = snaphot.data;
                  Video video = videos[index];
                  return GestureDetector(
                    onTap: () {
                      FlutterYoutube.playYoutubeVideoById(
                        apiKey: CHAVE,
                        videoId: video.id,
                        autoPlay: true,
                        fullScreen: true
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(video.imagem),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(video.titulo),
                          subtitle: Text(video.canal),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  height: 2,
                  color: Colors.grey,
                ),
                itemCount: snaphot.data.length,
              );
            } else {
              return Center(
                child: Text("Nenhum dado a ser Exibido!"),
              );
            }

            break;
          case ConnectionState.active:
        }

        return Text(snaphot.data.length.toString());
      },
      future: _listarVideos(widget.pesquisa),
    );
  }
}

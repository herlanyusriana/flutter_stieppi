import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Playlist extends StatefulWidget {
  Playlist({this.title, this.url});
  final String title;
  final String url;
  @override
  _PlaylistState createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  Future<List> getData() async {
    final response = await http.get(widget.url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? new ListVideo(
                    list: snapshot.data,
                  )
                : new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(child: CircularProgressIndicator())
                    ],
                  );
          }),
    );
  }
}

class ListVideo extends StatefulWidget {
  final List list;
  ListVideo({this.list});

  @override
  _ListVideoState createState() => _ListVideoState();
}

class _ListVideoState extends State<ListVideo> {
  YoutubePlayerController _controller = YoutubePlayerController();
  String _playerStatus = "";
  String _errorCode = '0';
  double _volume = 100;
  void _showThankYouDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Video Ended"),
          content: Text("Thank you for trying the plugin!"),
        );
      },
    );
  }

  void listener() {
    if (_controller.value.playerState == PlayerState.ENDED) {
      _showThankYouDialog();
    }
    if (mounted) {
      setState(() {
        _playerStatus = _controller.value.playerState.toString();
        _errorCode = _controller.value.errorCode.toString();
      });
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.list == null ? 0 : widget.list.length,
        itemBuilder: (context, i) {
          return Card(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: Text('E-Learning'),
                      leading: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    body: Column(
                      children: <Widget>[
                        YoutubePlayer(
                          aspectRatio: 16 / 9,
                          context: context,
                          videoId: widget.list[i]['contentDetails']['videoId'],
                          flags: YoutubePlayerFlags(
                            autoPlay: true,
                            showVideoProgressIndicator: true,
                            forceHideAnnotation: true,
                            disableDragSeek: false,
                          ),
                          progressColors: ProgressColors(
                            playedColor: Colors.amber,
                            handleColor: Colors.amberAccent,
                          ),
                          videoProgressIndicatorColor: Colors.amber,
                          onPlayerInitialized: (controller) {
                            _controller = controller;
                            _controller.addListener(listener);
                          },
                        ),
                        Slider(
                          inactiveColor: Colors.blueAccent,
                          value: _volume,
                          min: 0.0,
                          max: 100.0,
                          label: '${(_volume).round()}',
                          onChanged: (value) {
                            setState(() {
                              _volume = value;
                            });
                            _controller.setVolume(_volume.round());
                          },
                        ),
                      ],
                    ),
                  );
                })),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 210,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget.list[i]["snippet"]
                                ["thumbnails"]["high"]["url"]),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                    ),
                    new Text(
                      widget.list[i]["snippet"]["title"],
                      style: TextStyle(
                          fontSize: 18.0, fontFamily: "SF-Pro-Display-Bold"),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

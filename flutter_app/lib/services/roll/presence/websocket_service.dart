import 'dart:convert';

import 'package:flutter_app/model/Presence.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

class WebsocketService {
  late StompClient client;
  final dynamic updatePresences;
  final String rollId;

  WebsocketService({required this.updatePresences, required this.rollId});

  void onConnectCallback(StompFrame frame) {
    print("connected to websocket");
    client.subscribe(
        destination: '/topic/presences/$rollId',
        callback: (frame) {
          if (frame.body != null) {
            List<dynamic> jsonList = jsonDecode(frame.body!);
            List<Presence> students =
                jsonList.map((e) => Presence.fromJson(e)).toList();
            updatePresences(students);
          }
        });
  }

  initClient() {
    client = StompClient(
        config: StompConfig(
      url: 'ws://localhost:8443/websocket-endpoint',
      onConnect: onConnectCallback,
      onStompError: (frame) => print("Erro stomp"),
      onWebSocketError: (dynamic error) => print(error.message.toString()),
    ));

    client.activate();
  }

  deactivateClient() {
    client.deactivate();
  }
}

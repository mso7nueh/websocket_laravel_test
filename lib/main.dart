import 'package:flutter/material.dart';
import 'package:pusher_client/pusher_client.dart';

Map<String, String> params = {
  'host': 'socket.mobile-stage.eatvio.ru',
  'authEndpoint': 'https://mobile-stage.eatvio.ru/broadcasting/auth',
  'key': 'EiquuV7uy3aiReith0te',
  'channelName': 'private-new-chat-messages.21',
  'token': 'Bearer 63|laravel_sanctum_D72Pibpmw5A4zb9WvQUF12HqBWg3daWKDLq7eIoPbb09bb74',
};

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  PusherOptions options = PusherOptions(
    host: params['host']!,
    wssPort: 443,
    encrypted: true,
    auth: PusherAuth(
      params['authEndpoint']!,
      headers: {
        'Authorization': params['token']!,
      },
    ),
  );

  PusherClient pusherClient = PusherClient(
    params['key']!,
    options,
    autoConnect: true,
    enableLogging: true,
  );

  await pusherClient.connect();

  pusherClient.registerListener('classId', (data) => print(data));

  pusherClient.subscribe(params['channelName']!);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

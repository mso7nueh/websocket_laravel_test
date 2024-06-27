import 'package:flutter/material.dart';
import 'package:pusher_client/pusher_client.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  PusherOptions options = PusherOptions(
    host: 'socket.mobile-stage.eatvio.ru',
    wssPort: 443,
    encrypted: true,
    auth: PusherAuth(
      'https://mobile-stage.eatvio.ru/broadcasting/auth',
      headers: {
        'Authorization': 'Bearer 63|laravel_sanctum_D72Pibpmw5A4zb9WvQUF12HqBWg3daWKDLq7eIoPbb09bb74',
      },
    ),
  );

  PusherClient pusherClient = PusherClient(
    'EiquuV7uy3aiReith0te',
    options,
    autoConnect: true,
    enableLogging: true,
  );

  await pusherClient.connect();

  pusherClient.registerListener('classId', (data) => print(data));

  pusherClient.subscribe('private-new-chat-messages.21');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


import 'package:chat_poc/src/service/chat_service.dart';
import 'package:flutter/material.dart';

import 'src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final chatService = ChatService();
  await chatService.initialize();
  runApp(MyApp(chatService: chatService));
}

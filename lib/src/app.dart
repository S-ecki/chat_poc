import 'package:chat_poc/main.dart';
import 'package:chat_poc/src/service/chat_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import 'components/channel_page.dart';

class MyApp extends StatelessWidget {
  MyApp({
    required this.chatService,
    Key? key,
  }) : super(key: key);

  final ChatService chatService;

  final theme = ThemeData(
    primarySwatch: Colors.pink,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
      ],
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,
      theme: ThemeData(),
      builder: (context, widget) {
        return StreamChat(
          client: chatService.client,
          child: widget,
          streamChatThemeData: StreamChatThemeData.fromTheme(theme),
        );
      },
      home: StreamChannel(
        channel: chatService.channel,
        child: const ChannelPage(),
      ),
    );
  }
}

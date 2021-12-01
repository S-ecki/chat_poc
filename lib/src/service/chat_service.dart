import 'package:chat_poc/src/secrets/secrets.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

/// PoC implementation disregarding best practices
class ChatService {
  /// Create a new instance of [StreamChatClient] passing the apikey obtained from your
  /// project dashboard.
  late StreamChatClient client;
  late Channel channel;

  Future<void> initialize() async {
    client = StreamChatClient(
      Secrets.apiKey,
      logLevel: Level.SEVERE,
    );

    // should be done with proper backend (FireAuth)
    await client.connectUser(
      User(id: 'Secki'),
      Secrets.userKey,
    );

    // for demo purposes
    channel = client.channel('messaging', id: 'testchannel');

    /// `.watch()` is used to create and listen to the channel for updates. If the
    /// channel already exists, it will simply listen for new events.
    await channel.watch();
  }
}

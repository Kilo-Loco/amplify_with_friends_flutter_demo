import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_with_friends_flutter_demo/models/Message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MessagesView extends StatefulWidget {
  final String email;

  MessagesView({Key key, this.email}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MessagesViewState();
}

class _MessagesViewState extends State<MessagesView> {
  final _messageBodyController = TextEditingController();
  List<Message> _messages = [];

  @override
  void initState() {
    super.initState();
    _getMessages().then((value) => _observeMessages());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            _messagesListView(),
            _createMessageContainer(),
          ],
        ));
  }

  Widget _appBar() {
    return AppBar(
      leading: Container(),
      title: Text('Amplify With Friends'),
    );
  }

  Widget _messagesListView() {
    return ListView.builder(
        itemCount: _messages.length,
        itemBuilder: (context, index) {
          final message = _messages[index];
          return ListTile(
            title: Text(message.sender),
            subtitle: Text(message.body),
          );
        });
  }

  Widget _createMessageContainer() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: SafeArea(
        child: Row(
          children: [
            Flexible(
                child: TextField(
              controller: _messageBodyController,
            )),
            TextButton(onPressed: _sendMessage, child: Text('Send'))
          ],
        ),
      ),
    );
  }

  void _sendMessage() async {
    final newMessage = Message(
        body: _messageBodyController.text,
        sender: widget.email,
        creationDate: TemporalDateTime.now());

    try {
      await Amplify.DataStore.save(newMessage);
      print('saved message');
      _messageBodyController.text = '';
    } catch (e) {
      print(e);
    }
  }

  Future<void> _getMessages() async {
    try {
      final messages = await Amplify.DataStore.query(Message.classType);
      setState(() => _messages = messages);
    } catch (e) {
      print(e);
    }
  }

  void _observeMessages() {
    final stream = Amplify.DataStore.observe(Message.classType);
    stream.listen((_) => _getMessages());
  }
}

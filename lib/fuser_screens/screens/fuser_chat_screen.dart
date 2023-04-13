import 'package:flutter/material.dart';

import '../widgets/fuser_chat_sample.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  final clr = Color(0xFF7165D6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: clr,
          leadingWidth: 30,
          title: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage("assets/images/doctor1.jpg"),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "إسم الصيدلية",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ]),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(top: 8, right: 20),
              child: Icon(
                Icons.call,
                color: Colors.white,
                size: 26,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8, right: 10),
              child: Icon(
                Icons.video_call,
                color: Colors.white,
                size: 30,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8, right: 10),
              child: Icon(
                Icons.more_vert,
                color: Colors.white,
                size: 26,
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 8,
        padding: EdgeInsets.only(top: 20, left: 15, bottom: 80),
        itemBuilder: (context, index) => FuserChatSample(),
      ),
      bottomSheet: Container(
        height: 65,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 2,
            blurRadius: 10,
          )
        ]),
        child: Row(children: [
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Icon(
              Icons.add,
              size: 30,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Icon(
              Icons.emoji_emotions_outlined,
              color: Colors.amber,
              size: 30,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Container(
              alignment: Alignment.centerRight,
              width: MediaQuery.of(context).size.width / 1.6,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "أكتب أي شي",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.send,
              size: 30,
              color: clr,
            ),
          )
        ]),
      ),
    );
  }
}

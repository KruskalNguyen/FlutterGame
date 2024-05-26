import 'dart:ui';
import 'package:drainblood/Features/Home/presentation/widgets/chat_widget/chatchanel_widget.dart';
import 'package:drainblood/Features/Home/presentation/widgets/chat_widget/mess_bubble_widget.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatefulWidget {
  ChatWidget({Key? key}) : super(key: key);

  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  Color _colorBot1 = Colors.white;
  Color _colorBot2 = Color.fromARGB(0, 255, 255, 255);

  final TextEditingController _messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double heightContent = MediaQuery.of(context).size.height;
    final double widthContent = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.bottomLeft,
      child: SizedBox(
        height: heightContent * 0.42,
        width: widthContent * 0.4,
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 5,
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.black38),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _colorBot1 = Colors.white;
                            _colorBot2 = Color.fromARGB(0, 255, 255, 255);
                          });
                        },
                        child: ChatChannelWidget(
                          Name: 'Thế giới',
                          colorBot: _colorBot1,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _colorBot2 = Colors.white;
                            _colorBot1 = Color.fromARGB(0, 255, 255, 255);
                          });
                        },
                        child: ChatChannelWidget(
                          Name: 'Bạn bè',
                          colorBot: _colorBot2,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: widthContent * 0.4,
                    height: heightContent * 0.29,
                    child: ListView(
                      physics: AlwaysScrollableScrollPhysics(),
                      children: [
                        MessageBubble(
                          isMe: false,
                          message:
                              'Một con chim nhỏ bay lượn trên bầu trời xanh. Đôi cánh của nó vẫn đang rộng mở, mỗi cánh nhẹ nhàng di chuyển theo nhịp độ của gió. Bên dưới, cánh đồng mênh mông bao la, với những cánh hoa màu sắc tươi thắm nở rộ trong nắng mai. Con chim liệng đuôi lên xuống, nhấp nhô như một điệu nhảy nhẹ nhàng giữa không gian rộng lớn. Ánh nắng chiếu qua lông chim làm bộ lông của nó lung linh như một bức tranh tuyệt đẹp.',
                          senderName: 'An',
                          senderAvatar: '',
                        ),
                        MessageBubble(
                          isMe: true,
                          message: 'eim dep lam',
                          senderName: 'An',
                          senderAvatar: '',
                        ),
                        MessageBubble(
                          isMe: true,
                          message: 'đùa thôi',
                          senderName: 'An',
                          senderAvatar: '',
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                      width: widthContent * 0.4,
                      height: heightContent * 0.04,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              controller: _messageController,
                              decoration: InputDecoration(
                                hintText: 'Nhập tin nhắn...',
                                hintStyle: TextStyle(color: Colors.white38),
                                fillColor: Colors.white,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              String message = _messageController.text;
                              if (message.isNotEmpty) {
                                _messageController
                                    .clear(); // Xóa nội dung của TextField
                              }
                            },
                            child: Text('Gửi'),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    5), // Điều chỉnh độ cong của góc
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';
import 'package:tiktok/utils.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({super.key});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  bool _isWriting = false;
  final ScrollController _scrollController = ScrollController();

  void _onClosePressed() {
    Navigator.of(context).pop();
  }

  void _stopCommenting() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWriting = false;
    });
  }

  void _onStartWriting() {
    setState(() {
      _isWriting = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.7,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Sizes.size10,
        ),
      ),
      child: Scaffold(
        backgroundColor: isDark ? null : Colors.grey.shade50,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          //appbar의 backgroundcolor를 하드코딩하면
          //main.dart에서 만들었던 appBarTheme을 무시해버린다.
          backgroundColor: isDark ? null : Colors.white,
          automaticallyImplyLeading: false,
          title: const Text("22796 comments"),
          actions: [
            IconButton(
              onPressed: _onClosePressed,
              icon: const FaIcon(
                FontAwesomeIcons.xmark,
              ),
            ),
          ],
        ),
        body: GestureDetector(
          onTap: _stopCommenting,
          child: Stack(
            children: [
              Scrollbar(
                controller: _scrollController,
                child: ListView.separated(
                  controller: _scrollController,
                  padding: const EdgeInsets.only(
                    top: Sizes.size10,
                    bottom: Sizes.size96 + Sizes.size20,
                    left: Sizes.size16,
                    right: Sizes.size16,
                  ),
                  separatorBuilder: (context, index) => Gaps.v20,
                  itemCount: 10,
                  itemBuilder: (context, index) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: isDark ? Colors.grey.shade500 : null,
                        child: const Text("니꼬"),
                      ),
                      Gaps.h10,
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '니꼬',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Sizes.size14,
                                color: Colors.grey,
                              ),
                            ),
                            Gaps.v3,
                            Text("Thats not it ive seen the same thing"),
                          ],
                        ),
                      ),
                      Gaps.h10,
                      const Column(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.heart,
                            size: Sizes.size20,
                          ),
                          Gaps.v2,
                          Text(
                            '52.2k',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //stack 클래스에서만 쓰일 수 있으며 stack 클래스의 자식 위젯들의
              //위치를 조정할 때 쓰인다.
              //bottom 파라미터값 간단히 조정해보면 바로 뭔말인지 알게 된다.
              Positioned(
                bottom: 0,
                width: size.width,
                child: BottomAppBar(
                  //원래 white color가 아래처럼 적용되고 있었다.
                  //그래서 maind.dart에서 appBartheme이 있어도 개무시하고
                  //항상 white였는데 이걸 지워버리니까 appBarTheme에 따라
                  //움직이게 된다.
                  // color: Colors.white,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.grey.shade500,
                        foregroundColor: Colors.white,
                        child: const Text("니꼬"),
                      ),
                      Gaps.h10,
                      Expanded(
                        child: SizedBox(
                          height: Sizes.size44,
                          child: TextField(
                            onTap: _onStartWriting,
                            expands: true,
                            minLines: null,
                            maxLines: null,
                            textInputAction: TextInputAction.newline,
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: InputDecoration(
                              hintText: "Write a comment..",
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(Sizes.size12),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: isDark
                                  ? Colors.grey.shade800
                                  : Colors.grey.shade200,
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: Sizes.size10,
                                horizontal: Sizes.size12,
                              ),
                              suffixIcon: Padding(
                                padding:
                                    const EdgeInsets.only(right: Sizes.size14),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    //main.dart에서 iconTheme을 이용하면
                                    //좀더 나았을 것이다. 이렇게 하드코딩 안해줘도 됨.
                                    //플러터의 장점이 색깔을 전부 근본 클래스에서
                                    //지정해줄 수 있는 거라고 하네 다른 건 안된다는 이야긴가
                                    //[질문]TabBar에서 했던 것처럼 Theme.of(context)를 적용시킬 수도 있고, 가만히 냅두면 알아서 적용되기도 한다는데 둘의 차이점이 뭐지?
                                    FaIcon(
                                      FontAwesomeIcons.at,
                                      color: isDark
                                          ? Colors.grey.shade500
                                          : Colors.grey.shade900,
                                    ),
                                    Gaps.h14,
                                    FaIcon(
                                      FontAwesomeIcons.gift,
                                      color: isDark
                                          ? Colors.grey.shade500
                                          : Colors.grey.shade900,
                                    ),
                                    Gaps.h14,
                                    FaIcon(
                                      FontAwesomeIcons.faceSmile,
                                      color: isDark
                                          ? Colors.grey.shade500
                                          : Colors.grey.shade900,
                                    ),
                                    Gaps.h14,
                                    if (_isWriting)
                                      GestureDetector(
                                        onTap: _stopCommenting,
                                        child: FaIcon(
                                          FontAwesomeIcons.circleArrowUp,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

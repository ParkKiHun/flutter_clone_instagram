import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/components/avatar_widget.dart';
import 'package:flutter_clone_instagram/src/components/image_data.dart';
import 'package:flutter_clone_instagram/src/components/post_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: ImageData(
          icon: IconsPath.logo,
          width: 270,
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: ImageData(
                icon: IconsPath.directMessage,
                width: 50,
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          _stotyBoardList(),
          _postList(),
        ],
      ),
    );
  }

  Widget _stotyBoardList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(width: 20),
          _myStory(),
          const SizedBox(width: 5),
          ...List.generate(
            100,
            (index) => AvatarWidget(
                thumbPath:
                    "https://demo.ycart.kr/shopboth_farm_max5_001/data/editor/1612/cd2f39a0598c81712450b871c218164f_1482469221_493.jpg",
                type: AvatarType.TYPE1),
          ),
        ],
      ),
    );
  }
}

Widget _myStory() {
  return Stack(
    children: [
      AvatarWidget(
        thumbPath:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpvh3OIeLw_KFAXUwCPKMpEFt4Vy_UdRBhBQ&usqp=CAU",
        type: AvatarType.TYPE2,
        size: 70,
      ),
      Positioned(
        right: 5,
        bottom: 0,
        child: Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: const Center(
            child: Text(
              "+",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                height: 1.1,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _postList() {
  return Column(
    children: List.generate(50, (index) => const PostWidget()),
  );
}

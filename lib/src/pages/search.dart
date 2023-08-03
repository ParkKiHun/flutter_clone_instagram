import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/pages/search/search_focus.dart';
import 'package:quiver/iterables.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<List<int>> groupBox = [[], [], []];
  List<int> groupIndex = [0, 0, 0];

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < 100; i++) {
      var gi = groupIndex.indexOf(min<int>(groupIndex)!);
      var size = 1;
      if (gi != 1) {
        size = Random().nextInt(100) % 2 == 0 ? 1 : 2;
      }
      groupBox[gi].add(size);
      groupIndex[gi] += size;
    }
  }

  Widget _appbar() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              // context.pushNamed("searchFocus");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchFocus(),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              margin: const EdgeInsets.only(left: 15, top: 5, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: const Color(0xffefefef),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search_outlined),
                  Text(
                    '검색',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff838383),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(Icons.location_pin),
        ),
      ],
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          groupBox.length,
          (index) => Expanded(
            child: Column(
              children: List.generate(
                groupBox[index].length,
                (jindex) => Container(
                  height: MediaQuery.of(context).size.height *
                      0.33 *
                      0.66 *
                      groupBox[index][jindex],
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    color: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)],
                  ),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://sony.scene7.com/is/image/sonyglobalsolutions/feature_01_mobile?\$toutMobile\$",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
        // children: [
        //   Expanded(
        //     child: Column(
        //       children: [
        //         Container(
        //           height: 140,
        //           color: Colors.red,
        //         ),
        //       ],
        //     ),
        //   ),
        //   Expanded(
        //     child: Column(
        //       children: [
        //         Container(
        //           height: 140,
        //           color: Colors.blue,
        //         ),
        //       ],
        //     ),
        //   ),
        //   Expanded(
        //     child: Column(
        //       children: [
        //         Container(
        //           height: 140,
        //           color: Colors.grey,
        //         ),
        //       ],
        //     ),
        //   ),
        // ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _appbar(),
          Expanded(child: _body()),
        ],
      ),
    );
  }
}

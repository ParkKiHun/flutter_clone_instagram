import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/components/image_data.dart';
import 'package:flutter_clone_instagram/src/viewmodel/bottom_nav_viewmodel.dart';
import 'package:provider/provider.dart';

class SearchFocus extends StatefulWidget {
  const SearchFocus({super.key});

  @override
  State<SearchFocus> createState() => _SearchFocusState();
}

class _SearchFocusState extends State<SearchFocus>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  Widget _tabMenuOne(String memu) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Text(
        memu,
        style: const TextStyle(fontSize: 15, color: Colors.black),
      ),
    );
  }

  Widget _body() {
    return Container(
      child: TabBarView(
        controller: tabController,
        children: const [
          Center(child: Text("인기페이지")),
          Center(child: Text("계정폐이지")),
          Center(child: Text("오디오페이지")),
          Center(child: Text("태그페이지")),
          Center(child: Text("장소페이지")),
        ],
      ),
    );
  }

  PreferredSizeWidget _tabMemu() {
    return PreferredSize(
      preferredSize: Size.fromHeight(AppBar().preferredSize.height),
      child: Container(
        height: AppBar().preferredSize.height,
        width: Size.infinite.width,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xffe4e4e4),
            ),
          ),
        ),
        child: TabBar(
          controller: tabController,
          indicatorColor: Colors.black,
          tabs: [
            _tabMenuOne('인기'),
            _tabMenuOne('계정'),
            _tabMenuOne('오디오'),
            _tabMenuOne('태그'),
            _tabMenuOne('장소'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Provider.of<BottomNavViewModel>(context, listen: false)
              .willPopAction(context),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ImageData(icon: IconsPath.backBtnIcon),
          ),
        ),
        titleSpacing: 0,
        title: Container(
          margin: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: const Color(0xffefefef),
          ),
          child: const TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '검색',
              contentPadding: EdgeInsets.only(left: 15, top: 7, bottom: 7),
              isDense: true,
            ),
          ),
        ),
        bottom: _tabMemu(),
      ),
      body: _body(),
    );
  }
}

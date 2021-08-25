import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_scroll_to_index/scroll_to_index_base.dart';

class ScrollToIndex extends StatefulWidget {
  final IndexedWidgetBuilder itemBuilder;
  final List<ScrollToIndexBaseObject> list;
  final Duration? duration;
  final double topDistance;
  final ScrollToIndexController? controller;

  const ScrollToIndex({Key? key, required this.list, this.duration, this.topDistance = 0, required this.controller, required this.itemBuilder}) : super(key: key);

  @override
  _ScrollToIndexState createState() => _ScrollToIndexState();
}

class _ScrollToIndexState extends State<ScrollToIndex> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _scrollKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _bindController();
  }

  // 绑定控制器
  void _bindController() {
    widget.controller?._bind(this);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: _scrollKey,
      controller: _scrollController,
      child: ListView.builder(
        itemBuilder: widget.itemBuilder,
        itemCount: widget.list.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant ScrollToIndex oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      _bindController();
    }
  }

  // 滑动到指定下标的item
  void scrollToIndex(int index) {
    if (index > widget.list.length) {
      return;
    }
    ScrollToIndexBaseObject item = widget.list[index];
    if (item.globalKey.currentContext != null) {
      RenderBox renderBox = item.globalKey.currentContext!.findRenderObject() as RenderBox;
      double dy = renderBox.localToGlobal(Offset.zero, ancestor: _scrollKey.currentContext!.findRenderObject()).dy;
      var offset = dy + _scrollController.offset;
      double stateTopHei = MediaQueryData.fromWindow(window).padding.top;
      _scrollController.animateTo(offset - stateTopHei - widget.topDistance, duration: widget.duration ?? Duration(milliseconds: 500), curve: Curves.linear);
    } else {
      print("Please bind the key to the widget in the outermost layer of the Item layout");
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}

class ScrollToIndexController {
  _ScrollToIndexState? _scrollToIndexState;

  /// 滑动到指定位置
  void to(int index) {
    _scrollToIndexState!.scrollToIndex(index);
  }

  void dispose() {
    this._scrollToIndexState = null;
  }

  void _bind(_ScrollToIndexState state) {
    this._scrollToIndexState = state;
  }
}

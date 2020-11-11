import 'package:flutter/material.dart';
import 'package:flutter_scroll_to_index/scroll_to_index_base.dart';
import 'package:flutter_scroll_to_index/scroll_to_item.dart';

class ScrollToIndexTestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<ScrollToIndexTestPage> {

  ScrollToIndexController _scrollToIndexController = ScrollToIndexController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试"),
        actions: [
          FlatButton(onPressed: (){
            _scrollToIndexController.to(6);
          }, child: Text("滑动到index=6"))
        ],
      ),
      body: ScrollToIndex(itemBuilder:(context, index) {
        TestObject item = objs[index];
        return Card(
          key: item.globalKey,
          elevation: 20,
          margin: EdgeInsets.all(20),
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Text(item.name),
                Text("${item.age}"),
              ],
            ),
          ),
        );
      },list: objs,controller: _scrollToIndexController,),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollToIndexController.dispose();
  }
}

class TestObject extends ScrollToIndexBaseObject {
  final String name;
  final int age;

  TestObject(this.name, this.age);
}

final List<TestObject> objs = List.generate(20, (index) => TestObject("典典${index + 1}", 22 + index));

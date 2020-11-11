# flutter_scroll_to_index

[![pub](https://badgen.net/pub/v/flutter_scroll_to_index)](https://pub.dev/packages/flutter_scroll_to_index)

### flutter滚动组件
Listview 滑动到指定item,类似于定位功能

# 如何使用?
##### 1.创建控制器
```dart
final ScrollToIndexController _scrollToIndexController = ScrollToIndexController();
```
##### 2.自定义模型对象
注意自定义对象一定要继承`ScrollToIndexBaseObject `类
```dart
class TestObject extends ScrollToIndexBaseObject {
  final String name;
  final int age;
  TestObject(this.name, this.age);
}
```
##### 3.在页面中使用widget
使用组件`ScrollToIndex`
```dart
      ScrollToIndex(
        itemBuilder: (context, index) {
          TestObject item = objs[index]; // 模型 model
          return Card(
            key: item.globalKey, // 必须要的,用来定位,ScrollToIndexBaseObject 的属性
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
        },
        list: objs, // 必须要的 model模型列表, 是个数组
        controller: _scrollToIndexController, // 必须要的 controller 
      )
```
##### 4.滑动到指定index
使用`_scrollToIndexController.to(int index)`方法滑动到指定item
```dart
_scrollToIndexController.to(6);
```
##### 6.销毁
```dart
_scrollToIndexController.dispose();
```

##### 数组
```dart
final List<TestObject> objs = List.generate(20, (index) => TestObject("典典${index + 1}", 22 + index));
```

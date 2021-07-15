/**
 * 待实现功能
 * 1、下拉刷新、上拉加载更多
 * 2、空白页面
 * 参考：https://github.com/damengzai/flutter-test
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

typedef BGListViewFunction = Future Function();

class BGListView extends StatefulWidget {
  final List listData; // 列表数据
  final Widget Function(BuildContext, int) itemBuilder; // 单个样式
  final void Function(int)? didClickItem; // 点击某个样式 
  final Axis scrollDirection; // 滚动方向
  final BGListViewFunction? onLoad;
  final BGListViewFunction? onRefresh;
  final bool enablePulldown;
  final bool enablePullup;

  // 构造函数
  const BGListView(
      {required this.listData,
      required this.itemBuilder,
      this.onLoad,
      this.onRefresh,
      this.didClickItem,
      this.scrollDirection = Axis.vertical,
      this.enablePullup = false,
      this.enablePulldown = false})
      : super();

  @override
  State<StatefulWidget> createState() {
    return _BGListViewState();
  }
}

class _BGListViewState extends State<BGListView> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: widget.enablePulldown,
      enablePullUp: widget.enablePullup,
      header: WaterDropHeader(),
      footer: CustomFooter(builder: (BuildContext context, LoadStatus? mode) {
        Widget body;
        if (mode == LoadStatus.idle) {
          body = Text("上拉加载");
        } else if (mode == LoadStatus.loading) {
          body = CupertinoActivityIndicator();
        } else if (mode == LoadStatus.failed) {
          body = Text("加载失败！点击重试!");
        } else if (mode == LoadStatus.canLoading) {
          body = Text("松手，加载更多!");
        } else {
          body = Text("没有更多数据了!");
        }
        return Container(
          height: 55.0,
          child: Center(child: body),
        );
      }),
      onRefresh: _onRefresh,
      onLoading: _onLoad,
      controller: _refreshController,
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return buildItem(context, index);
        },
        scrollDirection: widget.scrollDirection,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: widget.listData.length,
      ),
    );
  }

  Widget buildItem(BuildContext context, int index) {
    return GestureDetector(
      child: widget.itemBuilder(context, index),
      onTap: () {
        if (widget.didClickItem != null) {
          widget.didClickItem!(index);
        }
      },
    );
  }

  void _onRefresh() async {
    if (widget.onRefresh != null) {
      await widget.onRefresh!();
      _refreshController.refreshCompleted();
    }
  }

  void _onLoad() async {
    if (widget.onLoad != null) {
      await widget.onLoad!();
      _refreshController.loadComplete();
    }
  }
}

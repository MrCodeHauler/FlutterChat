import 'package:flutter/material.dart';
import 'package:hello_world/common/bgSliver.dart';

class SliverWidget extends StatefulWidget {

  final AppBarBehavior appBarBehavior;

  SliverWidget({Key? key, this.appBarBehavior: AppBarBehavior.pinned}) : super(key: key);

  @override
  createState() => _SliverWidgetState();
}

class _SliverWidgetState extends State<SliverWidget> {
  List<PopupMenuEntry<AppBarBehavior>> itemBuilder(BuildContext context) {
    return <PopupMenuItem<AppBarBehavior>>[
              PopupMenuItem<AppBarBehavior>(
                value: AppBarBehavior.normal,
                child: Text(
                  'App bar scrolls away',
                  style: TextStyle(
                      color: widget.appBarBehavior == AppBarBehavior.normal
                          ? Colors.red
                          : Colors.black54),
                )),
              PopupMenuItem<AppBarBehavior>(
                value: AppBarBehavior.pinned,
                child: Text('App bar stays put',
                    style: TextStyle(
                        color: widget.appBarBehavior == AppBarBehavior.pinned
                            ? Colors.red
                            : Colors.black54)
                )),
                PopupMenuItem<AppBarBehavior>(
                    value: AppBarBehavior.floating,
                    child: Text('App bar floats',
                        style: TextStyle(
                            color: widget.appBarBehavior == AppBarBehavior.floating
                                ? Colors.red
                                : Colors.black54))),
            ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sliver Demo')),
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            pinned: false,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Demo'),
            ),
            actions: <Widget>[
              PopupMenuButton(
                onSelected: (AppBarBehavior value) {
                  setState(() {
                    appBarBehavior = value;
                  });
                },
                itemBuilder: itemBuilder,
              ),
            ],
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('Grid Item $index'),
                );
              },
              childCount: 20,
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: Text('List Item $index'),
                );
              },
            ),
          ),
        ],
      )
    );
  }
}
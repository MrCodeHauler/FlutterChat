import 'package:flutter/material.dart';

// ---------------------- ParentWidget ----------------------
class ParentWidgetC extends StatefulWidget {
  @override
  _ParentWidgetCState createState() => new _ParentWidgetCState();
}

class _ParentWidgetCState extends State<ParentWidgetC> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TapBoxC(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}


// ---------------------- TapBoxC ----------------------

class TapBoxC extends StatefulWidget {

  final bool active;
  final ValueChanged<bool> onChanged;

  TapBoxC({Key key, this.active: false, @required this.onChanged}): super(key: key);

  @override
  _TapBoxCState createState() => new _TapBoxCState();
}


class _TapBoxCState extends State<TapBoxC> {

  bool _highlight = false;

  void _hanldeTap() {
    widget.onChanged(!widget.active);
  }

  void _hanldeTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _hanldeTap,
      onTapUp: _hanldeTapUp,
      onTapDown: _handleTapDown,
      onTapCancel: _handleTapCancel,
      child: new Container(
        child: new Center(
          child: new Text(
            widget.active ? 'Active' : 'InActive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight ? new Border.all(color: Colors.teal[700], width: 10.0) : null,
        ),
      ),
    );
  }
}


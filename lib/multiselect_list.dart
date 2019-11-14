import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GmailMultiSelectList extends StatefulWidget {
  final List<Widget> actions;
  final AppBar defaultAppBar;
  @required
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final Set<int> selections;
  final VoidCallback clearSelection;
  Color selectedColor=Colors.grey[300];

  GmailMultiSelectList(
      {this.itemBuilder,
      this.itemCount,
      this.defaultAppBar,
      this.actions,
      this.selections,
      this.clearSelection,
      this.selectedColor});

  @override
  State<StatefulWidget> createState() {
    return _GmailMultiSelectListState();
  }
}

class _GmailMultiSelectListState extends State<GmailMultiSelectList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: widget.selections.length == 0
            ? widget.defaultAppBar
            : AppBar(
                automaticallyImplyLeading: true,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: widget.clearSelection,
                ),
                actions: widget.actions,
                title: Text(widget.selections.length.toString()),
              ),
        body: ListView.builder(
          itemCount: widget.itemCount,
          itemBuilder: (context, idx) {
            return Card(
                color: widget.selections.contains(idx)?widget.selectedColor:Colors.white, child: widget.itemBuilder(context, idx));
          },
        ));
  }
}

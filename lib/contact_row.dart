import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactRow extends StatefulWidget {
  final int idx;
  final void Function(int,bool) onSelection;
 final bool clearSelection;

  ContactRow(this.idx,this.onSelection,this.clearSelection);
  @override
  _ContactRowState createState() => new _ContactRowState();
}

class _ContactRowState extends State<ContactRow> {
  var isSelected = false;
  var mycolor=Colors.white;

  @override
  Widget build(BuildContext context) {
    isSelected=checkSelected();
    return new Card(
      color: checkSelected()?Colors.grey[300]:Colors.white,
      child:
        new ListTile(
            selected: isSelected,
            leading: InkWell(child: Icon(isSelected?Icons.check:Icons.person),onTap: toggleSelection),
            title: new Text("Test"),
            subtitle: new Text("Test Desc"),
            trailing: new Text(widget.idx.toString())
        )
    );
  }

  bool checkSelected(){
    return widget.clearSelection?false:isSelected;
  }

  void toggleSelection() {
    setState(() {
      isSelected=!isSelected;
    });
    widget.onSelection(widget.idx,isSelected);

  }
}
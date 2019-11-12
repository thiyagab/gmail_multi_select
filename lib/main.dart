import 'package:flutter/material.dart';
import 'package:sampleflutter/contact_row.dart';
import 'package:sampleflutter/multiselect_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool clearSelection=false;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
//    Navigator.push(context, MaterialPageRoute(builder: (context) => NewPage()));
  }

  List<String> items = ["Thiyaga","Aadhav","Kalai"];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: selections.length==0?AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ):AppBar(
        automaticallyImplyLeading: true,

        leading: IconButton(icon:Icon(Icons.arrow_back),
          onPressed:() => {setState(()=>{
            clearSelection=true,
            _selections=new Set()
          })},
        ),

        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {

            },
          ),
          IconButton(
            icon: Icon(Icons.star),
            onPressed: () {

            },
          ),
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {

            },
          ),


        ],
        title: Text(selections.length.toString()),

      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, idx) {return ContactRow(idx,onSelection,clearSelection);},
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }



  @override
  Widget build1(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return GmailMultiSelectList(itemBuilder:(context,idx){return getListTile(idx);},
    itemCount: 3,
    actions:actionButtons(),
    defaultAppBar: AppBar(title:Text("hii")),
      selections:selections,
      clearSelection: clearSelections,
    );

  }

  ListTile getListTile(int idx){
    return new ListTile(
        leading: InkWell(child: Icon(Icons.person),onTap:()=> {onSelected(idx)}),
        title: new Text("Test"),
        subtitle: new Text("Test Desc"),
        trailing: new Text(idx.toString())
    );
  }


  List<Widget> actionButtons(){
   return List()
      ..add(IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {

        },
      ))
    ..add(IconButton(
    icon: Icon(Icons.star),
    onPressed: () {

    },
    ))
    ..add(IconButton(
    icon: Icon(Icons.check),
    onPressed: () {

    },
    ));
  }



  Set<int> _selections=new Set();
  get selections=>_selections;

  void onSelection(int idx,bool isSelect){
      clearSelection=false;
      if(isSelect){
        selections.add(idx);
      }else{
        selections.remove(idx);
      }
      setState(() {

      });

  }

  void onSelected(int idx){

    setState(() {
      _selections.add(idx);
    });

  }



  void clearSelections() {
    setState(() {
      clearSelection=true;
      _selections=new Set();
    });
  }
}



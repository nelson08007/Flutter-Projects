import 'package:flutter/material.dart';
import 'package:stopper/screens/wifiscreen.dart';
String vh ;
class GlobalScreen extends StatefulWidget {
  @override
  _GlobalScreenState createState() => _GlobalScreenState();
}

class _GlobalScreenState extends State<GlobalScreen> with SingleTickerProviderStateMixin{
  bool isSearching=false;

  TabController _tabController;
  @override
  void initState() {

    super.initState();
    _tabController=new TabController(length: 2, vsync: this);
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          title: !isSearching ? Text("Vehicle Stopper")
              : TextField(
            keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.characters,
              onChanged: (newText1){
                vh=newText1;
              },
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                icon: Icon(Icons.search_rounded, color: Colors.white,),
                hintText: "Search vehicle ",
                hintStyle: TextStyle(color: Colors.white),
              )

          ),
          actions: [
            isSearching ?
            IconButton(icon: Icon(Icons.cancel), onPressed: (){
              setState(() {
                this.isSearching=false;
              });
            }) :
            IconButton(icon: Icon(Icons.search_rounded), onPressed: (){
              setState(() {
                this.isSearching=true;
              });
            })
          ],
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                icon: Icon(Icons.wifi),
                text: "Local ",
              ),
              Tab(
                icon: Icon(Icons.signal_cellular_connected_no_internet_4_bar_rounded),
                text: "Global",
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: new TabBarView(
            controller: _tabController,
            children: <Widget>[
              WifiScreen(),
          gscn(),

        ])
      ),
    );
  }
}

class gscn extends StatefulWidget {
  @override
  _gscnState createState() => _gscnState();
}

class _gscnState extends State<gscn> {
  @override
  Widget build(BuildContext context) {
    return vh == "YAMAHA YBX TN59M6439" ? WifiScreen() : Container(
      child: Center(
        child:
        Text("Search vehicle Model name and  number"),
      ),
    );
  }
}


import 'package:box_aload/Components/dark.dart';
import 'package:line_icons/line_icons.dart';
import 'package:box_aload/Authentication/Signin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:box_aload/Components/fader.dart';
import 'package:box_aload/MobileScreens/Advertisermob.dart';
import 'package:box_aload/MobileScreens/Contactmob.dart';
import 'package:box_aload/MobileScreens/Ridersmob.dart';
import 'package:box_aload/MobileScreens/Teammob.dart';
import 'package:url_launcher/url_launcher.dart';

class Homemob extends StatefulWidget {
  @override
  _HomemobState createState() => _HomemobState();
}
Color backgroundColor = Color.fromRGBO(167,232,144, 1);
Color darkerColor = Color.fromRGBO(52,143,3, 1);
const double pi = 3.1415926535897932;

class _HomemobState extends State<Homemob> {

  ScrollController? _scrollController;

  double get screenHeight => MediaQuery.of(context).size.height;

  double get screenWidth => MediaQuery.of(context).size.width;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    super.dispose();
  }

  double get offset =>
      _scrollController!.hasClients ? _scrollController!.offset : 0.0;





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
              flexibleSpace: Image(
                image: AssetImage(
                    "assets/sky3.png"
                ),
                fit: BoxFit.cover ,
              ),
              //backgroundColor: Colors.transparent,
              elevation: 10.0,
              leading: Builder(builder: (context) => // Ensure Scaffold is in context
              IconButton(
                  icon: Icon(Icons.menu,color: Colors.white,),
                  onPressed: () => Scaffold.of(context).openDrawer()
              )),
              title:   Image.asset("assets/Logo.png",
                width: 80.0,
                height: 80.0,
              ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.black,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn() ));
            },
            icon: Icon(
                Icons.person,
                color: Colors.green
            ),
            label: Text("REGISTER",
              style: TextStyle(
                  color: Colors.white
              ),
            )
        ),

      drawer: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        child: Drawer(
          child: SafeArea(
            child: Container(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Container(
                    height: 80.0,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/Logo.png",
                          // width: 200.0,
                          // height: 200.0,
                        ),
                        SizedBox(width: 40,),
                      ],
                    ),),
                  Container(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Homemob() ));
                      },
                      leading: Icon(Icons.home, size: 20.0,color: Colors.green, ),
                      title: Text("Home",style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),),
                      dense: true,
                    ),
                  ),
                  Container(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Ridersmob() ));
                      },
                      leading: Icon(Icons.pedal_bike, size: 20.0,color: Colors.green,),
                      title: Text("Riders",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),),
                      dense: true,
                      // padding: EdgeInsets.zero,
                    ),
                  ),
                  Container(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Admob() ));
                      },
                      leading:
                      Icon(Icons.campaign, size: 20.0,color: Colors.green,),
                      title: Text("Advertisers",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),),
                      dense: true,
                      // padding: EdgeInsets.zero,
                    ),
                  ),
                  Container(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Teammob() ));
                      },
                      leading:
                      Icon(Icons.group, size: 20.0,color: Colors.green,),
                      title: Text("Team",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),),
                      dense: true,
                      // padding: EdgeInsets.zero,
                    ),
                  ),
                  Container(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Contactmob() ));
                      },
                      leading:
                      Icon(Icons.contact_mail, size: 20.0,color: Colors.green,),
                      title: Text("Contact",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),),
                      dense: true,
                      // padding: EdgeInsets.zero,
                    ),
                  ),
                  Container(
                    child: ListTile(
                      leading:
                      Icon(Icons.nightlight_round, size: 20.0,color: Colors.green,),
                      title: Text("Darkmode",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),),
                      trailing: ChangeThemeButtonWidget(),
                      dense: true,
                      // padding: EdgeInsets.zero,
                    ),
                  ),
                  Container(
                    height: 400,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: backgroundColor,
      body: Stack (
        children: <Widget>[
          Positioned(
            top: -0.3 * offset,
            left: 0,
            right: 0,
            height: screenHeight,
            child: RepaintBoundary(
              child: Image.asset(
                'assets/sky1.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          //Header(),

          Positioned(
            top: 0.1 * screenHeight,
            left: 0,
            right: 0,
            child: MainText(),
          ),
          Positioned(
            top: screenHeight * 0.45 - 0.65 * offset,
            right: 0,
            left: 0,
            height: screenHeight * 0.4,
            child: RepaintBoundary(
              child: Image.asset(
                'assets/stockholm.png',
                fit: BoxFit.cover,
                alignment: Alignment(0, -0.2),
              ),
            ),
          ),
          //header

          Positioned(
            top: screenHeight * 0.85 - 1 * offset,
            left: 0,
            right: 0,
            height: screenHeight / 3,
            child: RepaintBoundary(
              child: Image.asset(
                'assets/water.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.8 - 1 * offset,
            left: 0,
            right: 0,
            height: screenHeight * 0.2,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0, 1],
                  colors: [backgroundColor.withOpacity(0), backgroundColor],
                ),
              ),
            ),
          ),
//              Positioned(
//                top: screenHeight * 0.95 - 1 * offset,
//                left: 0,
//                right: 0,
//                height: screenHeight / 3,
//                child: Container(
//                  height: screenHeight / 3,
//                  width: double.infinity,
//                  color: backgroundColor,
//                ),
//              ),
          Scrollbar(
            child: ListView(
              cacheExtent: 64,
              controller: _scrollController,
              children: <Widget>[
                Container(height: screenHeight),
                Container(
                  height: 100,
                  color: backgroundColor,
                ),
                Container(
                  color: backgroundColor,
                  child: Page1(),
                ),
                Page2(),
                Page3(),
                Container(
                  height: 100,
                  color: darkerColor,
                ),
              ],
            ),
          ),
        ],
      ),

      // CustomScrollView(
      //   slivers: [
      //     SliverAppBar(
      //       backgroundColor: Colors.white,
      //       expandedHeight: 200,
      //       floating: true,
      //       flexibleSpace: FlexibleSpaceBar(
      //         title:  Container(
      //           child: Image.asset("assets/Logo.png",
      //              width: 60.0,
      //              height: 60.0,
      //           ),
      //         ),
      //         centerTitle: true,
      //       ),
      //         leading: Builder(builder: (context) => // Ensure Scaffold is in context
      //         IconButton(
      //             icon: Icon(Icons.menu,color: Colors.black,),
      //             onPressed: () => Scaffold.of(context).openDrawer()
      //         )),
      //       actions: [
      //         Row(
      //           children: [
      //             TextButton(
      //               onPressed: (){
      //                 Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn() ));
      //               },
      //               child: Container(
      //                 height: 30.0,
      //                 padding: EdgeInsets.symmetric(horizontal: 15.0,),
      //                 decoration: BoxDecoration(
      //                   color: Colors.black,
      //                   borderRadius: BorderRadius.circular(8.0),),
      //                 child: Center(
      //                   child: Text("Get Started",
      //                     style: TextStyle(
      //                       color: Colors.white,
      //                       //fontWeight: FontWeight.w700,
      //                       fontSize: 15,
      //                     ),),
      //                 ),),
      //             ),
      //             SizedBox(width: 15,),
      //           ],
      //         ),
      //       ],
      //     ),
      //     buildComponents(),
      //   ],
      // ),

    );
  }
}


class MainText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Text(
        //   'THE ADVERTISING COMPANY',
        //   style: TextStyle(color: Colors.greenAccent),
        // ),
        SizedBox(height: 16),
        // Container(
        //   height: 1,
        //   width: 64,
        //   color: backgroundColor,
        // ),
        SizedBox(height: 32),
        Text(
          'Let us take care of your\n Company\'s Advertisement',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30
            //MediaQuery.of(context).size.shortestSide > 400 ? 60 : 30,
          ),
        ),
        SizedBox(height: 32),
        RotatedBox(
          quarterTurns: 2,
          child: Icon(LineIcons.angleDoubleUp, color: Colors.grey),
        ),
        SizedBox(height: 16),
        Text('SCROLL DOWN', style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return FractionallySizedBox(
      widthFactor: 0.7,
      child: Column(
        children: <Widget>[
          Text(
            'THE MODERN',
            style: TextStyle(
              //fontFamily: 'Roboto',
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Avertising',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Text(
                ' Techniques',
                style: TextStyle(color: Colors.black, fontSize: 30),
              )
            ],
          ),
          SizedBox(height: height * 0.1),
          if (width > 440)
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    // 'The ancient Egyptian civilization, famous for its pyramids, pharaohs, mummies, and tombs, flourished for thousands for thousands of yers. But what was its lasting impact?'
                    'The modern Advertising techniques are used , for taking your advertisement to the next level of reach and gain popularity of your company with affordable costs ',
                  ),
                ),
                SizedBox(width: 64),
                Expanded(
                  child: Text(
                    //'Watch the video below to learn how ancient Egypt contributed to modern-day society with its many cultural developments, particularly in language & mathematics'
                    'Watch the video below to learn about the working of our advertising techniques ,  you will get an understanding of how we operate and our innovative methods',
                  ),
                )
              ],
            )
          else ...[
            Text(
              //'The ancient Egyptian civilization, famous for its pyramids, pharaohs, mummies, and tombs, flourished for thousands for thousands of yers. But what was its lasting impact?'
              'The modern Advertising techniques are used , for taking your advertisement to the next level of reach and gain popularity of your company with affordable costs ',
            ),
            SizedBox(height: 16),
            Text(
              'Watch the video below to learn about the working of our advertising techniques ,  you will get an understanding of how we operate and our innovative methods',
              //'Watch the video below to learn how ancient Egypt contributed to modern-day society with its many cultural developments, particularly in language & mathematics',
            )
          ],
          SizedBox(height: height * 0.1),
        ],
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: backgroundColor,
      height: height > width ? height * 0.5 : height * 0.8,
      width: double.infinity,
      child: Stack(
        children: <Widget>[

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: height * 0.4,
            child: Container(
              color: darkerColor,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: EntranceFader(
              offset: Offset(0, height * 0.4),
              duration: Duration(seconds: 1),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                     Image.asset(
                       'assets/Cycle I.jpg',
                      fit: BoxFit.fitWidth,
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    Future.delayed(
      Duration(milliseconds: 1000),
          () {
        if (mounted) _animationController!.forward();
      },
    );
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: darkerColor,
      child: FractionallySizedBox(
        widthFactor: 0.7,
        child: Column(
          children: <Widget>[
            SizedBox(height: height * 0.1),
            Text('Things to know', style: TextStyle(color: Colors.black)),
            SizedBox(height: height * 0.05),
            _header(),
            SizedBox(height: height * 0.1),
            if (width > height)
              Row(
                children: <Widget>[
                  Expanded(child: _leftSide(width)),
                  SizedBox(width: width * 0.1),
                  Expanded(child: _rightSide(height, width))
                ],
              )
            else ...[
              _leftSide(width),
              SizedBox(height: 20),
              _rightSide(height, width),
            ],
            SizedBox(height: height * 0.1),
          ],
        ),
      ),
    );
  }

  RichText _header() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          color: Colors.white,
          fontSize: 40,
          //fontFamily: 'IbarraRealNova',
        ),
        children: [
          TextSpan(
            text: 'You probably didn\'t know\n',
          ),
          TextSpan(
            text: 'about ',
          ),
          TextSpan(
            text: 'BOXALOAD',
            style: TextStyle(
              color: Colors.black,
              //fontFamily: 'IbarraRealNova',
            ),
          )
        ],
      ),
    );
  }

  Widget _rightSide(double height, double width) {
    return EntranceFader(
      offset: Offset(width / 2, 0),
      delay: Duration(milliseconds: 1000),
      duration: Duration(seconds: 1),
      child: Container(
        height: height / 2,
        child: Stack(
          alignment: Alignment(0, 0.5),
          children: <Widget>[
            AnimatedBuilder(
              animation: _animationController!,
              builder: (context, _) {
                return Transform.rotate(
                  angle: _animationController!.value * 0.5 * pi - pi * 0.7,
                  child: Container(
                    width: 360,
                    height: 360,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.7),
                          Colors.white.withOpacity(0),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                );
              },
            ),
            Image.asset('assets/map.png'),
          ],
        ),
      ),
    );
  }

  Widget _leftSide(double width) {
    return EntranceFader(
      offset: Offset(-width / 2, 0),
      delay: Duration(milliseconds: 1000),
      duration: Duration(seconds: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Where are \n WE ?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 38,
            ),
          ),
          SizedBox(height: 32),
          Text(
            //'Tutankhamun was originally named Tutanhaten. This name, whic literally means "living image of the Aten", reflected the fact that Tutankhaten\'s parents worshipped a sun god known as "the Aten". After a few years on the throne the young king.'
            'We are currently operate in capital of sweden , stockholm. We have plans to expand our business to various cities in near future . If you want to have our service in our locality kindly fill the details by clicking the below button',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 60),
          // Text(
          //   'Reach Us',
          //   style: TextStyle(
          //     decoration: TextDecoration.underline,
          //     color: Colors.black,
          //     fontSize: 24,
          //   ),
          // ),
        ],
      ),
    );
  }
}




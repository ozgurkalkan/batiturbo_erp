import 'package:bati_turbo_erp/screens/customer_details_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../utils/sign_in.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State < MainScreen > {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return mainScreenWidget();
  }

  Widget mainScreenWidget() {
    if (uname != null) {
      return _mainScreen();
    } else {
      return _loginScreen();
    }
  }

  Widget _mainScreen() {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CustomerPage()));
          },
          label: Text("Müşteri Ekle"),
          icon: Icon(Icons.add),
        ),
        body: Container(
          color: Theme.of(context).primaryColor,
          child: SafeArea(

            child: NestedScrollView(

              headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    floating: false,
                    title: Text("Batı Turbo ERP System"),
                    actions: < Widget > [
                      IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.more_vert),
                        onPressed: () {},
                      ),
                      CircleAvatar(
                        backgroundImage: NetworkImage(uimageUrl),
                      )
                    ]
                  )
                ];
              },
              body: Container(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: < Widget > [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: < Widget > [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20.0, top: 10.0),
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF18D191),
                                    borderRadius: BorderRadius.circular(9.0)),
                                  child: Text("Toplam Alacak:",
                                    style: TextStyle(
                                      fontSize: 20.0, color: Colors.white))),
                              ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: < Widget > [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: Colors.red[400],
                                    borderRadius: BorderRadius.circular(9.0)),
                                  child: Text("Toplam Borç:",
                                    style: TextStyle(
                                      fontSize: 20.0, color: Colors.white))),
                              ),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: StreamBuilder(
                        stream: Firestore.instance.collection('customer').snapshots(),
                        builder: (BuildContext context, AsyncSnapshot < QuerySnapshot > snapshot) {
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          }

                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Text('Loading...');
                          }

                          return ListView(
                            children: snapshot.data.documents
                            .map(
                              (doc) => ListTile(
                                title: Text(doc['name']),
                                subtitle: Text(doc['status']),
                                trailing: Column(
                                  children: < Widget > [
                                    Container(
                                      width: 25,
                                      height: 25,
                                      margin: EdgeInsets.only(top: 8),
                                      child: InkWell(
                                        child: Icon(Icons.call),
                                        onTap: () {},
                                      ),
                                    )
                                  ],
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CustomerPage()));
                                },
                              ),
                            )
                            .toList(),
                          );
                        },
                      )
                    )
                  ],
                ),
              ),
            ),
          )
        ),
      );

  }

  Widget _loginScreen() {
    return Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: < Widget > [
              FlutterLogo(size: 150),
              SizedBox(height: 50),
              _signInButton(),
            ],
          ),
        ),
      );
  }

  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        signInWithGoogle().whenComplete(() {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return MainScreen();
              },
            ),
          );
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: < Widget > [
              Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Sign in with Google',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
              )
            ],
          ),
      ),
    );
  }

}
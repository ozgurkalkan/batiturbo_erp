import 'package:bati_turbo_erp/core/locator.dart';
import 'package:bati_turbo_erp/models/customers.dart';
import 'package:bati_turbo_erp/screens/add_customer_page.dart';
import 'package:bati_turbo_erp/screens/customer_details_page.dart';
import 'package:bati_turbo_erp/viewmodels/customer_model.dart';
import 'package:bati_turbo_erp/viewmodels/main_model.dart';
//import 'package:bati_turbo_erp/viewmodels/main_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

//TODO: main screen floating action button ile alacak rengi aynı olacak


class _MainScreenState extends State < MainScreen > {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var model = getIt<MainModel>();
    return _mainScreen();
  }

  Widget _mainScreen() {

    var model = getIt<MainModel>();
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await model.navigateToCustomerAdd();
        },
        label: Text("Müşteri Ekle"),
        icon: Icon(Icons.person_add),
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
                    /*
                    CircleAvatar(
                      backgroundImage: NetworkImage(uimageUrl),
                    )
                    */
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
                    child: _customerList()
                  )
                ],
              ),
            ),
          ),
        )
      ),
    );
  }

  Widget _customerList() {
    var userId = "Ru88CAKWaDOENKfMFWP5mdJWFK52";
    var model = getIt<CustomerModel>();

    return ChangeNotifierProvider(
          create: (BuildContext context) => model,
          child: StreamBuilder<List<Customer>>(
        stream: model.customers(userId),
        builder: 
          (BuildContext context, AsyncSnapshot<List<Customer>> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Loading...');
          }


          return ListView(
            children: snapshot.data
            .map(
              (doc) => ListTile(
                title: Text(doc.name),
                subtitle: Text(doc.status),
                trailing: Column(
                  children: < Widget > [
                    Container(
                      width: 25,
                      height: 25,
                      margin: EdgeInsets.only(top: 8),
                      child: InkWell(
                        child: Icon(Icons.call),
                        onTap: () {
                          // ignore: todo
                          //TODO: müşteri Arama eklenecek
                        },
                      ),
                    )
                  ],
                ),
                onTap: () {
                  // ignore: todo
                  //TODO: müşteri detay sayfası düzenlenecek
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomerDetailPage(
                        //userId: userId,
                      )));
                },
              ),
            )
            .toList(),
          );
        },
      ),
    );
  }

}
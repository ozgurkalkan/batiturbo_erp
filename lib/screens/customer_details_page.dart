import 'package:bati_turbo_erp/utils/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class CustomerPage extends StatefulWidget {
  @override
  _CustomerPageState createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Müşteri Ekleme"),
      ),
      body: Container(
        child: AddCustomerForm(),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {

        },
        label: Text("Onayla"),
        icon: Icon(Icons.check),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      
    );
  }
}

class AddCustomerForm extends StatefulWidget {

  @override
  _AddCustomerFormState createState() => _AddCustomerFormState();
}

class _AddCustomerFormState extends State < AddCustomerForm > {
  final _formKey = GlobalKey < FormState > ();


  @override
  Widget build(BuildContext context) {
    String name;
    String phoneNumber;
    String status;

    return Column(
      children: < Widget > [
        Padding(
          padding: EdgeInsets.all(8),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: < Widget > [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Müşteri Adı"),
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) {
                        return "İsim giriniz";
                      }
                    },
                    onSaved: (value) {
                      name = value;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(hintText: "Telefon Numarası"),
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Telefon Numarası Giriniz";
                      }
                    },
                    onSaved: (value) {
                      phoneNumber = value;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "status giriniz"),
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) {
                        return "status giriniz";
                      }
                    },
                    onSaved: (value) {
                      status = value;
                    },
                  ),
                ),

                RaisedButton(
                  color: Theme.of(context).accentColor,
                  textColor: Colors.white,
                  child: Text("Onayla"),
                  onPressed: () async {

                    final databaseReference = Firestore.instance;
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();

                      //var firebaseUser = await FirebaseAuth.instance.currentUser();
                      databaseReference.collection("customer").document().setData({
                        "name": name,
                        "phone": phoneNumber,
                        "status": status,
                        "username": uname,
                      }).then((_) {
                        print("success!");
                      });

                      //Customer.customers.add(Customer(name: name, phoneNumber: phoneNumber));



                      var snackBar = Scaffold.of(context).showSnackBar(
                        SnackBar(duration: Duration(microseconds: 1000),
                          content: Text("$name isimli müşteri kaydedildi")),
                      );

                      snackBar.closed.then((onValue) {
                        Navigator.pop(context);
                      });

                    }
                  }
                )
              ]
            ),
          ),

        )
      ],
    );
  }
}
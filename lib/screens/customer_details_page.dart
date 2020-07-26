import 'package:bati_turbo_erp/utils/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class CustomerPage extends StatefulWidget {
  @override
  _CustomerPageState createState() => _CustomerPageState();
}

class _CustomerPageState extends State < CustomerPage > {
  @override
  Widget build(BuildContext context) {

    return _customerPage();
  }

  Widget _customerPage() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Müşteri Ekleme"),
      ),
      floatingActionButton: _floatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: _customerForm(),

    );
  }

  Widget _customerForm() {

    final _formKey = GlobalKey < FormState > ();
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
                        "timeStamp": DateTime.now()
                      }).then((_) {
                        print("success!");
                      });



                      Navigator.pop(context);

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

  Widget _floatingActionButton() {
    return FloatingActionButton.extended(
      onPressed: () {

      },
      label: Text("Onayla"),
      icon: Icon(Icons.check),
    );
  }

}
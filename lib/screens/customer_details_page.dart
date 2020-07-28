import 'package:flutter/material.dart';

class CustomerDetailPage extends StatefulWidget {
  @override
  _CustomerDetailPageState createState() => _CustomerDetailPageState();
}

class _CustomerDetailPageState extends State < CustomerDetailPage > {
  @override
  Widget build(BuildContext context) {

    return _customerDetailPage();
  }

  Widget _customerDetailPage() {
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

 
    return Column(
    );
  }

  Widget _floatingActionButton() {
    return FloatingActionButton.extended(
      onPressed: () async {
        /*
        var userId = "xnBbb3iFJbWR6q9V2wcgF3HJRaE2";
        var model = GetIt.instance < CustomerModel > ();
        if () {
        }
        */

      },
      label: Text("Onayla"),
      icon: Icon(Icons.check),
    );
  }



}
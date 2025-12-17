import 'package:flutter/material.dart';
import 'package:scubetask/App/assets_path.dart';

class options extends StatelessWidget {
  const options({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SCM"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none_outlined, size: 30,))
        ],
      ),
      body: SafeArea(child: Container(
        margin: EdgeInsets.all(15),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.grey
          )
        ),
        child: Center(child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(assets_path.no_data),
            Text("No Data is here,\nplease wait.", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, ),),

          ],
        )),
      )),

    );
  }
}

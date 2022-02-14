import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index = 0;

  //TopTen Widget
  Widget TopTenWidget(){
    return SizedBox(
      height: 200,
      child: PageView.builder(
        itemCount: 10,
        controller: PageController(viewportFraction: 0.7),
        onPageChanged: (int index) => setState(() => _index = index),
        itemBuilder: (context, i) {
          return Transform.scale(
            scale: i == _index ? 1 : 0.9,
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  "Card ${i + 1}",
                  style: TextStyle(fontSize: 32),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  //Comming Soon
  Widget CommingSoonWidget(){
    return SizedBox();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('GuckMovie',
        style: TextStyle(color: Colors.grey),),
      ),
      body: Column(
        children: [
          TopTenWidget(),

        ],
      )
    );
  }
}

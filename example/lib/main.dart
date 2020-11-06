import 'package:flutter/material.dart';
import 'package:responsive_page/responsive_page.dart';

void main() {
  responsiveWidgetController.setDefaultBreakpoints(mobile: 500);
  runApp(const ResponsivePageExampleApp());
}

///
class ResponsivePageExampleApp extends StatelessWidget {
  ///
  const ResponsivePageExampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

///
class MyHomePage extends StatefulWidget {
  ///
  MyHomePage({Key key, this.title}) : super(key: key);

  ///
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends ResponsiveState<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Widget redBox(Size size) {
    return Container(
      height: size.height,
      width: size.width,
      color: Colors.red,
    );
  }

  Widget greenBox(Size size) {
    return Container(
      height: size.height,
      width: size.width,
      color: Colors.green,
    );
  }

  Widget action(int i) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Action$i',
        style: const TextStyle(fontSize: 18),
      ),
    );
  }

  Widget countText() {
    return Text(
      '$_counter',
      style: Theme.of(context).textTheme.headline4,
    );
  }

  FloatingActionButton floatingActionButton() {
    return FloatingActionButton(
      onPressed: _incrementCounter,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }

  @override
  Widget buildDesktop(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [action(1), action(2), action(3)],
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: [
                  greenBox(Size(MediaQuery.of(context).size.width * 0.8,
                      MediaQuery.of(context).size.height * 0.4)),
                  redBox(Size(MediaQuery.of(context).size.width * 0.8,
                      MediaQuery.of(context).size.height * 0.4))
                ],
              ),
              countText(),
            ],
          ),
        ),
        floatingActionButton: floatingActionButton());
  }

  @override
  Widget buildMobile(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: countText()),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              action(1),
              action(2),
              action(3),
              greenBox(Size(MediaQuery.of(context).size.width * 0.8,
                  MediaQuery.of(context).size.width * 0.5)),
              redBox(Size(MediaQuery.of(context).size.width * 0.8,
                  MediaQuery.of(context).size.width * 0.5))
            ],
          ),
        ),
        floatingActionButton: floatingActionButton());
  }

  @override
  Widget buildWideMobileOrTablet(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: countText()),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  action(1),
                  action(2),
                  action(3),
                ],
              ),
              Row(
                children: [
                  greenBox(Size(MediaQuery.of(context).size.width * 0.4,
                      MediaQuery.of(context).size.width * 0.5)),
                  redBox(Size(MediaQuery.of(context).size.width * 0.4,
                      MediaQuery.of(context).size.width * 0.5))
                ],
              )
            ],
          ),
        ),
        floatingActionButton: floatingActionButton());
  }

  @override
  Widget buildWideTabletOrDesktop(BuildContext context) =>
      buildDesktop(context);
}

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WebViewExample(),
    );
  }
}

class WebViewExample extends StatelessWidget {

   WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("WebView Example"),
      ),
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: 'assets/index.html',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller = webViewController;
          },
        );
      }),
           bottomNavigationBar: BottomNavigationBar(
      onTap: onTabTapped,
       currentIndex: 0, // this will be set when a new tab is tapped
       items: [
         BottomNavigationBarItem(
           icon: new Icon(Icons.home),
           title: new Text('Home'),
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.mail),
           title: new Text('Stuff'),
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.person),
           title: Text('Contact'),
           
         )
       ],
     ),
    );
  }

   void onTabTapped(int index) {
   if(index == 1) {
    //  _controller.evaluateJavascript("console.log('not a log')");
    _controller.evaluateJavascript('window.location.hash = "stuff";');
    
  //  _controller.loadUrl('assets/index.html/#stuff');
   }
    if(index == 2) {
       _controller.evaluateJavascript('window.location.hash = "contact";');
      // _controller.loadUrl('assets/index.html/#contact');

    }
    if(index == 0) {
      //  _controller.evaluateJavascript('navigateTo("home")');
      _controller.loadUrl('assets/index.html');

    }

}

}
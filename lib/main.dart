import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:redux_demo/reducers/reducers.dart';
import 'package:redux_demo/actions/actions.dart';
import 'package:redux_demo/constants/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //initialise store
  final store = Store(counterReducer, initialState: 0);

  @override
  Widget build(BuildContext context) {
    // initialise page with store
    return StoreProvider(
        store: store,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            backgroundColor: appColor,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Text(
                  'You have pushed the button this many times:',
                ),

                // display the count
                StoreConnector<int, String>(
                  converter: (store) => store.state.toString(),
                  builder: (context, count) => new Text(
                    count
                  ),
                ),

                Wrap(
                  children: [

                    StoreConnector<int, VoidCallback>(
                        converter: (store) {
                          return () => store.dispatch(counterActions.Decrement);
                        },
                        builder: (context, callback) => IconButton(
                          onPressed: callback,
                          color: appColor,
                          icon: Icon(Icons.delete),
                        )),

                    StoreConnector<int, VoidCallback>(
                        converter: (store) {
                          return () => store.dispatch(counterActions.Increment);
                        },
                        builder: (context, callback) => IconButton(
                          onPressed: callback,
                          color: appColor,
                          icon: Icon(Icons.add),
                        )),

                  ],
                ),

              ],
            ),
          )
        ));
  }
}

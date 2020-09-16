import 'package:redux_demo/actions/actions.dart';


int counterReducer(int state, action){
  if (action == counterActions.Increment){
    return state + 1;
  }
  else if (action == counterActions.Decrement){
    return state - 1;
  }
  else {
    return state;
  }
}


import 'package:lua_dardo/lua.dart';

int _print(LuaState state) {
  String? arg = state.checkString(1);
  if (arg == null) return -1;
  state.pop(1);

  print(arg);
  return 1;
}

void eval(String url, String script) {
  print("Lua output:\n");

  final state = LuaState.newState();
  state.pushDartFunction(_print);
  state.setGlobal('print');
  state.loadString(script);
  state.call(0, 0);
  state.getGlobal('extract');
  if (state.isFunction(1)) {
    state.pushString(url);
    state.pCall(1, 1, 0);
  }
  print("Returned to Dart.");
}
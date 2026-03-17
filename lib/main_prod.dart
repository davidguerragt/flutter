import 'package:maquetacion/core/environment/env.dart';
import 'package:maquetacion/main.dart';

void main(List<String> args) {
  Env.environment = Environment.production;
  runProject();
}

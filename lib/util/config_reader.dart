import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:q_task_flutter_app/config/flavor_config.dart';

abstract class ConfigReader {
  static late Map<String, dynamic> _config;

  static Future<void> initialize() async {
    final configString = await rootBundle.loadString('config/env_config.json');
    _config = json.decode(configString) as Map<String, dynamic>;
  }

  static String getEvnironment() {
    switch (_config['env']) {
      case 'dev':
        return Env.development;
      case 'stage':
        return Env.stage;
      case 'prod':
        return Env.production;
      default:
        throw Exception('Invalid environment defined in env_config.json');
    }
  }
}

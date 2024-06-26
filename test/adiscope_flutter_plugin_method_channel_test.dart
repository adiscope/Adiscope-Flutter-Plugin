import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:adiscope_flutter_plugin/adiscope_flutter_plugin_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelAdiscopeFlutterPlugin platform = MethodChannelAdiscopeFlutterPlugin();
  const MethodChannel channel = MethodChannel('adiscope_flutter_plugin');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });
}

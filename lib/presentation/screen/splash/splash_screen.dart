import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inventory_app/core/constant/image_asset_path.dart';
import 'package:inventory_app/core/constant/route_name.dart';
import 'package:inventory_app/core/constant/string_resource.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  Future<void> _initial() async {
    _timer = Timer(const Duration(milliseconds: 3000), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteName.home,
        (route) => false,
      );
    });
  }

  @override
  void initState() {
    _initial();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Image.asset(
                      ImageAssetPath.appLogo,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    StringResource.appName,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Text(
            StringResource.version,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

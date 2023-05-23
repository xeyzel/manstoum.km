import 'package:flutter/material.dart';
import 'package:inventory_app/core/constant/string_resource.dart';
import '../../widgets/custom_app_bar.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: StringResource.transaction,
      ),
    );
  }
}

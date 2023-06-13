import 'package:flutter/material.dart';
import 'package:inventory_app/core/constant/string_resource.dart';

import '../../../data/model/product/product.dart';

class ProductUpdateScreen extends StatefulWidget {
  final Product product;

  const ProductUpdateScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductUpdateScreen> createState() => _ProductUpdateScreenState();
}

class _ProductUpdateScreenState extends State<ProductUpdateScreen> {
  final _name = TextEditingController();
  final _description = TextEditingController();

  _initial() {
    _name.text = widget.product.name;
    _description.text = widget.product.description;
  }

  @override
  void initState() {
    _initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Product Details'),
        ),
        body: Column(
          children: [],
        ));
  }
}

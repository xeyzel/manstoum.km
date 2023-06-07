import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventory_app/presentation/screens/create_product/cubit/create_product_cubit.dart';
import 'package:inventory_app/presentation/screens/create_product/cubit/create_product_state.dart';
import 'package:inventory_app/presentation/screens/create_warehouse/cubit/create_warehouse_cubit.dart';
import 'package:inventory_app/presentation/screens/create_warehouse/cubit/create_warehouse_state.dart';

class CreateProductScreen extends StatefulWidget {
  const CreateProductScreen({Key? key}) : super(key: key);

  @override
  State<CreateProductScreen> createState() => _CreateProductScreenState();
}

class _CreateProductScreenState extends State<CreateProductScreen> {
  final _imagePicker = ImagePicker();
  final _name = TextEditingController();
  final _description = TextEditingController();
  final _price = TextEditingController();
  final _quantity = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _initial();
    super.initState();
  }

  void _initial() {
    context.read<CreateWarehouseCubit>().findAllWarehouse();
    final state = context.read<CreateProductCubit>().state;
    _name.text = state.name;
    _description.text = state.description;
    _price.text = state.price.toString();
    _quantity.text = state.quantity.toString();
  }

  void startCamera() async {
    final resource = await _imagePicker.pickImage(source: ImageSource.camera);
    context.read<CreateProductCubit>().setImage(resource);
  }

  void startGallery() async {
    final resource = await _imagePicker.pickImage(source: ImageSource.gallery);
    context.read<CreateProductCubit>().setImage(resource);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final result = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Delete Content?"),
              actions: [
                TextButton(
                  onPressed: () {
                    context.read<CreateProductCubit>().reset();
                    Navigator.pop(context, true);
                  },
                  child: Text('Yes'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: Text('No'),
                )
              ],
            );
          },
        );
        return result!;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Insert Product'),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text(
                'Product',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: startCamera,
                onDoubleTap: startGallery,
                child: BlocBuilder<CreateProductCubit, CreateProductState>(
                  builder: (context, state) {
                    if (state.imageFile != null) {
                      return Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Image.file(File(state.imageFile!.path)),
                      );
                    }
                    return Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(
                        Icons.image,
                        color: Colors.grey.shade400,
                        size: 60,
                      ),
                    );
                  },
                ),
              ),
              const Text(
                'Note: Double tap for open gallery',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 16),
              BlocBuilder<CreateWarehouseCubit, CreateWarehouseState>(
                builder: (context, state) {
                  return DropdownButton(
                    items: [
                      DropdownMenuItem(
                        child: Text(
                            'Choose Warehouse                                            '),
                      ),
                      ...state.warehouses.map(
                        (e) => DropdownMenuItem(
                          value: e.id,
                          child: Text(e.name),
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        context
                            .read<CreateProductCubit>()
                            .setWarehouseId(value);
                      }
                    },
                  );
                },
              ),
              TextFormField(
                controller: _name,
                onChanged: context.read<CreateProductCubit>().setName,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'name not allowed empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text('Name'),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _description,
                onChanged: context.read<CreateProductCubit>().setDescription,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'description is not allowed empty';
                  }
                },
                decoration: InputDecoration(
                  label: Text('Description'),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _price,
                onChanged: (value) {
                  final result = int.parse(value);
                  context.read<CreateProductCubit>().setPrice(result);
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text('Price'),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _quantity,
                onChanged: (value) {
                  final result = int.parse(value);
                  context.read<CreateProductCubit>().setQuantity(result);
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text('Quantity'),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Save"),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

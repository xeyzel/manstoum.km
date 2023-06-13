import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_app/core/constant/status.dart';
import 'package:inventory_app/data/model/product/product.dart';
import 'package:inventory_app/presentation/screens/product_main_feature/cubit/product_main_feature_cubit.dart';
import 'package:inventory_app/presentation/screens/product_main_feature/cubit/product_main_feature_state.dart';
import 'package:inventory_app/presentation/widgets/center_loading.dart';

class ProductMainFeatureScreen extends StatefulWidget {
  final Product product;

  const ProductMainFeatureScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductMainFeatureScreen> createState() =>
      _ProductMainFeatureScreenState();
}

class _ProductMainFeatureScreenState extends State<ProductMainFeatureScreen> {
  final _price = TextEditingController();
  final _quantity = TextEditingController();

  void _initial() {
    _price.text = widget.product.price.toString();
    _quantity.text = widget.product.quantity.toString();


    final bloc = context.read<ProductMainFeatureCubit>();
    bloc.setPrice(widget.product.price);
    bloc.setQuantity(widget.product.quantity);
  }

  @override
  void initState() {
    _initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(widget.product.image, height: 100),
              TextField(
                keyboardType: TextInputType.number,
                controller: _price,
                decoration: InputDecoration(

                  label: Text('Price'),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                keyboardType: TextInputType.number,
                controller: _quantity,
                decoration: InputDecoration(
                  label: Text('Quantity'),
                ),
              ),
              BlocConsumer<ProductMainFeatureCubit, ProductMainFeatureState>(
                listenWhen: (previous, current) {
                  return previous.status != current.status;
                },
                listener: (context, state) {

                  if(state.status == Status.success) {
                    Navigator.pop(context);
                  }

                },
                builder: (context, state) {
                  if (state.status == Status.loading) {
                    return CenterLoading();
                  }

                  return ElevatedButton(
                    onPressed: () {
                      final price = int.parse(_price.text);
                      final quantity = int.parse(_quantity.text);


                      context.read<ProductMainFeatureCubit>().setPrice(price);
                      context.read<ProductMainFeatureCubit>().setQuantity(quantity);

                      final newProduct = widget.product.copyWith(
                        price: price,
                        quantity: quantity,
                      );

                      context
                          .read<ProductMainFeatureCubit>()
                          .updateProduct(newProduct);
                    },
                    child: Text('Save'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

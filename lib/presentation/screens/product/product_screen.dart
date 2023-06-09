import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_app/core/constant/status.dart';
import 'package:inventory_app/core/constant/string_resource.dart';
import 'package:inventory_app/core/util/utils.dart';
import 'package:inventory_app/presentation/screens/create_product/cubit/create_product_cubit.dart';
import 'package:inventory_app/presentation/screens/create_product/cubit/create_product_state.dart';
import 'package:inventory_app/presentation/widgets/center_loading.dart';
import 'package:inventory_app/presentation/widgets/custom_app_bar.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  void initial() {
    context.read<CreateProductCubit>().findAllProduct();
  }

  @override
  void initState() {
    initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringResource.product),
      ),
      body: BlocBuilder<CreateProductCubit, CreateProductState>(
        buildWhen: (previous, current) {
          return previous.status != current.status;
        },
        builder: (context, state) {
          final products = state.products;

          if (state.status == Status.loading) {
            return const CenterLoading();
          }

          if (products.isEmpty) {
            return const Center(
              child: Text('No Products'),
            );
          }

          return ListView.separated(
            itemBuilder: (context, index) {
              final product = state.products.elementAt(index);
              return ListTile(
                leading: CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(product.image),
                ),
                title: Text(Utils.capital(product.name)),
                subtitle: Text("Warehouse: ${product.warehouseName}"),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: state.products.length,
          );

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

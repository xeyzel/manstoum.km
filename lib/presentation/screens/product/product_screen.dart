import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_app/core/constant/status.dart';
import 'package:inventory_app/core/constant/string_resource.dart';
import 'package:inventory_app/core/util/utils.dart';
import 'package:inventory_app/presentation/screens/create_product/cubit/create_product_cubit.dart';
import 'package:inventory_app/presentation/screens/create_product/cubit/create_product_state.dart';
import 'package:inventory_app/presentation/screens/product_update/product_update_screen.dart';
import 'package:inventory_app/presentation/widgets/center_loading.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  void initial() {
    final warehouseId =
        context.read<CreateProductCubit>().state.selectedWarehouseId;
    context.read<CreateProductCubit>().findAllProduct(warehouseId);
  }

  @override
  void initState() {
    initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<CreateProductCubit>().setSelectedWarehouseId(null);
        context.read<CreateProductCubit>().findAllProduct();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(StringResource.product),
        ),
        body: BlocBuilder<CreateProductCubit, CreateProductState>(
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
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ProductUpdateScreen(
                          product: product,
                        );
                      },
                    ));
                  },
                  leading: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(product.image),
                  ),
                  title: Text(Utils.capital(product.name)),
                  subtitle: Text("Description: ${product.description}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Delete Product ?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  context
                                      .read<CreateProductCubit>()
                                      .deleteProduct(product.id, true);
                                  Navigator.pop(context);
                                },
                                child: const Text('Yes'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('No'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemCount: state.products.length,
            );

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

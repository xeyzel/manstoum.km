import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_app/core/constant/status.dart';
import 'package:inventory_app/core/constant/string_resource.dart';
import 'package:inventory_app/presentation/screens/create_warehouse/cubit/create_warehouse_cubit.dart';
import 'package:inventory_app/presentation/screens/create_warehouse/cubit/create_warehouse_state.dart';
import 'package:inventory_app/presentation/widgets/center_loading.dart';
import 'package:inventory_app/presentation/widgets/custom_app_bar.dart';

class WarehouseScreen extends StatelessWidget {
  const WarehouseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CreateWarehouseCubit>().findAllWarehouse();
    return Scaffold(
      appBar: const CustomAppBar(
        title: StringResource.warehouse,
      ),
      body: BlocBuilder<CreateWarehouseCubit, CreateWarehouseState>(
        buildWhen: (previous, current) {
          return previous.status != current.status;
        },
        builder: (context, state) {
          final warehouses = state.warehouses;

          if (state.status == Status.loading) {
            return const CenterLoading();
          }

          if (warehouses.isEmpty) {
            return const Center(
              child: Text('No Warehouse'),
            );
          }

          return ListView.separated(
            itemBuilder: (context, index) {
              final warehouse = state.warehouses.elementAt(index);
              return ListTile(
                leading: CircleAvatar(
                  child: Text(warehouse.name[0]),
                ),
                title: Text(warehouse.name),
                subtitle: Text(warehouse.address),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: state.warehouses.length,
          );

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

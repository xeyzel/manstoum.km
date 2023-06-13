import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_app/core/constant/status.dart';
import 'package:inventory_app/core/constant/string_resource.dart';
import 'package:inventory_app/presentation/screens/transaction/cubit/transaction_cubit.dart';
import 'package:inventory_app/presentation/screens/transaction/cubit/transaction_state.dart';
import 'package:inventory_app/presentation/widgets/center_loading.dart';
import '../../widgets/custom_app_bar.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<TransactionCubit>().findAllTransaction();
    return Scaffold(
      appBar: CustomAppBar(
        title: StringResource.transaction,
      ),
      body: BlocBuilder<TransactionCubit, TransactionState>(
        builder: (context, state) {
          if (state.status == Status.loading) {
            return CenterLoading();
          }

          if (state.transactions.isEmpty) {
            return Center(
              child: Text('There Is No Transaction'),
            );
          }

          return ListView.separated(
            padding: EdgeInsets.all(16),
            itemBuilder: (context, index) {
              final transaction = state.transactions.elementAt(index);


              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Id Transaction: ${transaction.idTransaction}'),

                      if(transaction.infoPrice != null && transaction.infoPrice!.isNotEmpty)
                           Text(transaction.infoPrice.toString()),

                      if(transaction.infoQuantity != null && transaction.infoQuantity!.isNotEmpty)
                           Text(transaction.infoQuantity.toString()),

                      Text('Product Name:  ${transaction.productName}'),
                      Text('Warehouse Name:  ${transaction.warehouseName}'),
                      Text('Created At: ${transaction.createdAt}'),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: state.transactions.length,
          );
        },
      ),
    );
  }
}

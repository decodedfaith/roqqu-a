import 'package:flutter/material.dart';
import 'package:roqqu_mobile_t/common/widgets/main_gradient_button.dart';
import 'package:roqqu_mobile_t/core/theme/app_theme.dart';

class ProTraderDetailsScreen extends StatelessWidget {
  const ProTraderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryDark,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            title: Text('Trading details'),
            backgroundColor: AppTheme.primaryDark,
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TODO: Build the top trader info card
                  // TODO: Build the certified PRO trader section
                  // TODO: Build the TabBar for Chart/Stats/All Trades
                  // TODO: Build the Chart widget
                  // TODO: Build the Assets allocation pie chart
                  // TODO: Build the Trading period section
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: MainGradientButton(
          text: 'Copy Trade',
          onPressed: () {
            // TODO: Start the transaction flow
          },
        ),
      ),
    );
  }
}

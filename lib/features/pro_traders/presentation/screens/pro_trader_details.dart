import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roqqu_mobile_t/common/widgets/custom_app_bar.dart';
import 'package:roqqu_mobile_t/common/widgets/main_gradient_button.dart';
import 'package:roqqu_mobile_t/core/theme/app_theme.dart';
import 'package:roqqu_mobile_t/features/pro_traders/domain/models/pro_trader.dart';
import 'package:roqqu_mobile_t/features/pro_traders/presentation/widgets/certified_pro_trader_section.dart';
import 'package:roqqu_mobile_t/features/pro_traders/presentation/widgets/trader_header_section.dart';
import 'package:roqqu_mobile_t/features/pro_traders/presentation/widgets/trader_stats_section.dart';
import 'package:roqqu_mobile_t/features/pro_traders/presentation/widgets/traders_chart_section.dart';
import 'package:roqqu_mobile_t/features/pro_traders/presentation/widgets/traders_tabs_section.dart';

// Mock trader data
const mockTraderDetails = ProTrader(
    initials: 'LO',
    name: 'Laura Okobi',
    aum: 500,
    roi: 120.42,
    totalPnl: '\$38,667.29',
    isPro: true,
    avatarColor: Color(0xFF5D4A2E),
    ringColor: Color(0xFFD9A648),
    winRate: 100,
    id: '7',
    avatarUrl: '',
    copiers: 7,
    assetsUnderManagement: null,
    stats: null,
    assetAllocation: {},
    roiHistory: [],
    pnlHistory: []);

class ProTraderDetailsScreen extends ConsumerStatefulWidget {
  final String traderId;
  const ProTraderDetailsScreen({super.key, required this.traderId});

  @override
  ConsumerState<ProTraderDetailsScreen> createState() =>
      _ProTraderDetailsScreenState();
}

class _ProTraderDetailsScreenState
    extends ConsumerState<ProTraderDetailsScreen> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryDark,
      appBar: const CustomAppBar(title: 'Trading details'),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  const TraderHeaderSection(trader: mockTraderDetails),
                  const SizedBox(height: 24),
                  const CertifiedProTraderSection(trader: mockTraderDetails),
                  const SizedBox(height: 24),
                  TraderTabsSection(
                    selectedIndex: _selectedTabIndex,
                    onTabSelected: (index) =>
                        setState(() => _selectedTabIndex = index),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: const SizedBox(height: 24)),
          SliverToBoxAdapter(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _buildTabContent(_selectedTabIndex),
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(bottom: 100)),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 80),
          child: MainGradientButton(
            text: 'Copy trade',
            onPressed: () {},
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent(int index) {
    switch (index) {
      case 1: // Stats
        return const TraderStatsSection();
      case 2: // All Trades
        return const Center(
            child: Text('All Trades Coming Soon',
                style: TextStyle(color: Colors.white)));
      case 3:
        return const Center(
            child: Text('Copiers Coming Soon',
                style: TextStyle(color: Colors.white)));
      case 0:
      default:
        return const TraderChartSection();
    }
  }
}

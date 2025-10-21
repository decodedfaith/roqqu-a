import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roqqu_mobile_t/common/widgets/custom_app_bar.dart';
import 'package:roqqu_mobile_t/common/widgets/frosted_glass_card.dart';
import 'package:roqqu_mobile_t/core/theme/app_theme.dart';
import 'package:roqqu_mobile_t/features/pro_traders/domain/models/pro_trader.dart';
import 'package:roqqu_mobile_t/features/pro_traders/presentation/widgets/pro_trader_list_item.dart';

class ProTradersDashboard extends StatelessWidget {
  ProTradersDashboard({super.key});

  //TODO: FIX- Mock data for the list. In a real app, this would come from a Riverpod provider.
  final List<ProTrader> mockTraders = [
    const ProTrader(
        initials: 'JI',
        name: 'Jay Islisou',
        aum: 500,
        roi: 120.42,
        totalPnl: '\$38,667.29',
        avatarColor: Color(0xFF4A4A4A),
        winRate: 100,
        id: '',
        avatarUrl: '',
        copiers: 87,
        assetsUnderManagement: null,
        stats: null,
        assetAllocation: {},
        roiHistory: [],
        pnlHistory: [],
        ringColor: Colors.brown),
    const ProTrader(
        initials: 'LO',
        name: 'Laura Okobi',
        aum: 500,
        roi: 120.42,
        totalPnl: '\$38,667.29',
        isPro: true,
        avatarColor: Color(0xFF5D4A2E),
        ringColor: Color(0xFFD9A648),
        winRate: 100,
        id: '',
        avatarUrl: '',
        copiers: 98,
        assetsUnderManagement: null,
        stats: null,
        assetAllocation: {},
        roiHistory: [],
        pnlHistory: []),
    const ProTrader(
      initials: 'BM',
      name: 'BTC master',
      aum: 500,
      roi: 120.42,
      totalPnl: '\$38,667.29',
      isPro: true,
      avatarColor: Color(0xFF1E4944),
      ringColor: Color(0xFF35B58B),
      winRate: 100,
      id: '',
      avatarUrl: '',
      copiers: 5,
      assetsUnderManagement: null,
      stats: null,
      assetAllocation: {},
      roiHistory: [],
      pnlHistory: [],
    ),
    const ProTrader(
      initials: 'JI',
      name: 'Jay Islisou 2',
      totalPnl: '\$38,667.29',
      aum: 500,
      roi: 120.42,
      winRate: 100,
      isPro: true,
      avatarColor: const Color(0xFF2E3B5D),
      ringColor: const Color(0xFF4867D9),
      id: '',
      avatarUrl: '',
      copiers: 5,
      assetsUnderManagement: null,
      assetAllocation: {},
      roiHistory: [],
      pnlHistory: [],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryDark,
      appBar: const CustomAppBar(title: 'Copy trading'),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Row(
            children: [
              Expanded(
                  child: FrostedGlassCard(
                gradient: AppTheme.dashboardCardGradient,
                child: _DashboardActionCard(
                  svgIcon: "assets/icons/dashboardIcon1.svg",
                  title: 'My dashboard',
                  subtitle: 'View trades',
                  iconColor: Color(0xFF3597B5),
                ),
              )),
              SizedBox(width: 16),
              Expanded(
                  child: FrostedGlassCard(
                gradient: AppTheme.proTraderCardGradient,
                child: _DashboardActionCard(
                  svgIcon: 'assets/icons/dashboardIcon2.svg',
                  title: 'Become a PRO trader',
                  subtitle: 'Apply NOW',
                  iconColor: Color(0xFFE6A33C),
                ),
              )),
            ],
          ),
          const SizedBox(height: 32),
          const Text(
            'PRO Traders',
            style: TextStyle(
              fontFamily: 'Encode Sans',
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xFFFFFFFF),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          // Build the list of traders from the mock data
          ...mockTraders
              .map((trader) => ProTraderListItem(trader: trader))
              .toList(),
        ],
      ),
    );
  }
}

// A private helper widget for the top action cards, as it's only used here.
class _DashboardActionCard extends StatelessWidget {
  final String svgIcon;
  final String title;
  final String subtitle;
  final Color iconColor;

  const _DashboardActionCard({
    required this.svgIcon,
    required this.title,
    required this.subtitle,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(svgIcon),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          Row(
            children: [
              Text(subtitle,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                  )),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.black54,
                size: 12,
              ),
            ],
          )
        ],
      ),
    );
  }
}

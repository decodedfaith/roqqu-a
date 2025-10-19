import 'package:roqqu_mobile_t/features/dashboard/domain/models/user_trading_stats.dart';
import 'package:roqqu_mobile_t/features/trading/domain/models/pro_trader.dart';

class UserCopyDashboard {
  final double copyTradingAssets;
  final double netProfit;
  final double todaysPnl;
  final UserTradingStats userStats;
  final List<ProTrader> myTraders; // List of traders the user is copying

  UserCopyDashboard({
    required this.copyTradingAssets,
    required this.netProfit,
    required this.todaysPnl,
    required this.userStats,
    required this.myTraders,
  });
}
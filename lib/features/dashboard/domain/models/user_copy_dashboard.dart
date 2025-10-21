import 'package:roqqu_mobile_t/features/dashboard/domain/models/user_trading_stats.dart';
import 'package:roqqu_mobile_t/features/pro_traders/domain/models/pro_trader.dart';

class UserCopyDashboard {
  final double copyTradingAssets;
  final double netProfit;
  final double todaysPnl;
  final UserTradingStats userStats;
  final List<ProTrader> myTraders;
  UserCopyDashboard({
    required this.copyTradingAssets,
    required this.netProfit,
    required this.todaysPnl,
    required this.userStats,
    required this.myTraders,
  });
}

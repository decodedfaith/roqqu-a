import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roqqu_mobile_t/features/dashboard/presentation/screens/widgets/balance_section.dart';
import 'package:roqqu_mobile_t/features/dashboard/presentation/screens/widgets/bell_icon_with_dot.dart';
import 'package:roqqu_mobile_t/features/dashboard/presentation/screens/widgets/stay_updated_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C2127),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 125),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const BalanceSection(),
                      const SizedBox(height: 12),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        height: 100,
                        decoration: BoxDecoration(
                          color: const Color(0xFF262932),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 16,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  _ActionButton(
                                    assetName: 'assets/icons/deposit.svg',
                                    label: 'Deposit',
                                  ),
                                  _ActionButton(
                                    assetName: 'assets/icons/buy.svg',
                                    label: 'Buy',
                                  ),
                                  _ActionButton(
                                    assetName: 'assets/icons/withdraw.svg',
                                    label: 'Withdraw',
                                  ),
                                  _ActionButton(
                                    assetName: 'assets/icons/send.svg',
                                    label: 'Send',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFF262932),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(11),
                            bottomRight: Radius.circular(11),
                          ),
                        ),
                        child: SizedBox(
                          height: 30,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'See more',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                fontSize: 11,
                                color: Color(0xFF85D1F0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const _CopyTradingCard(),
                      const SizedBox(height: 24),
                      const Row(
                        children: [
                          Text(
                            "Stay Updated",
                            style: TextStyle(
                              fontFamily: 'Encode Sans',
                              fontWeight: FontWeight.w900,
                              fontSize: 14,
                              color: Color(0xFFA7B1BC),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const StayUpdatedSection(),
                      const SizedBox(height: 24),
                      const _ListedCoinsSection(),
                      // SizedBox(height: 100),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Positioned(top: 0, left: 0, right: 0, child: _HeaderContent()),
        ],
      ),
    );
  }
}

class _HeaderContent extends StatelessWidget {
  const _HeaderContent();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Stack(
        children: [
          Container(
            height: 100,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFC0CFFE),
                  Color(0xFFF3DFF4),
                  Color(0xFFF9D8E5),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2.5),
                      decoration: BoxDecoration(
                        color: Colors.grey.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.9),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          children: [
                            Text(
                              'Crypto',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(width: 8),
                            SizedBox(
                              width: 16,
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                size: 20,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(width: 8),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset("assets/icons/search.svg"),
                        const SizedBox(width: 16),
                        SvgPicture.asset("assets/icons/headphones.svg"),
                        const SizedBox(width: 16),
                        const BellIconWithDot(
                          svgIcon: "assets/icons/bNotification.svg",
                          blackOutline: true,
                        ),
                        const SizedBox(width: 16),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.grey.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Row(
                            children: [
                              CircleAvatar(radius: 12, child: Text('🇬🇧')),
                              SizedBox(width: 8),
                              Icon(
                                Icons.keyboard_arrow_down,
                                size: 18,
                                color: Colors.black54,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
                decoration: const BoxDecoration(
                  color: Color(0xFF1C2127),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Container(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String assetName;
  final String label;

  const _ActionButton({required this.assetName, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            color: Color(0xFF1C2127),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            assetName,
            width: 15,
            height: 15,
            colorFilter: const ColorFilter.mode(
              Colors.white70,
              BlendMode.srcIn,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Color(0xFFA7B1BC),
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

class _CopyTradingCard extends StatelessWidget {
  const _CopyTradingCard();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: Implement navigation to the "Intro" screen.
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 112,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFFEC536),
                  Color(0xFF98AAFE),
                  Color(0xFF6179FA),
                ],
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFABE2F3),
                    Color(0xFFBDE4E5),
                    Color(0xFFEBE9D0),
                  ],
                ),
              ),
              child: const Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Copy Trading',
                          style: TextStyle(
                            fontFamily: 'Encode Sans',
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xFF1C2127),
                            height: 1.5,
                          ),
                        ),
                        Text(
                          'Discover our latest feature. Follow and watch the PRO traders closely and win like a PRO! We are rooting for you!',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0xFF1C2127),
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 100),
                ],
              ),
            ),
          ),
          Positioned(
            right: 8,
            bottom: -2,
            child: SvgPicture.asset('assets/icons/crown.svg', height: 85),
          ),
        ],
      ),
    );
  }
}

class _ListedCoinsSection extends StatelessWidget {
  const _ListedCoinsSection();

  @override
  Widget build(BuildContext context) {
    // TODO: Build the "Listed Coins" section with a ListView of coin data.
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Listed Coins',
              style: TextStyle(
                fontFamily: 'Encode Sans',
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: Color(0xFFA7B1BC),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'See all',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                  color: Color(0xFF85D1F0),
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),

        //TODO:  This should be a ListView connected to real data
        Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          decoration: BoxDecoration(
            color: const Color(0xFF20252B),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFF262932), width: 1),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/icons/bitcoinIcon.svg"),
                      const SizedBox(width: 16),
                      const Column(
                        children: [
                          Text(
                            'Bitcoin',
                            style: TextStyle(
                              fontFamily: 'Encode Sans',
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color(0xFFA7B1BC),
                            ),
                          ),
                          Text(
                            'BTC',
                            style: TextStyle(
                              fontFamily: 'Encode Sans',
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              color: Color(0xFFA7B1BC),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Text("\$22,840", style: TextStyle(color: Colors.white)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/icons/ethereumIcon.svg"),
                      const SizedBox(width: 16),
                      const Column(
                        children: [
                          Text(
                            'Bitcoin',
                            style: TextStyle(
                              fontFamily: 'Encode Sans',
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color(0xFFA7B1BC),
                            ),
                          ),
                          Text(
                            'BTC',
                            style: TextStyle(
                              fontFamily: 'Encode Sans',
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              color: Color(0xFFA7B1BC),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Text("\$22,840", style: TextStyle(color: Colors.white)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/icons/bitcoinIcon.svg"),
                      const SizedBox(width: 16),
                      const Column(
                        children: [
                          Text(
                            'Bitcoin',
                            style: TextStyle(
                              fontFamily: 'Encode Sans',
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color(0xFFA7B1BC),
                            ),
                          ),
                          Text(
                            'BTC',
                            style: TextStyle(
                              fontFamily: 'Encode Sans',
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              color: Color(0xFFA7B1BC),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Text("\$22,840", style: TextStyle(color: Colors.white)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/icons/ethereumIcon.svg"),
                      const SizedBox(width: 16),
                      const Column(
                        children: [
                          Text(
                            'Bitcoin',
                            style: TextStyle(
                              fontFamily: 'Encode Sans',
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color(0xFFA7B1BC),
                            ),
                          ),
                          Text(
                            'BTC',
                            style: TextStyle(
                              fontFamily: 'Encode Sans',
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              color: Color(0xFFA7B1BC),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Text("\$22,840", style: TextStyle(color: Colors.white)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

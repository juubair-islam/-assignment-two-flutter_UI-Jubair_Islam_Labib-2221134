import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F3F7),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // ── TOP HEADER ──────────────────────────────────────────────
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // Avatar circle with letter J
                        Container(
                          width: 42,
                          height: 42,
                          decoration: const BoxDecoration(
                            color: Color(0xFF4B3EE8),
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'J',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Welcome back,',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              'JUBAIR ISLAM',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Bell icon with red dot
                    Stack(
                      children: [
                        const Icon(
                          Icons.notifications_none,
                          size: 26,
                          color: Colors.black87,
                        ),
                        Positioned(
                          right: 1,
                          top: 1,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                // ── BALANCE CARD ─────────────────────────────────────────────
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF4B3EE8),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Top row: label + send icon
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total Balance',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.send,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      // Big balance number
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: const [
                          Text(
                            '\$8,945',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              letterSpacing: -1,
                            ),
                          ),
                          Text(
                            '.32',
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // Bottom row: savings + last 30 days
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Savings: \$5,500',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                          Row(
                            children: const [
                              Text(
                                'Last 30 days: +\$300',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(Icons.arrow_forward,
                                  size: 12, color: Colors.white70),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 18),

                // ── ACTION BUTTONS ROW ───────────────────────────────────────
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildActionButton(Icons.swap_horiz_rounded, 'Transfer'),
                    _buildActionButton(Icons.receipt_long_outlined, 'Pay Bills'),
                    _buildActionButton(Icons.show_chart, 'Invest'),
                  ],
                ),

                const SizedBox(height: 22),

                // ── RECENT TRANSACTIONS HEADER ───────────────────────────────
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Recent Transactions',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'View All',
                        style: TextStyle(
                          color: Color(0xFF4B3EE8),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // ── TRANSACTION ITEMS ────────────────────────────────────────
                _buildTransactionItem(
                  iconBg: const Color(0xFFFFECEC),
                  icon: Icons.play_circle_filled,
                  iconColor: const Color(0xFFE50914),
                  title: 'Netflix Subscripti...',
                  subtitle: 'Entertainment · Today',
                  amount: '-\$19.99',
                  isDebit: true,
                ),
                _buildTransactionItem(
                  iconBg: const Color(0xFFF5EBD8),
                  icon: Icons.coffee,
                  iconColor: const Color(0xFF8B5E3C),
                  title: 'Coffee Shop',
                  subtitle: 'Food & Drink · Today',
                  amount: '-\$4.50',
                  isDebit: true,
                ),
                _buildTransactionItem(
                  iconBg: const Color(0xFFE8F5E9),
                  icon: Icons.account_balance_wallet,
                  iconColor: const Color(0xFF2E7D32),
                  title: 'Salary Deposit',
                  subtitle: 'Income · Yesterday',
                  amount: '+\$3500.00',
                  isDebit: false,
                ),
                _buildTransactionItem(
                  iconBg: const Color(0xFFE8F0FE),
                  icon: Icons.shopping_cart_outlined,
                  iconColor: const Color(0xFF1A73E8),
                  title: 'Grocery Store',
                  subtitle: 'Shopping · Yesterday',
                  amount: '-\$55.80',
                  isDebit: true,
                ),
                _buildTransactionItem(
                  iconBg: const Color(0xFFFFF3E0),
                  icon: Icons.shopping_bag_outlined,
                  iconColor: const Color(0xFFE65100),
                  title: 'Amazon Purchase',
                  subtitle: 'Shopping · 2 days ago',
                  amount: '-\$120.45',
                  isDebit: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Action button widget (Transfer, Pay Bills, Invest)
  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          width: 58,
          height: 58,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: const Color(0xFF4B3EE8),
            size: 24,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  // Individual transaction row widget
  Widget _buildTransactionItem({
    required Color iconBg,
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String amount,
    required bool isDebit,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon circle
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: iconBg,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 12),
          // Title and subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),
          // Amount
          Text(
            amount,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: isDebit ? const Color(0xFFE53935) : const Color(0xFF2E7D32),
            ),
          ),
        ],
      ),
    );
  }
}
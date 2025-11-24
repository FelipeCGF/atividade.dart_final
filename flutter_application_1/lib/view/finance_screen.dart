import 'package:flutter/material.dart';

class FinanceScreen extends StatelessWidget {
  const FinanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      FinanceItem("Comida", Icons.restaurant_menu, "- R\$ 805,87", const Color(0xFF7FE3AE)),
      FinanceItem("Transporte", Icons.directions_bus, "- R\$ 353,54", const Color(0xFFC7A8FF)),
      FinanceItem("Energia", Icons.bolt, "- R\$ 143,25", const Color(0xFF7FE3AE)),
      FinanceItem("Água", Icons.water_drop, "- R\$ 56,23", const Color(0xFFC7A8FF)),
      FinanceItem("Fast-food", Icons.fastfood, "- R\$ 60,00", const Color(0xFF7FE3AE)),
      FinanceItem("Gasolina", Icons.local_gas_station, "- R\$ 180,02", const Color(0xFF7FE3AE)),
      FinanceItem("Aluguel", Icons.home, "- R\$ 600,00", const Color(0xFFC7A8FF)),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Row(
                  children: const [
                    Icon(Icons.arrow_back, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      "Controle financeiro",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return FinanceCard(item: items[index]);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FinanceItem {
  final String name;
  final IconData icon;
  final String value;
  final Color color;

  FinanceItem(this.name, this.icon, this.value, this.color);
}

class FinanceCard extends StatelessWidget {
  final FinanceItem item;

  const FinanceCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
      decoration: BoxDecoration(
        color: item.color,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.black12,
            child: Icon(item.icon, color: Colors.black87),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              item.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
          Text(
            item.value,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
        ],
      ),
    );
  }
}

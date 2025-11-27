import 'package:flutter/material.dart';

class FinanceScreen extends StatefulWidget {
  const FinanceScreen({super.key});

  @override
  State<FinanceScreen> createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<FinanceScreen> {
  // Lista agora é uma variável do Estado (State) para poder ser alterada
  List<FinanceItem> items = [
    FinanceItem("Comida", Icons.restaurant_menu, "805,87", const Color(0xFF7FE3AE)),
    FinanceItem("Transporte", Icons.directions_bus, "353,54", const Color(0xFFC7A8FF)),
    FinanceItem("Energia", Icons.bolt, "143,25", const Color(0xFF7FE3AE)),
    FinanceItem("Água", Icons.water_drop, "56,23", const Color(0xFFC7A8FF)),
    FinanceItem("Fast-food", Icons.fastfood, "60,00", const Color(0xFF7FE3AE)),
    FinanceItem("Gasolina", Icons.local_gas_station, "180,02", const Color(0xFF7FE3AE)),
    FinanceItem("Aluguel", Icons.home, "600,00", const Color(0xFFC7A8FF)),
  ];

  // Função para abrir a janela de edição
  void _editItem(int index) {
    TextEditingController nameController = TextEditingController(text: items[index].name);
    TextEditingController valueController = TextEditingController(text: items[index].value);
    
    // Variável temporária para controlar o ícone selecionado no modal
    IconData selectedIcon = items[index].icon;
    Color selectedColor = items[index].color;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          // StatefulBuilder é necessário para atualizar o ícone DENTRO do diálogo
          builder: (context, setDialogState) {
            return AlertDialog(
              backgroundColor: const Color(0xFF1C1C1E),
              title: const Text("Editar Item", style: TextStyle(color: Colors.white)),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Campo Nome
                    TextField(
                      controller: nameController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: "Nome da Categoria",
                        labelStyle: TextStyle(color: Colors.white70),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white24)),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Campo Valor
                    TextField(
                      controller: valueController,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: "Valor (sem R\$)",
                        labelStyle: TextStyle(color: Colors.white70),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white24)),
                        prefixText: "R\$ ",
                        prefixStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Escolha um Ícone:", style: TextStyle(color: Colors.white70)),
                    ),
                    const SizedBox(height: 10),
                    // Seleção de Ícones
                    Wrap(
                      spacing: 15,
                      runSpacing: 15,
                      children: [
                        _IconOption(Icons.restaurant_menu, const Color(0xFF7FE3AE), selectedIcon, (icon, color) => setDialogState(() { selectedIcon = icon; selectedColor = color; })),
                        _IconOption(Icons.directions_bus, const Color(0xFFC7A8FF), selectedIcon, (icon, color) => setDialogState(() { selectedIcon = icon; selectedColor = color; })),
                        _IconOption(Icons.bolt, const Color(0xFF7FE3AE), selectedIcon, (icon, color) => setDialogState(() { selectedIcon = icon; selectedColor = color; })),
                        _IconOption(Icons.water_drop, const Color(0xFFC7A8FF), selectedIcon, (icon, color) => setDialogState(() { selectedIcon = icon; selectedColor = color; })),
                        _IconOption(Icons.fastfood, const Color(0xFF7FE3AE), selectedIcon, (icon, color) => setDialogState(() { selectedIcon = icon; selectedColor = color; })),
                        _IconOption(Icons.local_gas_station, const Color(0xFF7FE3AE), selectedIcon, (icon, color) => setDialogState(() { selectedIcon = icon; selectedColor = color; })),
                        _IconOption(Icons.home, const Color(0xFFC7A8FF), selectedIcon, (icon, color) => setDialogState(() { selectedIcon = icon; selectedColor = color; })),
                        _IconOption(Icons.shopping_bag, const Color(0xFF7FE3AE), selectedIcon, (icon, color) => setDialogState(() { selectedIcon = icon; selectedColor = color; })),
                        _IconOption(Icons.videogame_asset, const Color(0xFFC7A8FF), selectedIcon, (icon, color) => setDialogState(() { selectedIcon = icon; selectedColor = color; })),
                      ],
                    )
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancelar", style: TextStyle(color: Colors.white54)),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFF3C300)),
                  onPressed: () {
                    // Aqui a mágica acontece: Atualiza a lista principal
                    setState(() {
                      items[index].name = nameController.text;
                      items[index].value = valueController.text;
                      items[index].icon = selectedIcon;
                      items[index].color = selectedColor;
                    });
                    Navigator.pop(context);
                  },
                  child: const Text("Salvar", style: TextStyle(color: Colors.black)),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
              const Text(
                "Toque em um item para editar",
                style: TextStyle(color: Colors.white54, fontSize: 14),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      // Adicionamos o evento de clique no card
                      onTap: () => _editItem(index),
                      child: FinanceCard(item: items[index]),
                    );
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

// Widget auxiliar para as bolinhas de ícone no Modal
class _IconOption extends StatelessWidget {
  final IconData icon;
  final Color color;
  final IconData selectedIcon;
  final Function(IconData, Color) onSelect;

  const _IconOption(this.icon, this.color, this.selectedIcon, this.onSelect);

  @override
  Widget build(BuildContext context) {
    bool isSelected = icon == selectedIcon;
    return GestureDetector(
      onTap: () => onSelect(icon, color),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? color : Colors.white10,
          shape: BoxShape.circle,
          border: isSelected ? Border.all(color: Colors.white, width: 2) : null,
        ),
        child: Icon(icon, color: isSelected ? Colors.black : Colors.white70, size: 24),
      ),
    );
  }
}

// Classe de dados (Modelo) - Tiramos o "final" para permitir edição
class FinanceItem {
  String name;
  IconData icon;
  String value;
  Color color;

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
            "- R\$ ${item.value}",
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
          const SizedBox(width: 10),
          const Icon(Icons.edit, size: 16, color: Colors.black45) // Ícone indicando que é editável
        ],
      ),
    );
  }
}
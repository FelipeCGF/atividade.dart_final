import 'package:flutter/material.dart';
import '../controller/finance_controller.dart';
import '../model/finance_item.dart';

class FinanceScreen extends StatefulWidget {
  const FinanceScreen({super.key});

  @override
  State<FinanceScreen> createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<FinanceScreen> {
  final FinanceController _controller = FinanceController();
  
  List<FinanceItem> items = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData(); 
  }

  
  void _loadData() async {
    List<FinanceItem> loadedItems = await _controller.loadList();
    setState(() {
      items = loadedItems;
      _isLoading = false;
    });
  }

  
  void _saveData() {
    _controller.saveList(items);
  }

  
  void _editItem(int index) {
    TextEditingController nameController = TextEditingController(text: items[index].name);
    TextEditingController valueController = TextEditingController(text: items[index].value);
    
    
    IconData selectedIcon = IconData(items[index].iconCode, fontFamily: 'MaterialIcons');
    Color selectedColor = Color(items[index].colorValue);

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              backgroundColor: const Color(0xFF1C1C1E),
              title: const Text("Editar Item", style: TextStyle(color: Colors.white)),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nameController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(labelText: "Nome", labelStyle: TextStyle(color: Colors.white70)),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: valueController,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(labelText: "Valor", labelStyle: TextStyle(color: Colors.white70)),
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      spacing: 15, runSpacing: 15,
                      children: [
                        _IconOption(Icons.restaurant_menu, const Color(0xFF7FE3AE), selectedIcon, (i, c) => setDialogState(() { selectedIcon = i; selectedColor = c; })),
                        _IconOption(Icons.directions_bus, const Color(0xFFC7A8FF), selectedIcon, (i, c) => setDialogState(() { selectedIcon = i; selectedColor = c; })),
                        _IconOption(Icons.bolt, const Color(0xFF7FE3AE), selectedIcon, (i, c) => setDialogState(() { selectedIcon = i; selectedColor = c; })),
                        _IconOption(Icons.water_drop, const Color(0xFFC7A8FF), selectedIcon, (i, c) => setDialogState(() { selectedIcon = i; selectedColor = c; })),
                        _IconOption(Icons.fastfood, const Color(0xFF7FE3AE), selectedIcon, (i, c) => setDialogState(() { selectedIcon = i; selectedColor = c; })),
                        _IconOption(Icons.home, const Color(0xFFC7A8FF), selectedIcon, (i, c) => setDialogState(() { selectedIcon = i; selectedColor = c; })),
                      ],
                    )
                  ],
                ),
              ),
              actions: [
                TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancelar", style: TextStyle(color: Colors.white54))),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFF3C300)),
                  onPressed: () {
                    setState(() {
                      items[index].name = nameController.text;
                      items[index].value = valueController.text;
                      items[index].iconCode = selectedIcon.codePoint;
                      items[index].colorValue = selectedColor.value;
                    });
                    _saveData(); 
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
            children: [
               GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Row(
                  children: const [
                    Icon(Icons.arrow_back, color: Colors.white),
                    SizedBox(width: 10),
                    Text("Controle financeiro", style: TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _isLoading 
                ? const Center(child: CircularProgressIndicator(color: Color(0xFFF3C300)))
                : Expanded(
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
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

class FinanceCard extends StatelessWidget {
  final FinanceItem item;
  const FinanceCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
      decoration: BoxDecoration(
        color: Color(item.colorValue),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.black12,
            child: Icon(IconData(item.iconCode, fontFamily: 'MaterialIcons'), color: Colors.black87),
          ),
          const SizedBox(width: 14),
          Expanded(child: Text(item.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
          Text("- R\$ ${item.value}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(width: 10),
          const Icon(Icons.edit, size: 16, color: Colors.black45)
        ],
      ),
    );
  }
}
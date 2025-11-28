import 'dart:convert';
import 'package:flutter/material.dart'; 
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../model/finance_item.dart';


class FinanceController {
  
  
  Future<Map<String, dynamic>> convertCurrency(double balanceBRL, String target) async {
    try {
      final url = Uri.parse('https://economia.awesomeapi.com.br/last/USD-BRL,EUR-BRL');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        double rate = 1.0;
        String symbol = "R\$";

        if (target == "USD") {
          rate = double.parse(data['USDBRL']['bid']);
          symbol = "\$";
        } else if (target == "EUR") {
          rate = double.parse(data['EURBRL']['bid']);
          symbol = "€";
        }

        double newBalance = balanceBRL / rate;
        return {
          'balance': newBalance.toStringAsFixed(2).replaceAll('.', ','),
          'symbol': symbol,
          'rate': "Cotação: R\$ ${rate.toStringAsFixed(2).replaceAll('.', ',')}"
        };
      }
    } catch (e) {
      debugPrint("Erro API: $e");
    }
    return {}; 
  }

  
  
  
  Future<void> saveList(List<FinanceItem> items) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      
      List<String> stringList = items.map((item) => json.encode(item.toMap())).toList();
      await prefs.setStringList('finance_items', stringList);
      
      
      debugPrint("✅ Sucesso: ${items.length} itens salvos no celular!");
    } catch (e) {
      debugPrint("❌ Erro ao salvar dados: $e");
    }
  }

  
  Future<List<FinanceItem>> loadList() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      List<String>? stringList = prefs.getStringList('finance_items');

      if (stringList != null) {
        debugPrint("📥 Carregando lista salva do celular...");
        
        return stringList.map((item) => FinanceItem.fromMap(json.decode(item))).toList();
      }
    } catch (e) {
      debugPrint("❌ Erro ao carregar dados: $e");
    }
    
    debugPrint("⚠️ Nenhuma lista salva encontrada. Usando padrão.");
    
    return [
      FinanceItem(name: "Comida", value: "805,87", colorValue: 0xFF7FE3AE, iconCode: Icons.restaurant_menu.codePoint),
      FinanceItem(name: "Transporte", value: "353,54", colorValue: 0xFFC7A8FF, iconCode: Icons.directions_bus.codePoint),
      FinanceItem(name: "Energia", value: "143,25", colorValue: 0xFF7FE3AE, iconCode: Icons.bolt.codePoint),
      FinanceItem(name: "Água", value: "56,23", colorValue: 0xFFC7A8FF, iconCode: Icons.water_drop.codePoint),
      FinanceItem(name: "Fast-food", value: "60,00", colorValue: 0xFF7FE3AE, iconCode: Icons.fastfood.codePoint),
    ];
  }
}
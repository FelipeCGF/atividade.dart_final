
class FinanceItem {
  String name;
  String value;
  int colorValue; 
  int iconCode;   

  FinanceItem({
    required this.name,
    required this.value,
    required this.colorValue,
    required this.iconCode,
  });

  
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'value': value,
      'colorValue': colorValue,
      'iconCode': iconCode,
    };
  }

  
  factory FinanceItem.fromMap(Map<String, dynamic> map) {
    return FinanceItem(
      name: map['name'],
      value: map['value'],
      colorValue: map['colorValue'],
      iconCode: map['iconCode'],
    );
  }
}
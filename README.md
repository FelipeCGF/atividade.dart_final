# Projeto_controlefinanceiro

[![Flutter](https://img.shields.io/badge/Flutter-%5E3.9.2-blue)]()
[![Dart](https://img.shields.io/badge/Dart-Null--Safety-blueviolet)]()
[![License](https://img.shields.io/badge/License-MIT-green)]()

Aplicativo Flutter de controle financeiro, desenvolvido como atividade prática.  
O projeto demonstra consumo de API externa via HTTP, armazenamento local com `shared_preferences`, uso de assets e estrutura completa de app mobile em Flutter/Dart.

---

## 📌 Funcionalidades

- Consumo de API usando o pacote `http`.
- Salvamento de dados localmente com `shared_preferences`.
- Estrutura organizada para expansão do projeto.
- Uso de imagens e assets declarados no `pubspec.yaml`.
- Layout simples e adaptável.

---

## 🛠 Tecnologias Utilizadas

- **Flutter** (SDK 3.x ou superior recomendado)
- **Dart** com null-safety
- Pacotes principais:
  - `http`
  - `shared_preferences`
  - `cupertino_icons`

---

## 🚀 Como Executar o Projeto

### 1. Clone o repositório
```bash
git clone https://github.com/FelipeCGF/atividade.dart_final.git
cd atividade.dart_final
```
### 2. Instale as dependências
```bash
flutter pub get
```
### 3. Execute no emulador ou dispositivo
```bash
flutter run
```

### 4. Gerar APK (modo release)
```bash
flutter build apk --release
```

## 📂 Estrutura do Projeto
.
├── lib/
│   ├── main.dart
│   ├── screens/
│   ├── services/
│   ├── models/
│   ├── widgets/
│   └── utils/
├── assets/
│   └── images/
├── test/
├── pubspec.yaml
├── README.md
└── LICENSE

## 🔒 Boas Práticas Recomendadas

- Nunca exponha chaves de API no código.

- Trate erros de rede (try/catch).

- Use gerenciamento de estado (Provider / Riverpod / MobX / BLoC) ao escalar o app.

- Prefira modelos (models) tipados para tratar JSON.

- Otimize imagens antes de colocar em assets/.

## 📈 Melhorias Sugeridas (TODO)

- Criar organização modular dentro de lib/.

- Adicionar tratamento de erros nas requisições.

- Adicionar testes unitários para API e lógica.

- Criar página de configurações para limpar dados locais.

- Implementar CI com GitHub Actions.

- Adicionar screenshots da interface.

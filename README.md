# Flutter Application 1

Este é um projeto Flutter desenvolvido para demonstrar integração com APIs externas e persistência de dados local.

## 🚀 Funcionalidades

O aplicativo conta com as seguintes integrações principais:

* **Conexão com API:** Utiliza o pacote `http` para realizar requisições de rede e conectar a serviços externos.
* **Armazenamento Local:** Utiliza o `shared_preferences` para salvar e recuperar dados diretamente no dispositivo do usuário (persistência).
* **Assets:** Gerenciamento de imagens locais (ex: `assets/statue.png`).

## 📦 Tecnologias e Pacotes

As principais dependências definidas no `pubspec.yaml` são:

* [Flutter SDK](https://flutter.dev) (versão ^3.9.2)
* [http](https://pub.dev/packages/http)
* [shared_preferences](https://pub.dev/packages/shared_preferences)
* [cupertino_icons](https://pub.dev/packages/cupertino_icons)

## 🛠️ Como rodar o projeto

Certifique-se de ter o Flutter instalado em sua máquina.

1.  **Instale as dependências:**
    Abra o terminal na pasta raiz do projeto e execute:
    ```bash
    flutter pub get
    ```

2.  **Execute o aplicativo:**
    ```bash
    flutter run
    ```

## 📂 Estrutura de Pastas

* `lib/`: Contém o código fonte principal do Dart.
* `assets/`: Contém recursos estáticos como imagens (configurado no `pubspec.yaml`).

---
Flutter.

# App Manager v1.1.3

O App Manager é uma ferramenta projetada para simplificar a gestão de aplicativos em sistemas operacionais Windows.
Com interface intuitiva, este aplicativo oferece uma maneira conveniente e centralizada de gerenciar 
e acessar todos os seus aplicativos instalados.

## Exemplos:

![Exemplo](./example/app_manager_example.png)

## Principais Recursos:
- **Visualização Organizada**: O aplicativo apresenta visualização de todos os aplicativos instalados no sistema, 
que já foram mapeados, facilitando a localização e o acesso rápido aos programas desejados.


- **Categorias Personalizadas**: Os aplicativos podem ser organizados em categorias personalizadas,
permitindo que os usuários agrupem aplicativos de acordo com suas preferências e necessidades específicas.


- **Pesquisa Rápida**: Com a funcionalidade de pesquisa integrada,
os usuários podem encontrar facilmente aplicativos específicos,
apenas digitando parte do nome ou palavra-chave relacionada. **(Em breve)**

- **Personalização Avançada**: O aplicativo oferece opções de personalização avançadas,
permitindo que os usuários ajustem o layout, cores e outras configurações,
de acordo com suas preferências individuais. **(Em breve)**

## Benefícios:
- **Eficiência**: Economiza tempo e esforço dos usuários.


- **Praticidade**: Simplifica a gestão de aplicativos, gerindo todos em um só lugar.

## Como Configurar:

- O usuario devera copiar o esquema de pastas e arquivos que estão localizados dentro de example.
(Se quiser gerar um novo build os arquivos copiados deveram ser os scripts, logos, config.json).

- Ajustar o config.json para o que quer que reflita dentro do app.

- Dentro da pasta scrips devera copiar um script e simplesmente trocar o path.

- Dentro da pasta icons colocar todos os icons q seram ultilizados.

## Como Usar:

- O usuario devera entrar no app e então escolher o app que deseja abrir, o aplicativo abrira o app e fechara sozinho.

## Comandos pertinentes:

```bash
flutter clean
```

```bash
flutter pub get
```

```bash
flutter config --enable-windows-desktop
```

```bash
flutter run -d windows
```

```bash
flutter build windows
```

## Linguagens Utilizadas:
* [Flutter](https://flutter.dev/?gclsrc=aw.ds)

## Libs Utilizadas:
* [path_provider: ^2.1.3](https://pub.dev/packages/path_provider)
* [window_manager: ^0.3.8](https://pub.dev/packages/window_manager)
* [flutter_svg: ^2.0.10+1](https://pub.dev/packages/flutter_svg)

## Site Para Imagens:
* [Icons8](https://icons8.com.br/)

## Contato:

Para perguntas, feedback ou suporte, entre em contato conosco em bmb.bezerra0@gmail.com
Para saber mais entre em https://bmb-portfolio.dev

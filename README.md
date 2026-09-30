# Lagoas do RN

Exemplo didático em Flutter para uma aula de **navegação entre telas** e **passagem de parâmetros**.

O assunto do app é turismo: uma lista de lagoas do Rio Grande do Norte. Esse conteúdo só ilustra o percurso. O que a aula treina é sair de uma tela, levar dados para a outra e montar a interface com o que chegou.

## Objetivo

Ao final, o aluno deve conseguir:

- abrir uma segunda tela a partir de um item da lista;
- enviar para essa tela o título e o objeto da lagoa escolhida;
- ler esses parâmetros no construtor da tela de destino;
- usar os campos recebidos (`nome`, `imagemUrl`, `localidade`, `likes` e `descricao`) nos widgets;
- voltar para a lista com `Navigator.pop`.

## O que o app faz

1. A `HomePage` lista as lagoas.
2. O toque em um item chama `Navigator.push` e abre a `ShowPage`.
3. A rota leva dois argumentos: o nome da lagoa, usado na `AppBar`, e o objeto `Lagoa` inteiro.
4. A `ShowPage` desenha a ficha com foto, título, localidade, curtidas, botões e descrição.
5. O botão **Voltar** desempilha a rota e retorna à lista.

O envio dos parâmetros está em `lib/presentation/pages/home_page.dart`:

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => ShowPage(title: lagoa.nome, lagoa: lagoa),
  ),
);
```

A tela de destino declara o que precisa receber em `lib/presentation/pages/show_page.dart`:

```dart
const ShowPage({super.key, required this.title, required this.lagoa});
```

Cada lagoa da lista produz uma ficha diferente porque os widgets leem `lagoa`, e não um texto fixo.

## Por onde começar

| Arquivo | Papel na aula |
| --- | --- |
| `lib/main.dart` | Sobe o app e define a `HomePage` como tela inicial. |
| `lib/domain/models/lagoa.dart` | Modelo e lista usados como dados da navegação. |
| `lib/domain/usecases/listar_lagoas.dart` | Entrega a lista para a home. |
| `lib/presentation/pages/home_page.dart` | Lista e dispara a navegação com parâmetros. |
| `lib/presentation/pages/show_page.dart` | Recebe os parâmetros e monta a ficha. |
| `lib/presentation/widgets/` | Pedaços da ficha: título, botões e texto. |

## Como executar

Com o [Flutter](https://docs.flutter.dev/get-started/install) instalado, na raiz do projeto:

```bash
flutter pub get
flutter run
```

As fotos vêm da internet. Sem rede, a lista abre, mas a imagem da ficha não carrega.

## O que observar

- Troque de lagoa e confira se título, foto, localidade, curtidas e texto mudam juntos.
- No botão **Voltar**, a lista continua no mesmo lugar: a segunda tela foi empilhada e depois removida.
- Os botões CALL, ROUTE e SHARE fazem parte do layout. Eles ainda não executam ação.
- A `ButtonSection` não recebe a lagoa. Por isso esses botões são iguais em todas as fichas.

## Prática sugerida

1. Passe só alguns campos (`nome` e `descricao`) em vez do objeto inteiro e veja o que a ficha deixa de conseguir mostrar.
2. Faça o botão ROUTE receber a `localidade` da lagoa que está aberta.
3. Inclua mais um parâmetro, por exemplo um subtítulo fixo da aula, e exiba-o na `AppBar` ou no corpo da `ShowPage`.
4. Experimente voltar para a lista sem o botão, usando a seta da `AppBar`, e compare com o `Navigator.pop`.

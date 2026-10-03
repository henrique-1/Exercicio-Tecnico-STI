# Gestão de Veículos - Teste Técnico STI

Olá! 👋 Este repositório contém a minha solução para o teste técnico de desenvolvimento da **STI**, focado na implementação de um sistema completo de **Cadastro e Gestão de Veículos (CRUD)** com busca reativa, seleção de marcas e modelos em cascata, validações de regras de negócio e persistência local relacional.

A aplicação foi projetada prioritariamente para ambiente **Desktop (Linux e Windows)**, mas com arquitetura totalmente desacoplada e responsiva para rodar em Web ou Mobile.

---

## 💡 Decisões Técnicas e Arquitetura

Optei por uma arquitetura **Feature-First Clean Architecture**, balanceando boas práticas com pragmatismo:

### 1. Separação Feature-First
Organizei o código por domínio funcional (`features/vehicles`) e recursos compartilhados (`core/`). Dessa forma, caso o sistema cresça para gerenciar motoristas, viagens ou frotas, cada módulo evolui de forma independente sem virar um monólito espalhado por camadas globais.

```
lib/
├── core/                        # Infraestrutura compartilhada
│   ├── database/                # Drift Database, tabelas relacionais e seeds
│   ├── errors/                  # Falhas tipadas de domínio (AppFailure)
│   ├── router/                  # Rotas declarativas com GoRouter
│   ├── theme/                   # Cores e Design System da STI
│   └── utils/                   # Validadores e formatadores (brasil_fields)
├── features/
│   └── vehicles/                # Feature completa de veículos
│       ├── domain/              # Modelos imutáveis (Freezed) e contratos (i_vehicle_repository)
│       ├── data/                # Implementação do repositório e queries com Joins
│       └── presentation/        # Notifiers Riverpod, páginas e componentes visuais
└── main.dart                    # Entry point e inicialização
```

### 2. Por que sem UseCases burocráticos?
Para operações de CRUD com persistência local, criar uma classe de UseCase apenas para repassar uma chamada de método para o repositório seria adicionar *boilerplate* desnecessário (*overengineering*). Optei por conectar os **Controllers/Notifiers do Riverpod** diretamente aos contratos de interface do repositório (`IVehicleRepository`). Isso mantém o código limpo, fácil de ler e 100% testável com mocks.

### 3. Banco de Dados: Drift (SQLite) com 3FN
Para cumprir os diagramas lógico e conceitual fornecidos, a modelagem foi estruturada na **Terceira Forma Normal (3FN)**:
- `MARCAS`: Tabela pai de montadoras.
- `MODELOS`: Relacionada com chave estrangeira para `MARCAS` e `ON DELETE CASCADE`.
- `CARROS`: Relacionada com `MODELOS`, com restrições `UNIQUE` para **Placa** e **Chassis**.

Utilizar o **Drift** trouxe grandes vantagens:
- **Type-Safety**: Erros em colunas e tipos são pegos em tempo de compilação.
- **Reatividade com Streams**: O método `watchVehicles()` atualiza a tela instantaneamente sempre que um veículo é criado, editado ou excluído.
- **Testabilidade**: Nos testes automatizados, instanciamos o banco em memória (`NativeDatabase.memory()`) de forma rápida e isolada.

> **Scripts SQL Entregues**: Conforme exigido no teste, criei os scripts DDL em `assets/sql/`:
> - [`sql_server_create_database.sql`](assets/sql/sql_server_create_database.sql) (Microsoft SQL Server)
> - [`sqlite_create_database.sql`](assets/sql/sqlite_create_database.sql) (SQLite)

---

## 🚗 Regras de Negócio e UX

Algumas atenções aos detalhes que implementei para garantir consistência e boa experiência de uso:

1. **Formatação e Sanitização de Placa**:
   - Integração com o pacote `brasil_fields` (`PlacaVeiculoInputFormatter`) para aplicar a máscara visual em tempo real no formulário.
   - Suporte tanto ao padrão antigo (`ABC-1234`) quanto ao padrão Mercosul (`ABC1D23`).
   - Forçador de caixa alta na digitação (`UpperCaseTextFormatter`) e sanitização no envio para garantir que a placa seja sempre salva em maiúsculas e sem pontuação desnecessária.
   - Exibição da placa nos cards em um badge estilizado no formato oficial.

2. **Chassis (VIN)**:
   - Validação de 17 caracteres alfanuméricos, rejeitando caracteres inválidos e garantindo unicidade no banco.

3. **Dropdowns em Cascata**:
   - Ao selecionar uma Marca, a lista de Modelos é filtrada de forma reativa.
   - Caso a marca seja alterada, o modelo anteriormente selecionado é automaticamente resetado para evitar inconsistência de dados.

4. **Feedback Visual e Prevenção de Falhas**:
   - Durante a busca ou carregamento, a lista exibe skeletons shimmer animados (`Skeletonizer`), prevenindo saltos de layout (*layout shifts*).
   - Validação preventiva de duplicidade de placa e chassis antes da persistência, retornando alertas claros em Snackbar temático.
   - Confirmação de exclusão com modal seguro para evitar cliques acidentais.

5. **Identidade Visual**:
   - Apliquei a paleta de cores institucional da STI (`#0F52BA` Azul Safira, `#F8FAFC` Fundo, `#10B981` Sucesso, `#EF4444` Destrutivo, etc.) centralizada em `AppTheme`.

---

## 🧪 Suíte de Testes Automatizados

Escrevi **20 testes automatizados** cobrindo os pilares fundamentais da aplicação:

```bash
flutter test
```

- **Validações de Regra de Negócio** (`test/core/utils/validators_test.dart`): 11 testes garantindo que placas tradicionais e Mercosul, limites de ano, chassis e obrigatoriedade funcionam como esperado.
- **Repositório & Integridade Relacional** (`test/features/vehicles/data/vehicle_repository_test.dart`): 8 testes de integração executando inserções, buscas por placa/modelo, integridade referencial com Joins e bloqueio de duplicidade em banco em memória.
- **Widgets e Interação** (`test/features/vehicles/presentation/vehicle_list_page_test.dart`): Teste de interface validando a renderização dos cards, digitação na pesquisa em tempo real e atualização dos resultados.

---

## ⚙️ CI/CD com GitHub Actions

Configurei um pipeline automatizado em `.github/workflows/build.yml` disparado a cada commit ou pull request:

- **Versionamento Incremental Automático**: A Action extrai a versão semântica do `pubspec.yaml` (`0.1.0+1`) e incrementa o build number com o contador da Action (`${{ github.run_number }}`), garantindo rastreabilidade contínua.
- **Build Windows**: Compila em release e gera um **instalador executável nativo (.exe)** com **Inno Setup** (`packaging/windows/setup.iss`), que instala o app em `Program Files`, cria atalhos no Menu Iniciar e Desktop e disponibiliza desinstalador.
- **Build Linux**: Compila em release e empacota em um **`.AppImage` universal** via `appimagetool` (`packaging/linux/`), portátil e compatível com as principais distribuições Linux.
- **Artefatos**: Ambos os instaladores ficam disponíveis para download diretamente na aba *Actions* do GitHub.

---

## 🛠️ Como Executar o Projeto Localmente

### Pré-requisitos
- [Flutter SDK](https://flutter.dev) (versão 3.24+ / Dart 3.5+) instalado e configurado no PATH.
- No Linux: ferramentas padrão de build (`clang`, `cmake`, `ninja-build`, `pkg-config`, `libgtk-3-dev`).

### Passo a passo:

1. **Clone o repositório**:
   ```bash
   git clone <URL_DO_SEU_REPOSITORIO>
   cd teste_sti
   ```

2. **Instale as dependências**:
   ```bash
   flutter pub get
   ```

3. **Gere os arquivos de código (Drift, Freezed, Riverpod)**:
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Execute no Desktop**:
   ```bash
   # Linux
   flutter run -d linux

   # Windows
   flutter run -d windows
   ```

*(O banco de dados local SQLite já é inicializado automaticamente com dados de exemplo de marcas, modelos e veículos na primeira inicialização).*

---

## 📸 Demonstração da Aplicação

### Tela Principal (Listagem e Pesquisa em Tempo Real)
*(Insira aqui os prints da tela principal com a listagem e o filtro de busca)*

### Formulário de Cadastro e Edição (Seleção em Cascata)
*(Insira aqui os prints do formulário de criação/edição)*

### Validações e Alertas
*(Insira aqui os prints das mensagens de erro amigáveis e validação de placa/chassis)*

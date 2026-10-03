# Exercício Técnico - Cadastro de Veículos (STI)

Aplicação desenvolvida para o processo seletivo da **STI**, implementando um sistema completo de **Cadastro de Veículos (CRUD)** com busca por Placa ou Modelo, validações estritas de regras de negócio e modelagem relacional em banco de dados.

---

## 🛠️ Tecnologias Utilizadas

- **Linguagem**: [Dart](https://dart.dev) (v3.12+)
- **Framework**: [Flutter](https://flutter.dev) (v3.44+)
- **Banco de Dados**: SQLite gerenciado via [Drift](https://drift.simonbinder.eu/) e `drift_flutter`
- **Gerenciamento de Estado & DI**: [Riverpod](https://riverpod.dev) (`hooks_riverpod`, `riverpod_annotation`, `riverpod_generator`)
- **Imutabilidade e Entidades de Domínio**: [Freezed](https://pub.dev/packages/freezed)
- **Navegação Declarativa**: [GoRouter](https://pub.dev/packages/go_router)
- **Design System & UX**: Material 3, [Google Fonts](https://pub.dev/packages/google_fonts) (Inter), [Skeletonizer](https://pub.dev/packages/skeletonizer) (Shimmer loading)
- **Responsividade & Desktop**: [Sizer](https://pub.dev/packages/sizer) e [window_manager](https://pub.dev/packages/window_manager)

---

## 🏛️ Arquitetura do Projeto

O projeto adota a **Feature-First Clean Architecture**, garantindo estrita separação de responsabilidades (Separation of Concerns), desacoplamento entre interface e persistência, e facilidade de testes automatizados.

```
lib/
├── core/
│   ├── database/
│   │   ├── app_database.dart          # Drift Database com conexão drift_flutter
│   │   ├── tables/
│   │   │   ├── marcas_table.dart      # Mapeamento da tabela MARCAS
│   │   │   ├── modelos_table.dart     # Mapeamento da tabela MODELOS (FK para MARCAS)
│   │   │   └── carros_table.dart      # Mapeamento da tabela CARROS (FK para MODELOS, UK Placa e Chassis)
│   │   └── seed/
│   │       └── initial_data.dart      # Carga inicial com marcas, modelos e veículos
│   ├── errors/
│   │   └── app_failure.dart           # Modelagem de falhas tipadas (Domain Failures)
│   ├── router/
│   │   └── app_router.dart            # Rotas declarativas (/ , /novo, /editar)
│   ├── theme/
│   │   └── app_theme.dart             # Tema Material 3 customizado com Google Fonts
│   └── utils/
│       ├── formatters.dart            # Formatters (ex: UpperCaseTextFormatter em tempo real)
│       └── validators.dart            # Validadores puros de regras de negócio
├── features/
│   └── vehicles/
│       ├── domain/
│       │   ├── models/
│       │   │   ├── vehicle.dart       # Entidade Freezed Vehicle (com Marca e Modelo)
│       │   │   ├── vehicle_brand.dart # Entidade Freezed VehicleBrand
│       │   │   └── vehicle_model.dart # Entidade Freezed VehicleModel
│       │   └── repositories/
│       │       └── i_vehicle_repository.dart # Interface/Contrato do repositório
│       ├── data/
│       │   └── repositories/
│       │       └── vehicle_repository_impl.dart # Implementação com queries Drift e Joins
│       └── presentation/
│           ├── controllers/
│           │   └── vehicle_providers.dart # Notifiers do Riverpod (CRUD, stream reativo, busca)
│           ├── widgets/
│           │   ├── vehicle_card.dart          # Card do veículo com placa estilizada e ações
│           │   ├── vehicle_search_bar.dart    # Barra de busca por placa ou modelo
│           │   ├── vehicle_delete_dialog.dart # Modal de confirmação segura de exclusão
│           │   └── vehicle_skeleton_list.dart # Placeholder com Skeletonizer para loading
│           └── views/
│               ├── vehicle_list_page.dart     # Listagem reativa e pesquisa
│               └── vehicle_form_page.dart     # Cadastro e edição com seleção em cascata
└── main.dart                                  # Setup inicial, ProviderScope e execução
```

---

## 🗄️ Modelagem do Banco de Dados

Seguindo os diagramas conceitual e lógico presentes em `assets/brModelo/`, a modelagem relacional foi estruturada na **3ª Forma Normal (3FN)**:

```
[MARCAS] 1 ──────── N [MODELOS] 1 ──────── N [CARROS]
(MAR_ID, MAR_NOME)   (MOD_ID, MOD_NOME,    (CAR_ID, CAR_PLACA [UQ],
                      FK_MARCAS_MAR_ID)      CAR_COR, CAR_ANO, CAR_PORTE,
                                             CAR_TIPO_CARGA, CAR_CHASSIS [UQ],
                                             FK_MODELOS_MOD_ID)
```

### Scripts SQL Disponíveis
Para atender às exigências de entrega do teste técnico, foram disponibilizados dois scripts DDL completos:
1. **Microsoft SQL Server**: [`assets/sql/sql_server_create_database.sql`](file:///home/henrique_1/Documents/teste_sti/assets/sql/sql_server_create_database.sql)
2. **SQLite**: [`assets/sql/sqlite_create_database.sql`](file:///home/henrique_1/Documents/teste_sti/assets/sql/sqlite_create_database.sql)

Ambos contêm criação de tabelas, chaves primárias, chaves estrangeiras com `ON DELETE CASCADE`, constraints `UNIQUE` para Placa e Chassis, índices de otimização de busca e dados iniciais de carga (seed).

---

## 📋 Regras de Negócio e Validações Implementadas

| Regra do Exercício | Implementação no Projeto |
| :--- | :--- |
| **Todos os campos são obrigatórios** | Validados via `AppValidators` no formulário e com constraints `NOT NULL` no banco. |
| **A placa não poderá ser duplicada** | Constraint `UNIQUE` no banco e validação preventiva no repositório antes da inserção/edição com mensagem amigável. |
| **O chassis não poderá ser duplicado** | Constraint `UNIQUE` no banco e checagem preventiva no repositório com mensagem amigável. |
| **A placa deverá ser gravada em letras maiúsculas** | Forçada na digitação com `UpperCaseTextFormatter` e sanitizada (`toUpperCase()`) no domínio. |
| **Validação de placa brasileira** | Valida tanto o padrão tradicional (`ABC-1234`) quanto o padrão Mercosul (`ABC1D23`). |
| **Validação de chassis (VIN)** | Exatamente 17 caracteres alfanuméricos válidos, rejeitando caracteres proibidos pela ISO (I, O, Q). |
| **Ano do veículo** | Numérico entre 1900 e o ano seguinte ao atual. |
| **Mensagens amigáveis em caso de erro** | Feedback visual com `SnackBar` temático (sucesso em verde, erro em vermelho com detalhes claros) e validações inline nos campos. |
| **Confirmação de exclusão** | Diálogo modal de confirmação exibindo dados do veículo antes de remover do banco. |

---

## 🚀 Como Executar o Projeto

### Pré-requisitos
- [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado (versão 3.12 ou superior)
- Git instalado

### Passo a Passo

1. **Clonar o Repositório**:
   ```bash
   git clone <URL_DO_REPOSITORIO>
   cd teste_sti
   ```

2. **Instalar Dependências**:
   ```bash
   flutter pub get
   ```

3. **Gerar Códigos (Drift, Freezed, Riverpod)**:
   ```bash
   dart run build_runner build
   ```

4. **Executar a Aplicação**:
   ```bash
   # Execução em Desktop (Linux / Windows)
   flutter run -d linux
   # ou
   flutter run -d windows
   # ou no seu navegador / emulador
   flutter run -d chrome
   ```

---

## 🧪 Testes Automatizados

O projeto conta com suíte completa de testes automatizados cobrindo testes unitários, testes de integração de repositório (com banco SQLite em memória) e testes de widgets de tela.

Para executar todos os testes:
```bash
flutter test
```

### Testes Implementados:
- **`test/core/utils/validators_test.dart`**: 11 testes unitários cobrindo validações de placas (Mercosul e padrão antigo), formatos de chassis de 17 caracteres, anos permitidos e sanitização de maiúsculas.
- **`test/features/vehicles/data/vehicle_repository_test.dart`**: 8 testes de integração testando todo o ciclo de vida do CRUD, integridade relacional, busca por placa ou modelo e prevenção de duplicidade de placa e chassis.
- **`test/features/vehicles/presentation/vehicle_list_page_test.dart`**: Teste de widget testando renderização da lista, pesquisa reativa em tempo real e filtros de exibição.

---

## 🚀 CI/CD Automatizado (GitHub Actions)

O repositório possui uma pipeline completa configurada em `.github/workflows/build.yml` que é disparada automaticamente a cada commit/push e pull request:

- **Versionamento Incremental**: Lê a versão semântica e o build base de `pubspec.yaml` (`0.1.0+1`) e incrementa o build number com o contador da Action (`${{ github.run_number }}`).
- **Build Windows**: Compila a versão release e gera um **instalador executável autônomo (.exe)** via Inno Setup (`packaging/windows/setup.iss`), instalando o app no sistema, adicionando atalhos e desinstalador.
- **Build Linux**: Compila a versão release e empacota em um **executável universal (.AppImage)** via `appimagetool` (`packaging/linux/`), pronto para rodar em qualquer distribuição Linux.
- **Publicação dos Artefatos**: Ambos os binários são gerados, validados e disponibilizados para download nos artefatos da Action.

---

## 📸 Demonstração da Aplicação

### Listagem e Pesquisa de Veículos
*(Insira aqui os prints da tela principal com a listagem de veículos e pesquisa)*

### Cadastro e Edição com Seleção em Cascata (Marca -> Modelo)
*(Insira aqui os prints do formulário de cadastro)*

### Validações e Mensagens Amigáveis
*(Insira aqui os prints de validação de campos obrigatórios, placa em maiúsculas e alerta de duplicidade)*

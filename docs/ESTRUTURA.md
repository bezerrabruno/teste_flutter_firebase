# Teste Flutter Firebase
Ultima atualização: 09/04/25

## Padrão estrutural


```bash
App
├── assets/
│   ├── gif/
│   │   ├── exemplo.gif
│   │   └── ...
│   ├── png/
│   │   ├── exemplo.png
│   │   └── ...
│   ├── svg/
│   │   ├── exemplo.svg
│   │   └── ...
├── docs/
│   ├── exemplo.md
│   └── ...
├── lib/
│   ├── app/
│   │   ├── core/
│   │   │   ├── firebase/
│   │   │   │   ├── analytics.dart
│   │   │   │   ├── crashltics.dart
│   │   │   │   └── ...
│   │   │   ├── app_module.dart
│   │   │   └── app_widget.dart
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   ├── external/
│   │   │   │   │   ├── api_exemplo_datasource.dart
│   │   │   │   │   └── ...
│   │   │   │   └── internal/
│   │   │   │       ├── cache_exemplo_datasource.dart
│   │   │   │       └── ...
│   │   │   └── ...
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   ├── exemplo_entity.dart
│   │   │   │   └── ...
│   │   │   ├── interfaces/
│   │   │   │   ├── exemplo_repository.dart
│   │   │   │   │   └── ...
│   │   │   └── usecases/
│   │   │       ├── exemplo_usecase.dart
│   │   │       └── ...
│   │   ├── infra/
│   │   │   ├── interfaces/
│   │   │   │   ├── external/
│   │   │   │   │   ├── external_exemplo_datasource.dart
│   │   │   │   │   └── ...
│   │   │   │   └── internal/
│   │   │   │       ├── internal_exemplo_datasource.dart
│   │   │   │       └── ...
│   │   │   └── repositories/
│   │   │       ├── data_exemplo_repository.dart
│   │   │       └── ...
│   │   └── module/
│   │       └── exemplo/
│   │       │   ├── pages/
│   │       │   │   ├── exemplo_page.dart
│   │       │   │   └── ...
│   │       │   ├── controller/
│   │       │   ├── exemplo_controller.dart
│   │       │   └── ...
│   │       │   ├── bloc/
│   │       │   │   ├── exemplo_bloc.dart
│   │       │   │   └── ...
│   │       │   ├── widgets/
│   │       │   │   ├── exemplo_widget.dart
│   │       │   │   └── ...
│   │       │  └── exemplo_module.dart
│   │       └── ...
│   └── main.dart
├── test/
│   ├── app/
│   │   ├── core/
│   │   │   ├── firebase/
│   │   │   │   ├── analytics_test.dart
│   │   │   │   ├── crashltics_test.dart
│   │   │   │   └── ...
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   ├── external/
│   │   │   │   │   ├── api_exemplo_datasource_test.dart
│   │   │   │   │   └── ...
│   │   │   │   └── internal/
│   │   │   │       ├── cache_exemplo_datasource_test.dart
│   │   │   │       └── ...
│   │   │   └── ...
│   │   ├── infra/
│   │   │   └── repositories/
│   │   │       ├── data_exemplo_repository_test.dart
│   │   │       └── ...
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   ├── exemplo_entity_test.dart
│   │   │   │   └── ...
│   │   │   └── usecases/
│   │   │       ├── exemplo_usecase_test.dart
│   │   │       └── ...
│   │   ├── integration/
│   │   ├── exemplo_inegration.dart
│   │   └── ...
│   │   └── mock/
│   │       ├── exemplo_mock.dart
│   │       └── ...
├── .gitignore
├── .metadata
├── analysis_options.yaml
├── pubspec.yaml
└── README.md
```

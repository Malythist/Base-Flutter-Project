# Core data слой

Этот каталог содержит базовые абстракции для работы с удалёнными источниками данных.

## Назначение

Core data слой нужен для:
- Уменьшения дублирующегося кода в датасорсах
- Единого подхода к работе с HTTP
- Контроля структуры ответов бекенда

## BaseRemoteDataSource

BaseRemoteDataSource — основа всех remote data source’ов.

Он предоставляет:
- GET / POST / PUT / PATCH / DELETE методы
- Автоматическую сборку URL через ApiConfig
- Хелперы для работы с JSON

## Низкоуровневые методы

- getRequest
- postRequest
- putRequest
- patchRequest
- deleteRequest

Используются только если:
- Ответ имеет нестандартный формат
- Нужен полный контроль над Dio
- Работа идёт с файлами или стримами

## Высокоуровневые JSON-хелперы (рекомендуется)

- getListJson
- getObjectJson
- postObjectJson
- putObjectJson
- patchObjectJson

Эти методы:
- Проверяют контракт ответа
- Генерируют понятные ошибки
- Убирают boilerplate с кастами

При стандартном бекенде всегда используйте их.

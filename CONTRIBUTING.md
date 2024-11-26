# Помочь в разработке легко

## Настройка окружения

### Платформа 1С:Предприятие

Для разработки используется платформа версии `8.3.24.1548`

### Дополнительные инструменты

Для корректной разработки потребуются дополнительные инструменты:

- Oscript. Используемая версия движка `stable`
  - Инструкция по установке(TODO: добавить ссылку)
- Vrunner. Используемая версия 2.2.2
- Precommit4onec
- Расширение `YAXUNIT`

### Последовательность действий при инициализации

1. Склонируйте репозиторий `git clone`
1. Установите Onescript
1. Установите необходимые пакеты(opm install vrunner precommit4onec)
1. Установите precommit-hook выполнив `precommit4onec install <Путь к репозиторию>` заменив <путь к репозиторию> на ваш.
1. Скопируйте файл `[env.json.example](env.json.example)` и переименуйте его в `env.json`
1. При необходимости внесите изменения в файл `env.json` (cm `vrunner help`)
1. Запустите подготовленный скрипт [prepare.cmd](prepare.cmd)

#### Первоначальная настройка YAXUNIT

1. Откройте конфигуратор
1. Откройте параметры запуска (`Сервис-Параметры-Запуск 1С: Предприятия`)
1. Установите в параметр запуска следующую строку `RunUnitTests=<Путь к репозиторию>\tests\uaxunit_config.json` заменив <путь к репозиторию> на ваш.
1. Теперь при запуске 1с пердприятия будут выполняться тесты и открываться форма с результатами.

Поздравляю, вы молодец и готовы приступать к разработке.

### Автоматическая настройка окружения

Для автоматической настройки окружения реализован [init-project.cmd](init-project.cmd) после первого клонирования репозитория вы можете запустить этот файл и он автоматически сконфигурирует ваш проект, скачает нужные пакеты и подготовит базу для разработки.

Пока этот функционал в разработке и может работать не стабильно. Буду благодарен за обратную связь.

## Процесс разработки

Мы используем git-flow. и наш процесс разработки выглядит примерно так:

1. Перед стартом разработки, первым делом создаем ветку отводя ее от актуальной версии ветки `develop` и переключаемся на нее. `git checkout -b <ИмяВашейВетки> develop`
1. Запускаем [update.cmd](update.cmd) и обновляем свою БД конфигурацией из требуемой ветки. (!ВНИМАНИЕ! ЭТО ОБЯЗАТЕЛЬНЫЙ ПУНКТ. ИНАЧЕ МОГУТ ВОЗНИКНУТЬ ПРОБЛЕМЫ С ФАНТОМНЫМИ ИЗМЕНЕНИЯМИ!)
1. Продумываем функционал, и подготавливаем тесты, которые будут тестировать результат нашей разработки.
1. Реализуем задуманый функционал
1. Проверяем, что "тесты зеленые". Это значит, что мы не сломали ничего из уже написанного.
1. Запускаем [deсompile.bat](decompile.bat)
1. Описываем сделанные изменения в сообщении коммита и фиксируем их.
1. Создаем MR из вашей ветки в ветку develop
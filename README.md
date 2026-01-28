# Автоматизированная сборка библиотеки SQLite

Данный проект реализует автоматизированную кроссплатформенную сборку библиотеки SQLite с помощью CMake и формирует оптимизированный Docker-образ.

Так же в проекте реализована полная автоматизация процесса через Vagrant и Ansible, от создания ВМ до получения финального артефакта

### 1. Быстрый запуск библиотеки через Dockerfile

Если вам нужен только контейнер в текущей среде:

```bash
docker build -t sqlite-builder .
# для проверки что библиотека скомпилирована
docker run --rm sqlite-builder ls -la /usr/local/lib/
```

### 2. Автоматизация через Vagrant + Ansible

Автоматическое создание ВМ

```bash
vagrant up
```

### 3. Управление через Ansible
Если вы хотите запускать сценарии вручную внутри ВМ или на своем сервере:


```bash
# Установка Docker и настройка окружения
ansible-playbook -i ansible/inventory.ini ansible/install_docker.yml

# Сборка библиотеки и создание образа
ansible-playbook -i ansible/inventory.ini ansible/build_sqlite.yml
```

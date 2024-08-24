#  Дипломная работа по профессии «Системный администратор»
## Слынько Дмитрий Юриевич

Содержание
==========
* [Задача](#задача)
* [Инфраструктура](#инфраструктура)
    * [Сайт](#сайт)
    * [Логи](#логи)
    * [Мониторинг](#мониторинг)
    * [Сеть](#сеть)
    * [Резервное копирование](#резервное-копирование)

Веб-ресурсы:
- <p><a href="http://51.250.40.140">сайт< 7.4</a></p>
- <p><a href="http://62.84.117.139:3000">Графана< 7.4</a></p>
- <p><a href="http://62.84.112.57:5601">Эластик< 7.4</a></p>
---------
## Задача
Ключевая задача — разработать отказоустойчивую инфраструктуру для сайта, включающую мониторинг, сбор логов и резервное копирование основных данных. Инфраструктура должна размещаться в [Yandex Cloud](https://cloud.yandex.com/).


## Инфраструктура
Для развёртки инфраструктуры используем [Terraform](./terraform), а для установки ПО [Ansible](./ansible).

Terraform:

Проверяем правильность синтаксиса файлов Terraform, план создания инфраструктуры

<img src = "./img/Screenshot_20240824_195003.png " width = 100%>

И запускаем terraform apply и дожидаемся окончания создания инфраструктуры и вывода информации output

<img src = "./img/Screenshot_20240824_195702.png" width = 100%>

Заранее подготовленный [output-ansible-hosts](./terraform/output.tf) сохраняем в отдельный файл hosts для ansible и удаляем лишнее из файла

<img src = "./img/Screenshot_20240824_200025.png" width = 100%>

Проверяем доступность созданных ВМ с помощью ansible all -m ping

<img src = "./img/Screenshot_20240824_200231.png" width = 100%>

Переходим к установке и настройке ПО с помощью Ansible

### Сайт
Запускаем playbook - [webservers-playbook.yml](./ansible/webservers-playbook.yml)

По окончанию выполнения playbook проверяем что сервисы nginx, node_exporter и nginx_logexporter работаю

<img src = "./img/Screenshot_20240824_205927.png" width = 100%>

Проверяем что наш сайт работает

<img src = "./img/Screenshot_20240824_210006.png" width = 100%>

### Логи
Запускаем playbook - [log-playbook.yml](./ansible/log-playbook.yml)

По завершению выполнения playbook проверяем что контейнеры с elasticsearch и kibana работают

<img src = "./img/Screenshot_20240824_210648.png" width = 100%>

<img src = "./img/Screenshot_20240824_210845.png" width = 100%>

<img src = "./img/Screenshot_20240824_210931.png" width = 100%>

Уставноку filebeat - [log-filebeat-playbook.yml](./ansible/log-filebeat-playbook.yml)

<img src = "./img/Screenshot_20240824_212004.png" width = 100%>

Заходим в Kibana для проверки что логи nginx с web серверов поступают

<img src = "./img/Screenshot_20240824_212810.png" width = 100%>

<img src = "./img/Screenshot_20240824_212852.png" width = 100%>

### Мониторинг
Запускаем playbook - [monitoring-playbook.yml](./ansible/monitoring-playbook.yml)

Проверяем что работа playbook завершилась без ошибок

<img src = "./img/Screenshot_20240824_213556.png" width = 100%>

Заходим в Grafana для проверки работоспособности наших ранее импортированных дашбордов 

NGINX Servers Metrics:

<img src = "./img/Screenshot_20240824_214337.png" width = 100%>

<img src = "./img/Screenshot_20240824_214409.png" width = 100%>

<img src = "./img/Screenshot_20240824_214437.png" width = 100%>

Node Exporter Full:

<img src = "./img/Screenshot_20240824_214522.png" width = 100%>

### Сеть

<img src = "./img/Screenshot_20240824_214712.png" width = 100%>

<img src = "./img/Screenshot_20240824_214719.png" width = 100%>

<img src = "./img/Screenshot_20240824_214739.png" width = 100%>

### Резервное копирование

<img src = "./img/Screenshot_20240824_215238.png" width = 100%>
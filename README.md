# Написание скриптов Bash
Домашнее задание (далее ДЗ) по теме Bash
## Создание виртуальной машины
Виртуальная машина создается с помощью Vagrant. Используется Российский репозиторий Vagrant Box.  
Создаем в своем домашнем каталоге директорию под ДЗ и клонируем этот репозиторий из GitHub.
```
  mkdir ~/otus/
  cd ~/otus/
  git clone git@github.com:Mihail-Pavlov-AI/lab-bash.git
```
Переходим в каталог и запускаем установку виртуальной машины, используем Vagrant файл. Будет установелена виртуальная машина Ubuntu 22.4 с 4мя дисками для теста с программным RAID.
```
 cd ~/otus/lab-bash
 vagrant up 
```
## Подготовка Ansible на хосте виртуализации.
В данном примере в роди хоста используется машина с Ubuntu 24.04.2 LTS и версией ansible = 2.16.3, python version = 3.12.3  
В файле ~/otus/lab-bash/ansible.cfg прописаны: путь к  inventory файлу и имя пользователя для подключения к виртуальной машине.
Это сделано, что бы сократить количество данных, которые нужно указывать в inventory файле и при запуске команды ansible
Inventory файл расположен в каталоге staging/hosts, подключаемся под пользователем vagrant
## Установка, конфигурирование и проверка консольного почтового клиента mutt
Конфигурационный файл почтового клиента находится в каталоге conf/.muttrc  
Ansible laybook установит mutt и скопирует конфиг файл
Запускаем playbook
```
ansible-playbook mutt.yml
```
Редактируем файл конфигурации mutt виртуальной машины
```
vagrant ssh
sudo -i
vi ~/.muttrc
```
Это конфиг файл под почтовый сервис Yandex.  
По настройкам можно посмотреть например здесь  
https://www.dmosk.ru/miniinstruktions.php?mini=mutt&ysclid=m7hpb8qten105143979  
Меняем в конфиг файле для почтового сервиса Yandex следующие строки  

set from = email@domain.com  
set smtp_url = 'smtps://email@domain.com@smtp.yandex.com:465'  
set smtp_pass = "password_from_email@domain.com"  

Проверяем ходит ли почта
```
echo 'The text of the message' | mutt -s "Test message" -- email@domain.com
```

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
## Запускаем Ansible скрипт с машины хоста.
В данном примере используется машина с Ubuntu 24.04.2 LTS и версией ansible = 2.16.3, python version = 3.12.3
```

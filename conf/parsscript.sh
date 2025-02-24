#!/bin/bash
date "+%d/%b/%Y:%H:%M:%S %z" >> /var/lib/parsscript.log # Отправляем время запуска скрипта в лог, нужно для создания отчета с момента прошлого запуска
### current_time_minus_one_nour=$(date --date="1 hour ago" "+%d/%b/%Y:%H")  # Текущее время минус один час
### echo $current_time_minus_one_nour  #  Для отладки, удалить


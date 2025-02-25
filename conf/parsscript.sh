#!/bin/bash
## Блокировка двойново запуска скрипта  https://qna.habr.com/q/122609?ysclid=m7kf99z5d7193173292
# Проверяем существует ли лог файл скрипта, если не существует, то создаем файл
if [ ! -f /var/log/parsscript.log ]
then
        touch /var/log/parsscript.log
fi

last_script_run=$(sed -n '$p' /var/log/parsscript.log)  ## Время последнего запуска скрипта присваивается переменной, берется из лога
current_date=$(date "+%Y/%m/%d:%H:%M:%S%z")  #  Присваиваем переменной значение текущей даты в формате, например 2025/02/25:12:29:41 +0300
echo $current_date >> /var/log/parsscript.log # Отправляем текущую дату в лог файл скрипта 

# Проход по файлу построчно https://kodekloud.com/blog/read-file-in-bash/
logfile_path=/var/log/access.log # назначаем переменной полный путь к файлу с логами для обработки
IFS=$'\n'  # Устанавливаем разделитель полей для bash скрипта. Будет учитываться исключительно перевод строки
for LINE in $(cat $logfile_path)
do
    
        ##echo "$LINE"

        line_data=$(echo "$LINE" | awk '{print $4 $5}' | cut -c 2-26 | sed -r 's/\//\ /g' | sed -r 's/:/ /')
        ##echo "$line_data"
        line_data_formated=$(date -d "$line_data" "+%Y/%m/%d:%H:%M:%S%z")
        echo "$line_data_formated"



done

### current_time_minus_one_nour=$(date --date="1 hour ago" "+%d/%b/%Y:%H")  # Текущее время минус один час
### echo $current_time_minus_one_nour  #  Для отладки, удалить

# Базы данных
# Урок 1. Установка окружения


# Установка VirtualBox либо VMWare Player
# https://www.virtualbox.org/wiki/Downloads

# Скачивем Linux Ubuntu 18.04 LTS
# https://ubuntu.com/download/desktop

# Устанавливаем Linux на виртуальную машину

# Действия после окончания установки Ubuntu:

# 1. Установим обновления
sudo apt update
sudo apt upgrade

# 2. Установим некоторые пакеты, которые необходимы для гостевых дополнений ОС
sudo apt install gcc make perl

# 3. Установим гостевые дополнения
# В меню Устройства на вехней панели выбрать последний пункт
# Подключить образ диска Дополнений гостевой ОС
# Подтвердить запуск
# Ввести пороль, который вы задали на этапе установки

# Установить openssh-server
sudo apt install openssh-server

# Включить двунаправленный буфер обмена и перегрузить виртуальную машину

# Устанавливаем MySQL 8
wget -c https://dev.mysql.com/get/mysql-apt-config_0.8.10-1_all.deb
sudo apt-key adv --keyserver keys.gnupg.net --recv-keys 5072E1F5
sudo dpkg -i mysql-apt-config_0.8.10-1_all.deb
sudo apt update
sudo apt-get install mysql-server

# Смотрим версии
mysql -V
mysqld -V

# Заходим в консольный клиент
mysql -u root -p

# Подключение к удалённой машине через ssh
ssh ваш_логин@ваш_IP
mysql -u root -p
exit


# Установливаем MySQL8 на  Windows
# https://dev.mysql.com
# Выбираем Custom Setup

# Установка Putty
# https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html

# Подключение к удалённой машине с помощью Putty

# Установка MySQL Workbench
# https://dev.mysql.com/downloads/workbench/

# Установка Dbeaver
# https://dbeaver.io/download/

# После установки подключаемся консольным клиентом
# Добавляем путь в Path если нужно
# Подключаемся через Workbench
# Устанавливаем и подключаемся через DBeaver

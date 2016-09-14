# LVagrant
# Vagrant box для работы в с окружением Битрикс

-	Устанавливаем virtualBox (https://www.virtualbox.org/)
-	Устанавливаем vagrant (https://www.vagrantup.com/)

Для ускоренной работы с публичной папкой включен NFS. Для работы NFS под windows выполняем команду vagrant plugin install vagrant-winnfsd

# Структура каталогов

project_name
- vagrant(файлы vagrant)
- www(Файлы проекта)

```sh
cd ./project/vagrant
vagrant up
```

# Примечание:
- Почтовый сервер не работает на отправку писем на mail.ru, на почтовые серверы yandex.ru - работает, на остальные не проверялось.
- Скорость работы файловой структуры будет намного ниже чем на обычном сервере, это связанно с синхронизацией публичной папки.

# После запуска проекта будет выполненно:
- Установка CentOS 6.7 86x64
- Установка Веб-окружения от Битрикс
- Настройка некоторых параметров сервера для удобной разработки
- Активируется XDebug
- Создаются системные папки /tmp/php_sessions/www и /tmp/php_upload/www;
- Добавляются директивы: в /etc/httpd/bx/custom/z_bx_custom.conf `EnableSendfile Off`; в /etc/nginx/bx/conf/bitrix_general.conf `sendfile off`;
- Качается http://www.1c-bitrix.ru/download/scripts/bitrixsetup.php в /home/bitrix/www/bitrixsetup.php.

Установлен параметр private_network - config.vm.network "private_network", ip: "192.168.50.4"

vagrant up - Запуск Виртуальной машины
vagrant halt - Выключение Виртуальной машины с сохранением всего состояния
vagrant destroy - Удаление Виртуальной машины

Пароль для root пользователя vagrant

Web сервер на виртуальной машине работает на 80 порту.

http://www.vagrantbox.es/

# Vagrant box для работы в с окружением Битрикс

-	Устанавливаем virtualBox (https://www.virtualbox.org/)
-	Устанавливаем vagrant (https://www.vagrantup.com/)

Для ускоренной работы с публичной папкой включен NFS. Для работы NFS под windows выполняем команду 
```sh
vagrant plugin install vagrant-winnfsd
```
Иногда необходимо установить vbguest
```sh
vagrant plugin install vagrant-vbguest
```

# Структура каталогов

project_name
- vagrant(файлы vagrant)
- www(Файлы проекта)

В файле ./vagrant/vagrantfile необходимо указать config.vm.box = "name_project" имя проекта и указать нужный virtualbox config.vm.box_url=https://atlas.hashicorp.com/bento/boxes/centos-6.7/versions/2.2.7/providers/virtualbox.box

```sh
cd ./project/vagrant
vagrant up
```

> После остановки vagrant halt и запуска vagrant up необходимо выполнить следующее (один раз)

```sh
vagrant ssh
su root
sh /opt/VBox*/init/vboxadd setup
```

> После установки bitrix-env почему то некорректно запускается vboxadd

# Примечание:
- Почтовый сервер не работает на отправку писем на mail.ru, почтовые серверы yandex.ru - работает, на остальные не проверялось.
- Скорость работы файловой структуры будет намного ниже чем на обычном сервере, это связанно с синхронизацией публичной папки.

# После запуска проекта будет выполненно:
- Установка CentOS выбронной версии (CentOS-6.7 или CentOS-7.2)
- Выолнено обнвление ОС (yum -y upgrade)
- Скачивается http://repos.1c-bitrix.ru/yum/bitrix-env.sh
- Установка Веб-окружения от Битрикс
- Настройка некоторых параметров сервера для удобной разработки
- Активируется XDebug
- Создаются системные папки /tmp/php_sessions/www и /tmp/php_upload/www;
- Добавляются директивы: в /etc/httpd/bx/custom/z_bx_custom.conf `EnableSendfile Off`; в /etc/nginx/bx/conf/bitrix_general.conf `sendfile off`;
- Качается http://www.1c-bitrix.ru/download/scripts/bitrixsetup.php в /home/bitrix/www/bitrixsetup.php.

Установлен параметр private_network - config.vm.network "private_network", ip: "192.168.50.4"

- vagrant up - Запуск Виртуальной машины
- vagrant halt - Выключение Виртуальной машины с сохранением всего состояния
- vagrant destroy - Удаление Виртуальной машины

Пароль для root пользователя vagrant

Web сервер на виртуальной машине работает на 80 порту.

Готовые BOX: http://www.vagrantbox.es/

- CentOS 6.7 https://atlas.hashicorp.com/bento/boxes/centos-6.7/versions/2.2.7/providers/virtualbox.box "bento/centos-6.7"
- Centos 7.2 https://atlas.hashicorp.com/bento/boxes/centos-7.2/versions/2.2.9/providers/virtualbox.box "bento/centos-7.2" (По умолчанию в Vagrantfile)

RVM — Ruby Version Manager 
Программа для управления версиями Ruby. 

Как быть если один проект использует Ruby 1.8.7, а другой 1.9.2? А что если при этом у вас 2 проекта под версией 1.9.2, но с разными наборами гемов? Хотелось бы вам иметь отдельные наборы gem's для каждого проекта? 

Основные задачи:
1. Физическое разделение версий ruby и наборов гемсетов
2. Возможность иметь несколько версий ruby и переключаться между ними
3. Возможность для каждой версии ruby иметь несколько gemsets — наборов gem's и переключаться между ними

Под катом будут описаны:
1. Установка RVM
2. Работа с разными версиями Ruby
3. Работа с gemsets
4. Задание окружения под отдельный проект с помощью .rvmrc
5. Команды RVM которые могут оказаться полезными 
6. Шпаргалка по основным командам RVM



1. Установка RVM

1. Для установки вам понадобятся curl и git (apt-get install git curl)
2.
    #Скачивание скрипта установки с сервера и запуск (от имени вашего пользователя)
     % bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
    

3. После установки нужно добавить информацию об установленном приложении rvm в bash
#Дописывает в конфигурационный файл bash строчку, которая проверяет наличие директории с rvm и если
#всё ок, запускает программу
% echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function'>>~/.bash_profile

В файле $HOME/.bashrc заменяем строчку [ -z "$PS1" ] && return на if [[ -n "$PS1" ]]; then Т.к. мы используем if, то в конце файла проставьте fi, это позволяет запускать программы в неинтерактивном режиме, а rvm как раз является примером такой программы
4. Проверяем как прошла установка 
% rvm -v 
rvm 1.6.20 by Wayne E. Seguin (wayneeseguin@gmail.com) [https://rvm.beginrescueend.com/] 
# если вы видите версию rvm, значит всё ОК 


2. Работа с разными версиями Ruby

Чтобы просмотреть все доступные для установки версии Ruby 
% rvm list known
# MRI Rubies
[ruby-]1.8.6[-p420]
[ruby-]1.8.6-head
[ruby-]1.8.7[-p334]
[ruby-]1.8.7-head
[ruby-]1.9.1-p378
[ruby-]1.9.1[-p431]
[ruby-]1.9.1-head
[ruby-]1.9.2[-p180]
[ruby-]1.9.2-head
ruby-head
# GoRuby
goruby
# JRuby
jruby-1.2.0
jruby-1.3.1
jruby-1.4.0
jruby-1.6.1
jruby[-1.6.2]
jruby-head

Предположим вы работаете с двумя версиями 1.8.7 для ROR2 и 1.9.2 для ROR3
# Устанавливаем 2 версии Ruby
% rvm install 1.8.7 
% rvm install 1.9.2 

Чтобы увидеть все установленные версии Ruby
% rvm list
rvm rubies
ruby-1.8.7-p334 [ i386 ]
ruby-1.9.2-p180 [ i386 ]

Переключиться на ruby 1.8.7
% rvm use ruby-1.8.7
Using /home/user/.rvm/gems/ruby-1.8.7-p334 

Использовать версию ruby 1.9.2 по умолчанию
% rvm use ruby 1.9.2 --default
Using /home/user/.rvm/gems/ruby-1.9.2-p180
% rvm list
rvm rubies
=> ruby-1.9.2-p180 [ i386 ] # "=>" показывают версию Ruby установленную по умолчанию
   ruby-1.8.7-p334 [ i386 ]


3. Работа с gemsets

Например вы используете Ruby On Rails версии 2 и 3 с Ruby 1.8.7 и для каждого из них у вас свой набор gem's.
Создадим два разных набора gemset'ов:
% rvm use 1.8.7@rails2 --create
Using /home/user/.rvm/gems/ruby-1.8.7-p334 with gemset rails2
% rvm use 1.8.7@rails3 --create
Using /home/user/.rvm/gems/ruby-1.8.7-p334 with gemset rails3
% rvm gemset list
gemsets for ruby-1.8.7-p334 (found in /home/slip/.rvm/gems/ruby-1.8.7-p334)
   global # gemset по умолчанию
   rails2
   rails3
% rvm use 1.8.7@rails3 --default # Использовать gemset rails3 по умолчанию
% rvm gemset list
gemsets for ruby 1.8.7-p334 (found in /home/user/.rvm/gems/ruby-1.8.7-p334)
    global
    rails2
 => rails3 # rails3 стоит по умолчанию

Gemset'ы можно удалять, очищать, экспортировать и импортировать гемы из одного в gemset'a в другой.
RVM предоставляет следующие команды для работы с gemsets:
create — создание нового gemset
export — экспорт списка гемов в файл default.gems
import — установка в текущий gemset списка гемов из файла default.gems
delete — удалить gemset
empty — очистить gemset

4. Задание окружения под отдельный проект с помощью .rvmrc

Как быть если у вас несколько проектов, каждый из которых используют разную версию gemset? Можно конечно переключиться между gemset'ами вручную с помощь rvm use {rubyversion}@{gemsetname}, но и тут RVM приходит нам на помощь, делая эту часть работы за нас. 
Создаем файл .rvmrc в корневой директории проекта. Например проект используют ruby версии 1.8.7 с gemset projectname.
#Содержимое файла .rvmrc
rvm use 1.8.7@projectname

Теперь когда вы заходите в директорию, cd /home/user/www/projectname — RVM исполняет команду из файла .rvmrc и вы видите на экране подобное сообщение
Using /home/user/.rvm/gems/ruby-1.8.7-p334 with gemset projectname

Таким образом вам больше не приходиться думать какой gemset использует конкретный проект и устанавливать его вручную.

5. Команды RVM которые могут оказаться полезными

1. Completion — позволяет использовать tab при работе с rvm 
Чтобы включить, добавьте строку [[ -r $rvm_path/scripts/completion ]] &&. $rvm_path/scripts/completion в файл .bashrc или .bash_profile, после строки с подлючением rvm. Подробнее можно почитать здесь rvm.beginrescueend.com/workflow/completion
2. rvmreset — перезагрузка RVM
3. rvm uninstall — удалить одну или несколько версию Ruby, оставив исходники
4. rvm implode — полностью удалить RVM (удаляет ВСЁ)

6. Шпаргалка по основным командам RVM

rvm list known — получить список всех версий ruby доступных для установки
rvm install 1.9.1 – установить ruby версии 1.9.1
rvm remove 1.9.2 – удалить ruby версии 1.9.2
rvm use 1.9.2 — переключиться на ruby версии 1.9.2
rvm use 1.9.2@rails3 --default — установить версию ruby 1.9.2 c gemset rails3 по умолчанию
rvm use system — использовать системную версию ruby
rvm list – список установленных версий ruby
rvm gemset list – список gemset'ов в выбранной версии ruby
rvm use 1.9.2@rails3 --create создать gemset rails3 для ruby версии 1.9.2
rvm gemset export — экспортировать гемсет в файл default.gems
rvm gemset import default.gems — установить gem's из списка в файле defaults.gem в текущий gemset
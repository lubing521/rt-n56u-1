* ИНСТРУКЦИЯ ПО СБОРКЕ ПРОШИВКИ RT-N56U *

1) Для сборки прошивки требуется Linux окружение 32 или 64 бита. Сборка прошивки
   протестирована на Linux дистрибутивах Debian squeeze 6.0.7 и Ubuntu 10.04, 
   10.10, 11.04.
2) Первым делом необходимо собрать кросс-toolchain (набор для кросс-компиляции)
   под MIPS32_R2 CPU, состоящий из пакетов binutils-2.21.1, gcc-447, uclibc-0.9.33.2.
   Перейти в директорию toolchain-rt3883 и выполнить скрипт сборки. Сборка
   кросс-toolchain занимает от 10 до минут до нескольких часов, в зависимости 
   от типа CPU хоста. Если кросс-toolchain уже собран, этот пункт пропускается.
3) Отредактировать вручную файл ".config" в корне дерева. Для комментирования 
   строк используется символ #. Если требуется отключить параметр, не следует 
   менять y на n, необходимо закомментировать строку целиком. Изменить параметр 
   "CONFIG_TOOLCHAIN_DIR=" на актуальный путь до директории с кросс-toolchain.
4) Собрать прошивку, запустив скрипт "build_firmware". Сборка прошивки может 
   занимать от 20 минут до нескольких часов. После сборки файл образа прошивки 
   (*.trx) будет находиться в директории images.


ВНИМАНИЕ!
После сборки прошивки убедитесь что размер файла образа прошивки (*.trx) не превышает
размер 7995392 байт!!! Где 8060928 - максимальный размер пространства под прошивку в 
NOR флеше RT-N56U, за минусом 65536 байт - размер раздела Storage.


* ПРИМЕЧАНИЕ *

Для сборки прошивки из под Linux дистрибутива Debian Squeeze требуются пакеты:
- build-essential
- gawk
- sudo
- pkg-config
- gettext
- automake
- autoconf
- libtool
- bison
- flex
- zlib1g-dev

Для сборки кросс-toolchain требуются дополнительные пакеты:
- libgmp3-dev
- libmpfr-dev
- libmpc-dev



-
31.03.2013
Padavan

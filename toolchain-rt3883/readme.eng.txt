* Ralink RT3883/3662 CROSS-TOOLCHAIN BUILD INSTRUCTION *

To build the cross-toolchain, you need Linux environment. Debian squeeze 6.0.7 
and Ubuntu 10.04 distros has been tested.

Just run build script "build_toolchain" and wait for the build process complete.

The "build_toolchain" script is intended to build cross-toolchain for Linux 
kernel 3.0.x. Target directory is "toolchain-3.0.x".


* CROSS-TOOLCHAIN PACKAGES *

binutils-2.21.1 + upstream patches
gcc-4.4.7 + upstream patches
uClibc-0.9.33.2 + upstream patches (for Linux kernel 3.0.x)


* NOTE *

To build the cross-toolchain under Debian squeeze you need the packages:
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
- libgmp3-dev
- libmpfr-dev
- libmpc-dev




-
04/24/2013
Padavan

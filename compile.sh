echo Installing deps...
sudo -p "Compiler needs admin permissions to continue: " apt install dpkg-dev
gcc -c add.c -Wall -Werror -fPIC
gcc -c subtract.c -Wall -Werror -fPIC
gcc -shared add.o subtract.o -o libhmath.so
cp libhmath.so debian/usr/lib/
dpkg-deb --build debian/
mkdir debs
mv debian.deb libhmath_1.0_all.deb
mv libhmath_1.0_all.deb debs/
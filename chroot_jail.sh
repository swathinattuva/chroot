#!/bin/bash
echo
echo "+ sudo mkdir /bashjail"
sudo mkdir /bashjail
echo

read -n 1 -s -r -p ""
sudo tree /bashjail
echo

read -n 1 -s -r -p ""
echo "+ sudo mkdir /bashjail/{bin,etc}"
sudo mkdir /bashjail/{bin,etc}
echo

read -n 1 -s -r -p ""
sudo tree /bashjail

read -n 1 -s -r -p ""
echo
echo "+ ldd /bin/bash"
ldd /bin/bash
echo

read -n 1 -s -r -p ""
echo "+ ldd /bin/ls"
ldd /bin/ls
echo


read -n 1 -s -r -p ""
echo "+ sudo mkdir -p /bashjail/{lib64,lib/x86_64-linux-gnu}"
sudo mkdir -p /bashjail/{lib64,lib/x86_64-linux-gnu}
echo


read -n 1 -s -r -p ""
sudo tree /bashjail
echo


read -n 1 -s -r -p ""
echo "+ sudo cp /bin/bash /bashjail/bin"
sudo cp /bin/bash /bashjail/bin


read -n 1 -s -r -p ""
echo
sudo tree /bashjail

read -n 1 -s -r -p ""
echo
echo "+ sudo cp /bin/ls /bashjail/bin"
echo
sudo cp /bin/ls /bashjail/bin


read -n 1 -s -r -p ""
echo
sudo tree /bashjail


read -n 1 -s -r -p ""
echo "PS1='JAIL $ '" | sudo tee /bashjail/etc/bash.bashrc
echo
read -n 1 -s -r -p ""

echo
# For ls Program
echo "# Copy ls program lib wrappers"
read -n 1 -s -r -p ""
for i in \
	/lib/x86_64-linux-gnu/libselinux.so.1 \
	/lib/x86_64-linux-gnu/libpcre.so.3 \
	/lib/x86_64-linux-gnu/libdl.so.2 \
	/lib/x86_64-linux-gnu/libpthread.so.0 ; \
do \
	sudo cp -v $i /bashjail/lib/x86_64-linux-gnu/; \
done
echo
read -n 1 -s -r -p ""
echo
sudo tree /bashjail
read -n 1 -s -r -p ""

echo
# For bash Program
echo "# Copy bash program lib wrappers"
read -n 1 -s -r -p ""
for i in \
	/lib/x86_64-linux-gnu/libtinfo.so.5 \
	/lib/x86_64-linux-gnu/libdl.so.2 \
	/lib/x86_64-linux-gnu/libc.so.6 \
	/lib64/ld-linux-x86-64.so.2 ; \
do \
	sudo cp -v $i /bashjail/lib/x86_64-linux-gnu/; \
done
echo

read -n 1 -s -r -p ""
echo
sudo tree /bashjail
read -n 1 -s -r -p ""
echo
echo "+ sudo cp /lib64/ld-linux-x86-64.so.2 /bashjail/lib64/"


read -n 1 -s -r -p ""
sudo cp /lib64/ld-linux-x86-64.so.2 /bashjail/lib64/
echo
read -n 1 -s -r -p ""
sudo tree /bashjail
echo
read -n 1 -s -r -p ""

#!/bin/bash

if ! [ $(id -u) = 0 ]; then
   echo "Ky script duhet te ekzekutohet si user root, ju lutem perdorni "sudo" "
   exit 1
fi

func () {
	mkdir -p /dir
	touch /dir/file.bin
	chmod 755 /dir
	chmod 754 /dir/file.bin

	useradd -m -s /bin/bash lh
       
	chown lh:lh /dir/file.bin
	
	}

	func


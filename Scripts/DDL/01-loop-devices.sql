#/bin/bash
echo "CREANDO DISPOSITIVOS CON LOOP DEVICES"
cd /unam-bda/disk-images

echo "CREANDO DISK1.IMG"
dd if=/dev/zero of=disk14.img bs=300M count=10
dd if=/dev/zero of=disk15.img bs=300M count=10
dd if=/dev/zero of=disk16.img bs=300M count=10

echo "MOSTRANDO LA CREACION DE LOS ARCHIVOS"
du -sh disk*.img

echo "ASOIANDO LOS ARCHIVOS IMG A LOOP DEVICES"
losetup -fP disk14.img
losetup -fP disk15.img
losetup -fP disk16.img

echo "COMPROBANDO LA ASOCIACION DE LOS LOOPDEVICES"
losetup -a

echo "DANDO FORMATO EXT4 A LOS 3 ARCHIVOS IMG"
mkfs.ext4 disk14.img
mkfs.ext4 disk15.img
mkfs.ext4 disk16.img

echo "CREANDO DIRECTORIOS (PUNTOS DE MONTAJE)"
mkdir /unam-bda/d14
mkdir /unam-bda/d15
mkdir /unam-bda/d16

echo "EDITAR /etc/fstab DE FORMA MANUAL"

#sudo mount -a
#Para revisar que todo salio bien a la hora de montar los archivos

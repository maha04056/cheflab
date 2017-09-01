#!/bin/bash

echo -e ” \nScan and Detect newly connected SCSI LUN”
host=`ls -l /sys/class/scsi_host/ | grep -v total | awk ‘{print $9}’ | awk -F”host” ‘{print $2}’`
for i in $host
do
echo “Rescaning scsi host /sys/class/scsi_host/host$i”
echo “- – -” > /sys/class/scsi_host/host$i/scan
done
echo -e “\n All the SCSI LUN scanned Sucessfully…..”
lun=$1
vg=$2
lv=$3
mp=$4
mkdir -p $mp
echo -e “\n\n Partition creation is begin”
partx -av $lun
pvcreate $lun
echo -e “\nPhysical Volume $lun Created”
vgcreate $vg $lun
echo -e “\n Volume Group $vgCreated”
lvcreate -l 100%FREE -n $lv $vg
echo -e “\n Logical Volume $lv Created”
mkfs.ext4 /dev/$vg/$lv
echo “/dev/$vg/$lv      $mp     ext4    defaults        1 2 ” | cat >> /etc/fstab
mount -a
s=` df -h | grep /test | awk ‘{print $1}’`
echo -e “\nNewly created LUN $mp = $s ”
echo -e “Partition successfully created”
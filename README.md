# meta-pcbd-trenz-linux

## System requirements under Linux:
- installed Vivado 2019.2.1
- installed PetaLinux Tools 2020.2

  we assume PetaLinux will be installed at /opt/Xilinx/petalinux
<br/>

## Rebuilding FPGA project:
- Download Trenz reference design for TE0803 SoM from the [Trenz download site](https://shop.trenz-electronic.de/Download/?path=Trenz_Electronic/Modules_and_Module_Carriers/5.2x7.6/TE0803/Reference_Design/2019.2/SK_DEMO1)
- Rebuild Vivado Project following instructions at [TE0803 SK Demo1](https://wiki.trenz-electronic.de/display/PD/TE0803+SK+Demo1)
Create XSA file as documented in step 3.5, the rest of the Trenz HOW-TO can be skipped. We assume XSA will be exported to 
```
    <Vivado_project_dir>/prebuilt/hardware/2cg_2gb/<Vivado_project_name>_2cg_2gb.xsa
```
<br/>

## Rebuilding Linux and boot files:
- create a working folder and execute the following
```
$ source /opt/Xilinx/petalinux/settings.sh
$ petalinux-create -t project --template zynqMP --name my-trenz-linux
$ cd my-trenz-linux/
$ cp <PATH_TO_XSA> .
$ cd project-spec/
$ git clone https://redmine.pcbdesign.hu/git/sw241 meta-pcbd-trenz-linux
$ cd ../
$ petalinux-config --get-hw-description
```
In petalinux-config chose "Yocto setting" --> "User Layers" --> "user layer 0" and enter:
```
${proot}/project-spec/meta-pcbd-trenz-linux/meta
```
Exit petalinux-config, save the modified configuration and build the required files by
```
$ petalinux-build
$ petalinux-package --boot --format BIN --fsbl images/linux/zynqmp_fsbl.elf --fpga images/linux/system.bit --u-boot --force
```
Among others the following 3 boot files will be generated:
- images/linux/BOOT.BIN
- images/linux/Image
- images/linux/boot.scr
<br/>

## Creating the final SD-card image with Debian:
- download debian image from the same [Trenz download site](https://shop.trenz-electronic.de/Download/?path=Trenz_Electronic/Modules_and_Module_Carriers/5.2x7.6/TE0803/Reference_Design/2019.2/SK_DEMO1)
- write it to an SD-card and mount it
- erase all files on the boot partition (240MiB vfat partition)
- copy the 3 boot files from images/linux to the boot partition
- edit /etc/fstab on the root partition and change 'mmcblk1' to 'mmcblk0'

Note that the Debian image doesn't contain Linux kernel modules, those need to be deployed manually.

<br/>

## Creating petalinux-image-minimal SD-card image:
```
$ petalinux-package --wic --bootfiles "BOOT.BIN Image boot.scr"
```
SD-card image will be written to images/linux/petalinux-sdimage.wic

This image will contain all the Linux kernel modules.

<br/>

## Testing USB gadget

Boot up Linux, login with 'root'/'root' and execute the following:
```
# dd if=/dev/zero bs=1M count=128 of=tmp_file
# modprobe g_mass_storage file=$(pwd)/tmp_file
```
<br/>

## Testing ethernet connection

Start iperf3 on PC in server mode:
```
$ iperf3 -s
```
Connect ethernet on PCB361 to the same network where the PC is (or directly to the PC). A DHCP server must also be running on this network.
Boot up Linux on PCB361, log in and execute the following:
```
# killall -9 udhcpc
# ip link set lan1 up
# ip link set lan2 up
# ip link add name br0 type bridge
# ip link set dev lan1 master br0
# ip link set dev lan2 master br0
# udhcpc -i br0
# iperf3 -c <IP address of PC running iperf3 server>
```
The same test can also be executed in the opposite direction.

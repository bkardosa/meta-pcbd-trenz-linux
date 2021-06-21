$ source /opt/Xilinx/petalinux/settings.sh
$ petalinux-create -t project --template zynqMP --name my-trenz-linux
$ cd my-trenz-linux/
$ cp ~/work/vivado/SK_DEMO1_noprebuilt/prebuilt/hardware/2cg_2gb/SK_DEMO1_noprebuilt_2cg_2gb.xsa .
$ petalinux-config --get-hw-description
$ cd project-spec
$ git clone https://gitea.pcbdesign.hu/bkardos/meta-pcbd-trenz-linux
$ cd ../
$ petalinux-config
  --> Yocto setting --> User Layers --> user layer 0
  Enter: "${proot}/project-spec/meta-pcbd-trenz-linux"
$ time petalinux-build
$ petalinux-package --boot --format BIN --fsbl images/linux/zynqmp_fsbl.elf --u-boot --force
$ cp images/linux/BOOT.BIN images/linux/Image images/linux/boot.scr ~/tmp/

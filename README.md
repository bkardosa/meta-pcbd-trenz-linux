# meta-pcbd-trenz-linux

System requirements under Linux:
- installed Vivado 2019.2.1
- installed PetaLinux Tools 2020.2

  we assume PetaLinux will be installed at /opt/Xilinx/petalinux
<br/>

Rebuilding FPGA project:
- Download Trenz reference design for TE0803 SoM from the [Trenz download site](https://shop.trenz-electronic.de/Download/?path=Trenz_Electronic/Modules_and_Module_Carriers/5.2x7.6/TE0803/Reference_Design/2019.2/SK_DEMO1)
- Rebuild Vivado Project following instructions at [TE0803 SK Demo1](https://wiki.trenz-electronic.de/display/PD/TE0803+SK+Demo1)
Create XSA file as documented in step 3.5, the rest of the HOW-TO can be skipped. We assume XSA will be exported to 
```
    <Vivado_project_dir>/prebuilt/hardware/2cg_2gb/<Vivado_project_name>_2cg_2gb.xsa
```
<br/>

Rebuilding FSBL for SoC

Original Trenz documentation can be found [here](https://wiki.trenz-electronic.de/display/PD/Project+Delivery+-+Xilinx+devices#ProjectDeliveryXilinxdevices-DesignEnvironment:Usage) but can only be used as a guidance. Follow these steps instead:
- still in Vivado execute `TE::sw_run_vitis` in TCL console
- Xilinx Vitis will be opened
- close the Welcome window and click File -> New -> Application Project
- choose a name for the project and click "Next"
- select the tab "Create new platform from hardware (XSA)" and press the "+" button
- navigate to the freshly built .xsa file, select it and press "Next"
- leave the next window unchanged and press "Next" again
- from the templates list select "Zynq MP FSBL (TE modified)" and press "Finish"
- in the "Explorer" window 2 projects will be listed. Right-click on the top one and select "Build Project"
- when the project is rebuilt FSBL.ELF will be found at
```
./workspace/sdk/<Vivado_project_name>_2cg_2gb/export/<Vivado_project_name>_2cg_2gb/sw/<Vivado_project_name>_2cg_2gb/boot/fsbl.elf
```
<br/>

Rebuilding Linux and boot files:
- create a working folder and execute the following
```
$ source /opt/Xilinx/petalinux/settings.sh
$ petalinux-create -t project --template zynqMP --name my-trenz-linux
$ cd my-trenz-linux/
$ cp <PATH_TO_XSA> .
$ petalinux-config --get-hw-description
```
Exit petalinux-config by selecting "Exit" --> "save new configuration"
```
$ cd project-spec/
$ git clone https://gitea.pcbdesign.hu/bkardos/meta-pcbd-trenz-linux
$ cd ../
$ petalinux-config
```
In petalinux-config chose "Yocto setting" --> "User Layers" --> "user layer 0" and enter:
```
${proot}/project-spec/meta-pcbd-trenz-linux
```
Exit petalinux-config, save the modified configuration and build the required files by
```
$ petalinux-build
$ petalinux-package --boot --format BIN --fsbl <PATH_TO_FSBL.ELF> --u-boot --force
```
Among others the following 3 boot files will be generated:
- images/linux/BOOT.BIN
- images/linux/Image
- images/linux/boot.scr
<br/>

Creating the final SD-card image:
- download debian image from the same [Trenz download site](https://shop.trenz-electronic.de/Download/?path=Trenz_Electronic/Modules_and_Module_Carriers/5.2x7.6/TE0803/Reference_Design/2019.2/SK_DEMO1)
- write it to an SD-card and mount it
- erase all files on the boot partition (240MiB vfat partition)
- copy the 3 boot files from images/linux to the boot partition
<br/>

Done!
<br/>


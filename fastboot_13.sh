#!/bin/bash
#############################################################################
# flash function
#############################################################################
fastboot_flash_4290_all(){
    fastboot flash super super.img 
    fastboot flash vbmeta_system_a vbmeta_system.img
    fastboot flash vbmeta_system_b vbmeta_system.img
    fastboot flash vbmeta_a vbmeta.img
    fastboot flash vbmeta_b vbmeta.img
    fastboot flash boot_a boot.img 
    fastboot flash boot_b boot.img 
    fastboot flash dtbo_a dtbo.img 
    fastboot flash dtbo_b dtbo.img 
    fastboot flash recovery_a recovery.img
    fastboot flash recovery_b recovery.img
}

fastboot_flash_all(){
    fastboot flash system system.img
    fastboot flash vendor vendor.img
    fastboot flash vbmeta vbmeta.img
    fastboot flash boot boot.img
    fastboot flash dtbo dtbo.img
}
fastboot_flash_system(){
    fastboot flash super super.img 
    fastboot flash vbmeta_system_a vbmeta_system.img
    fastboot flash vbmeta_system_b vbmeta_system.img
    fastboot flash vbmeta_a vbmeta.img
    fastboot flash vbmeta_b vbmeta.img
}
fastboot_flash_boot(){
    fastboot flash boot_a boot.img 
    fastboot flash boot_b boot.img 
    fastboot flash dtbo_a dtbo.img 
    fastboot flash dtbo_b dtbo.img 
}
fastboot_flash_xbl(){
    fastboot flash xbl_a xbl.elf
    fastboot flash xbl_b xbl.elf
    fastboot flash xbl_config_a xbl_config.elf
    fastboot flash xbl_config_b xbl_config.elf
}
fastboot_flash_abl(){
    fastboot flash abl_a abl.elf
    fastboot flash abl_b abl.elf
}
fastboot_erase_data(){
    fastboot erase userdata
    fastboot erase oem_a
    fastboot erase oem_b
    fastboot erase cache
    fastboot erase misc
    fastboot erase metadata
}
fastboot_flash_partion(){
	case $1 in
		all ) fastboot_flash_4290_all
		;;
		system | sys) fastboot_flash_system
		;;
		boot ) fastboot_flash_boot
		;;
		xbl )  fastboot_flash_xbl
		;;
		abl )  fastboot_flash_abl
		;;
		-a )   fastboot_erase_data
		;;
		oem-force-unlock ) fastboot oem force-allow-update
			return 1;
		;;
		oem-unlock ) fastboot flashing unlock
			return 1;
		;;
		*) echo "fastboot_flash_partion $1 not found"
		;;
	esac
}


fastboot_flash_func(){
	echo "flash $*"
	adb devices
	adb reboot bootloader
	for i in "$@"; do
		fastboot_flash_partion $i
	done
	if [ $? == 0 ] ; then
		fastboot reboot
	fi
}

#############################################################################
# flash help info
#############################################################################
fastboot_help(){
	echo "fastboot.sh user arg: "
	echo "all system sys boot xbl abl -a oem-force-unlock --help"
}
#############################################################################
# flash check parm

# if parm fail or --help , echo info end.

# if parm is specifed, only do this cmd.end.

# normal parm, enter fastboot flash func
#############################################################################
fastboot_check_parm(){
	for i in "$@"; do
		case $i in
			all|sys|system|boot|xbl|abl|-a) 
			;;
			oem-force-unlock|oem-unlock)
				fastboot_flash_func $i
				return 1;
			;;
			--help | -h )
				fastboot_help
				return 1;
			;;
			* )
				echo "fastboot.sh don't user parm $i"
				echo "please input --help for more info"
				return 1;
			;;
		esac
	done
}
#############################################################################
# main function

# check parm

#############################################################################
if [ "$#" == 0 ]; then
	fastboot_flash_func all
else
	fastboot_check_parm $@
	if [ $? == 0 ]; then
		fastboot_flash_func $@
	fi
fi



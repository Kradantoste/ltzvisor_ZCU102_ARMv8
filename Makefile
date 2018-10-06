HYPERVISOR_PRODUCT = LTZVisor
HYPERVISOR_MAJOR_VERSION = 0
HYPERVISOR_MINOR_VERSION = 2
HYPERVISOR_REVISION_VERSION = 1

export BOARD:= ZCU102_v8
export S_GUEST:= BARE_METAL
export NS_GUEST:= BARE_METAL

#if (BOARD = ZC702 or ZYBO or ZEDBOARD or ZCU102)
ifeq ($(BOARD), $(filter $(BOARD), ZC702 ZYBO ZEDBOARD ZCU102))
	export CROSS_COMPILE:= arm-none-eabi-
endif
ifeq ($(BOARD), ZCU102_v8)			# "aarch64-none-elf-" or "aarch64-linux-gnu-" are available
	export CROSS_COMPILE:= aarch64-none-elf-
endif

export SDK_PATH = $(CURDIR)

#export CROSS_COMPILE = /opt/CodeSourcery/arm-xilinx-gnueabi/bin/arm-xilinx-eabi-
#export CROSS_COMPILE = /opt/Linaro/gcc-linaro-7.1.1-2017.08-x86_64_arm-eabi/bin/arm-eabi-

all:
	echo 'LTZVisor builds start'
	$(MAKE) -C $(SDK_PATH)/src
	
clean:
	$(MAKE) -C $(SDK_PATH)/src clean

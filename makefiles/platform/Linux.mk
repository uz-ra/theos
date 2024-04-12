ifeq ($(_THEOS_PLATFORM_LOADED),$(_THEOS_FALSE))
_THEOS_PLATFORM_LOADED := 1
THEOS_PLATFORM_NAME := linux

_THEOS_PLATFORM_DEFAULT_TARGET := iphone
_THEOS_PLATFORM_DU_EXCLUDE := --exclude
_THEOS_PLATFORM_MD5SUM := md5sum
_THEOS_PLATFORM_BIN := $(THEOS)/toolchain/$(THEOS_PLATFORM_NAME)/host/bin
ifeq ($(call __exists,$(_THEOS_PLATFORM_BIN)),$(_THEOS_TRUE))
_THEOS_PLATFORM_SWIFT := $(_THEOS_PLATFORM_BIN)/swift
else
_THEOS_PLATFORM_SWIFT := swift
endif

# Determine whether we’re on Windows Subsystem for Linux.
_THEOS_IS_WSL = $(if $(shell grep Microsoft /proc/version 2>/dev/null),$(_THEOS_TRUE),$(_THEOS_FALSE))

ifeq ($(_THEOS_IS_WSL),$(_THEOS_TRUE))
	_THEOS_PLATFORM_SHOW_IN_FILE_MANAGER := /mnt/c/Windows/explorer.exe /select,
	_THEOS_PLATFORM_SHOW_IN_FILE_MANAGER_PATH_TRANSLATOR := wslpath -aw
else
# TODO: Find some better way to determine _THEOS_PLATFORM_SHOW_IN_FILE_MANAGER, as not all desktop
# environments use Nautilus as the file manager
	_THEOS_PLATFORM_SHOW_IN_FILE_MANAGER := nautilus
endif

_THEOS_PLATFORM_GET_LOGICAL_CORES := nproc
endif

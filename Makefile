THEOS_DEVICE_IP = 127.0.0.1
THEOS_DEVICE_PORT = 2222
FINALPACKAGE = 1
ARCHS = armv7 arm64 arm64e
TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = SpringBoard


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ihide

ihide_FILES = Tweak.x src/utility.c src/objcutils.m
ihide_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"

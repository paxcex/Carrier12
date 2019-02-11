TARGET = iphone:11.2:10.0
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = carrier12
carrier12_FILES = Tweak.xm ACDataServer.m

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += carrier12
include $(THEOS_MAKE_PATH)/aggregate.mk

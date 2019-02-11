TARGET = iphone:11.2:10.0
include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = carrier12
carrier12_FILES = carrier12RootListController.m
carrier12_INSTALL_PATH = /Library/PreferenceBundles
carrier12_FRAMEWORKS = UIKit
carrier12_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/carrier12.plist$(ECHO_END)

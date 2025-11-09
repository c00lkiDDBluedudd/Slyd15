TWEAK_NAME = Slyd15
Slyd15_FILES = Tweak.xm
Slyd15_FRAMEWORKS = UIKit
Slyd15_PRIVATE_FRAMEWORKS = SpringBoardFoundation
Slyd15_CFLAGS = -fobjc-arc

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk

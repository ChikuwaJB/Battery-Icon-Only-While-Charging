ARCHS = armv7 arm64
GO_EASY_ON_ME = 1
include theos/makefiles/common.mk
TWEAK_NAME = BatteryIconWhileCharging
BatteryIconWhileCharging_FILES = Tweak.xm
include theos/makefiles/tweak.mk
after-install::
	install.exec "killall -9 SpringBoard"

/*
1　おやすみモード
8　パーセント表示？

From https://github.com/Aehmlo/
		(item == 0 && BOOLKEY_DEFAULT_FALSE(@"Time")) ||
		(item == 1 && BOOLKEY_DEFAULT_TRUE(@"DND")) ||
		(item == 2 && BOOLKEY_DEFAULT_FALSE(@"AirplaneMode")) ||
		(item == 3 && BOOLKEY_DEFAULT_FALSE(@"SignalStrength")) ||
		(item == 4 && BOOLKEY_DEFAULT_TRUE(@"CarrierName")) ||
		(item == 5 && BOOLKEY_DEFAULT_FALSE(@"DataNetwork")) ||
		(item == 7 && BOOLKEY_DEFAULT_FALSE(@"BatteryIcon")) ||
		(item == 8 && BOOLKEY_DEFAULT_FALSE(@"BatteryPercent")) ||
		(item == 10 && BOOLKEY_DEFAULT_FALSE(@"BluetoothBattery")) ||
		(item == 11 && BOOLKEY_DEFAULT_FALSE(@"Bluetooth")) ||
		(item == 12 && BOOLKEY_DEFAULT_FALSE(@"TTY")) ||
		(item == 13 && BOOLKEY_DEFAULT_TRUE(@"Alarm")) ||
		(item == 16 && BOOLKEY_DEFAULT_FALSE(@"LocationServices")) ||
		(item == 17 && BOOLKEY_DEFAULT_TRUE(@"RotationLock")) ||
		(item == 19 && BOOLKEY_DEFAULT_FALSE(@"AirPlay")) ||
		(item == 20 && BOOLKEY_DEFAULT_FALSE(@"Siri")) ||
		(item == 21 && BOOLKEY_DEFAULT_FALSE(@"VPN")) ||
		(item == 22 && BOOLKEY_DEFAULT_FALSE(@"CallForwarding")) ||
		(item == 23 && BOOLKEY_DEFAULT_FALSE(@"ActivityIndicator"))
*/
%hook SBStatusBarStateAggregator
- (_Bool)_setItem:(int)arg1 enabled:(_Bool)arg2{
SBUIController *b = [%c(SBUIController) sharedInstanceIfExists];
if (arg1 == 8) {return %orig(arg1, YES);} //パーセント表示を有効化
if (arg1 == 7 && [b isOnAC]==NO){return %orig(arg1, NO);} //給電の有無で分岐
return %orig; //その他の処理
}
%end

#import <substrate.h>
#import "common.h"

#define ACServer_ArtistName [ACDataServer sharedInstance].artistName
#define ACServer_ACNAText [ACDataServer sharedInstance].ACNAText
#define ACServer_Enabled [ACDataServer sharedInstance].enabled
#define ACServer_ShouldDisplay [ACDataServer sharedInstance].shouldDisplay

%group ZeppelinCompatibility

%hook ZPImageServer

-(BOOL)enabled{
	return !ACServer_ShouldDisplay;
}

%end

%end

%group defaulthook

%hook SBTelephonyManager

- (id)_carrierNameForOperatorName:(id)arg1 withContext:(id)arg2{

		NSString *operatorText = (ACServer_ArtistName ? ACServer_ArtistName : ACServer_ACNAText);

		return operatorText;
	}

	%end
	%end

	static void loadPrefs(){
		NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.pxcex.carrier12.plist"];

		if(prefs){
		ACServer_ACNAText = (prefs[@"ACNAText"] ? prefs[@"ACNAText"] : @"opensettings");
			ACServer_ArtistName = ACServer_ACNAText;

			NSLog(@"Carrir12: Loaded Preference. %@", prefs);
		}else{
		ACServer_ACNAText = @"opensettings";
			ACServer_ArtistName = ACServer_ACNAText;
		}

		[[%c(SBStatusBarStateAggregator) sharedInstance] _updateServiceItem];
	}

	%ctor {


		if(objc_getClass("ZPImageServer")){
			%init(ZeppelinCompatibility);
		}

		%init(defaulthook);

		CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.c0ldra1n.artistcarrier9-preferences/settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
		loadPrefs();
	}

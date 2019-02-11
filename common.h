@interface ACDataServer : NSObject

@property (strong) NSString *artistName;
@property (strong) NSString *ACNAText;
@property BOOL shouldDisplay;
@property BOOL enabled;

+(ACDataServer *)sharedInstance;

@end

@interface SBStatusBarStateAggregator : NSObject

+(id)sharedInstance;
-(void)_updateServiceItem;
-(id)operatorName;

@end

@interface SBTelephonyManager : NSObject

-(id)operatorName;
-(void)_updateState;
+(id)sharedTelephonyManager;

@end

@interface SBMediaController : NSObject

-(void)_nowPlayingInfoChanged;
-(BOOL)isPlaying;

@end

@interface ZPImageServer : NSObject

@property (assign, nonatomic, getter=isEnabled) BOOL enabled;

@end

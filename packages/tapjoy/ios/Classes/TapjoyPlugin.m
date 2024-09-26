#import "TapjoyPlugin.h"

@implementation TapjoyPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"io.heybit.bitbunny/tapjoy"
            binaryMessenger:[registrar messenger]];
  TapjoyPlugin* instance = [[TapjoyPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"setUserId" isEqualToString:call.method]) {
    NSString* userId = call.arguments[@"userId"];
    [self setUserId:userId];
    result([NSString stringWithFormat:@"User ID set %@", userId]);
  } else if ([@"getPlacement" isEqualToString:call.method]) {
    NSString* placementName = call.arguments[@"placement"];
    [self getPlacement:placementName];
    result([NSString stringWithFormat:@"Requested placement: %@", placementName]);
  } else if ([@"connect" isEqualToString:call.method]) {
    NSString* sdkKey = call.arguments[@"sdkKey"];
    [self connectToTapjoy:sdkKey];
    result([NSString stringWithFormat:@"Connected with SDK Key: %@", sdkKey]);
  } else if ([@"showContent" isEqualToString:call.method]) {
    [self showContent];
    result(@"Content requested to be shown");
  } else {
    result(FlutterMethodNotImplemented);
  }
}

- (void)setUserId:(NSString*)userId {
  NSLog(@"Set user ID: %@", userId);
}

- (void)getPlacement:(NSString*)placement {
  NSLog(@"Requested placement: %@", placement);
}

- (void)connectToTapjoy:(NSString*)sdkKey {
  NSLog(@"Connecting to Tapjoy with SDK Key: %@", sdkKey);
  // Assuming you will call the Tapjoy SDK's connect method here
  // Tapjoy.connect(sdkKey); (Add actual Tapjoy connection logic)
}

- (void)showContent {
  NSLog(@"Showing Tapjoy content");
  // Add the Tapjoy SDK logic here to show content
  // Example: placement.showContent(); (assuming you've requested a placement)
}

@end

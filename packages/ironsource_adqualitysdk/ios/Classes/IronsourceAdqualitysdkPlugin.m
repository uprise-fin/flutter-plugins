#import "IronsourceAdqualitysdkPlugin.h"
#import "IronSourceAdQuality.h"

@implementation IronsourceAdqualitysdkPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"io.heybit.bitbunny/ironsource_adqualitysdk"
            binaryMessenger:[registrar messenger]];
  IronsourceAdqualitysdkPlugin* instance = [[IronsourceAdqualitysdkPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"initializeIronSource" isEqualToString:call.method]) {
    NSDictionary* args = call.arguments;
    NSString* appKey = args[@"appKey"];
    if (appKey != nil) {
      [[IronSourceAdQuality getInstance] initializeWithAppKey:appKey]; 
      result(nil);
    } else {
      result([FlutterError errorWithCode:@"ERROR"
                                 message:@"AppKey is required"
                                 details:nil]);
    }
  } else if ([@"setUserId" isEqualToString:call.method]) {
    NSDictionary* args = call.arguments;
    NSString* userId = args[@"userId"];
    if (userId != nil) {
      [[IronSourceAdQuality getInstance] changeUserId:userId];
      result(nil);
    } else {
      result([FlutterError errorWithCode:@"ERROR"
                                 message:@"UserId is required"
                                 details:nil]);
    }
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
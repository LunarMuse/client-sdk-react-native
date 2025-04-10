#import "AppDelegate.h"
#import "LivekitReactNative.h"
#import <React/RCTBundleURLProvider.h>
#import <WebRTC/WebRTC.h>
#import "WebRTCModule.h"
#import "WebRTCModuleOptions.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  [LivekitReactNative setup];
  WebRTCModuleOptions *options = [WebRTCModuleOptions sharedInstance];
  // Optional for debugging WebRTC issues.
  // options.loggingSeverity = RTCLoggingSeverityInfo;
  options.enableMultitaskingCameraAccess = YES;
  self.moduleName = @"LivekitReactNativeExample";
  
  // You can add your custom initial props in the dictionary below.
  // They will be passed down to the ViewController used by React Native.
  self.initialProps = @{};

  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
  return [self bundleURL];
}
 
- (NSURL *)bundleURL
{
#if DEBUG
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
#else
  return [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
#endif
}

@end

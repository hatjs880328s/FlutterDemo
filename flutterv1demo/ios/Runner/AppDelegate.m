#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#include "Runner-Swift.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [GeneratedPluginRegistrant registerWithRegistry:self];

    FlutterSwiftViewController *con = [[FlutterSwiftViewController alloc] init];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:con];
    self.window.frame = UIScreen.mainScreen.bounds;
    [self.window makeKeyAndVisible];
    return true;
}

- (int)getBatteryLevel {
    UIDevice* device = UIDevice.currentDevice;
    device.batteryMonitoringEnabled = YES;
    if (device.batteryState == UIDeviceBatteryStateUnknown) {
        return -1;
    } else {
        return (int)(device.batteryLevel * 100);
    }
}

@end

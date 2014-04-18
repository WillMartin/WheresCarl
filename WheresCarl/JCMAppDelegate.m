//
//  JCMAppDelegate.m
//  WheresCarl
//
//  Created by Noah Carnahan on 4/13/14.
//
//

#import "JCMAppDelegate.h"
#import "JCMTabBarViewController.h"

@implementation JCMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    NSMutableArray *checkInsToSave = ((JCMTabBarViewController *) self.window.rootViewController).checkIns;
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:checkInsToSave];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"checkIns"];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSMutableArray *checkInsToSave = ((JCMTabBarViewController *) self.window.rootViewController).checkIns;
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:checkInsToSave];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"checkIns"];
    NSLog(@"SAVED");
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"checkIns"];
    NSMutableArray *loadedCheckIns = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    ((JCMTabBarViewController *) self.window.rootViewController).checkIns = loadedCheckIns;
    NSLog(@"Loaded. Length %d", [loadedCheckIns count]);
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    //int x =[((JCMTabBarViewController *) self.window.rootViewController).checkIns count];
    //NSLog(@"TEST: %d", x);
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"checkIns"];
    NSMutableArray *loadedCheckIns = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    ((JCMTabBarViewController *) self.window.rootViewController).checkIns = loadedCheckIns;
    NSLog(@"BEING CALLED");
}

@end

//
//  SRAppDelegate.m
//  ShakeReport
//
//  Created by Jeremy Templier on 5/29/13.
//  Copyright (c) 2013 Jeremy Templier. All rights reserved.
//

#import "SRAppDelegate.h"
#import "SRReporter.h"
#import "SRVideoReporter.h"

@implementation SRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    SRReporter *reporter = [SRReporter reporter];
//    [reporter setDefaultEmailAddress:@"jayztemplier@example.com"];
//    [reporter setCustomInformationBlock:^NSString *{
//        return [NSString stringWithFormat:@"Application: Sample Application, User: Jayztemplier, Device Name: %@", [[UIDevice currentDevice] name]];
//    }];
//    [reporter startListener];
    
    // Send data to a Server instead of displaying the mail composer
    SRVideoReporter *reporter = [SRVideoReporter reporter];
    NSURL *url = [NSURL URLWithString:@"http://shakereport_url.com/"];
    [reporter setApplicationToken:@"token_of_the_application"];
    [reporter startListenerConnectedToBackendURL:url];
//    [reporter startScreenRecorderWithMaxDurationPerVideo:30];
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
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [[SRReporter reporter] stopListener];
}

@end

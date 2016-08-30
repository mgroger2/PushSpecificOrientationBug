//
//  AppDelegate.m
//  ExampleProject
//
//  Created by Mark Rogers on 8/30/16.
//  Copyright © 2016 Yodle. All rights reserved.
//

#import "AppDelegate.h"
#import "Coordinator.h"

@interface AppDelegate ()

@property (strong, nonatomic) Coordinator* coordinator;

@end

@implementation AppDelegate

#pragma mark - UIApplicationDelegate

- (BOOL)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions
{
	self.application = application;
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	[self.window makeKeyAndVisible];
	
	self.coordinator = [[Coordinator alloc] initWithWindow:self.window];
	[self.coordinator launch];
	
	return YES;
}

- (UIInterfaceOrientationMask)application:(UIApplication*)application supportedInterfaceOrientationsForWindow:(UIWindow*)window
{
	return  UIInterfaceOrientationMaskAllButUpsideDown;
}

@end

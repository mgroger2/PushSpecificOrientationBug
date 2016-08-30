//
//  Coordinator.m
//  ExampleProject
//
//  Created by Mark Rogers on 8/30/16.
//  Copyright © 2016 Yodle. All rights reserved.
//

#import "Coordinator.h"
#import "CustomNavigationController.h"
#import "ContainerViewController.h"
#import "DetailsViewController.h"
#import "UINavigationController+Root.h"
#import "DataService.h"
#import "DetailsViewController.h"

@interface Coordinator ()

@property (weak, nonatomic) UIWindow* window;
@property (strong, nonatomic) CustomNavigationController* navigationController;
@property (copy, nonatomic) NSString* containerMode;

@end

@implementation Coordinator

#pragma mark - NSObject

- (instancetype)initWithWindow:(UIWindow*)window
{
	if (self = [super init]) {
		_window = window;
	}
	return self;
}

- (void)dealloc
{
	self.navigationController = nil;
}

#pragma mark - Launch

- (void)launch
{
	[self loadNavigationController];
	[self showContainerViewController];
}

#pragma mark - Container

- (void)showContainerViewController
{
	ContainerViewController* containerViewController = [[ContainerViewController alloc] init];
	self.containerMode = containerViewController.mode;
	containerViewController.currentDevice = [UIDevice currentDevice];
	containerViewController.dataService = [[DataService alloc] init];
	
//	@weakify(self);
	containerViewController.onModeChanged = ^(NSString* mode) {
//		@strongify(self);
		self.containerMode = mode;
	};
	containerViewController.onContentSelected = ^(NSString* content) {
//		@strongify(self);
		[self showDetailsViewControllerWithContent:content];
	};
	
	containerViewController.navigationItem.title = @"Container";
	self.navigationController.rootViewController = containerViewController;
}

#pragma mark - Details

- (void)showDetailsViewControllerWithContent:(NSString*)content
{
	DetailsViewController* detailsViewController = [[DetailsViewController alloc] initWithContent:content];
	
	detailsViewController.navigationItem.title = @"Details";
	[self pushViewController:detailsViewController animated:YES];
}

#pragma mark - Navigation

/**
 *  Loads the main window's root view controller with an instance of CustomNavigationController.
 */
- (void)loadNavigationController
{
	CustomNavigationController* navigationController = [[CustomNavigationController alloc] init];
	navigationController.navigationBar.translucent = NO;
	self.navigationController = navigationController;
	self.window.rootViewController = self.navigationController;
}

/**
 *  Returns the topmost UINavigationController in the app.
 *
 *  @param viewController UINavigationController
 */
- (UINavigationController*)topNavigationController
{
	UINavigationController* topNavigationController = self.navigationController;
	while ([topNavigationController.presentedViewController isKindOfClass:[UINavigationController class]]) {
		topNavigationController = (UINavigationController*)topNavigationController.presentedViewController;
	}
	return topNavigationController;
}

- (void)pushViewController:(UIViewController*)viewController animated:(BOOL)animated
{
	[self.topNavigationController pushViewController:viewController animated:animated];
}

@end

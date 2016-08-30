//
//  ContainerViewController.m
//  ExampleProject
//
//  Created by Mark Rogers on 8/30/16.
//  Copyright © 2016 Yodle. All rights reserved.
//

#import "ContainerViewController.h"
#import "RedContentViewController.h"
#import "GreenContentViewController.h"
#import "UIViewController+Embed.h"

const struct ContainerViewControllerMode ContainerViewControllerMode = {
	.red = @"Red",
	.green = @"Green"
};

@interface ContainerViewController ()

@property (strong, nonatomic) RedContentViewController* redContentViewController;
@property (strong, nonatomic) GreenContentViewController* greenContentViewController;

@end

@implementation ContainerViewController

#pragma mark - NSObject

- (instancetype)init
{
	if (self = [super init]) {
		_mode = ContainerViewControllerMode.green;
	}
	
	return self;
}

#pragma mark - UIViewController

- (BOOL)shouldAutorotate
{
	return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
	UIDeviceOrientation currentOrientation = [self.currentDevice orientation];
	
	if (UIDeviceOrientationIsLandscape(currentOrientation)) {
		return UIInterfaceOrientationMaskLandscape;
	} else {
		return UIInterfaceOrientationMaskPortrait;
	}
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
	UIDeviceOrientation currentOrientation = [self.currentDevice orientation];
	
	if (UIDeviceOrientationIsLandscape(currentOrientation)) {
		if (currentOrientation == UIDeviceOrientationLandscapeLeft) {
			return UIInterfaceOrientationLandscapeRight;
		} else {
			return UIInterfaceOrientationLandscapeLeft;
		}
	} else {
		return UIInterfaceOrientationPortrait;
	}
}

#pragma mark - UIViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.leftTitleLable.text = @"TMNT";
	self.leftTitleLable.text = @"ROCKS";
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	[self showMode:self.mode];
	[self reorient];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
	[super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
	
	if (!self.view) {
		return;
	}
	
	[self reorient];
}
	 
#pragma mark - Public

- (void)setMode:(NSString*)mode
{
	if (!mode) {
		return;
	}
	_mode = mode;
}

- (void)showMode:(NSString*)mode
{
	if (!mode) {
		return;
	}
	self.mode = mode;
	
	if ([mode isEqualToString:ContainerViewControllerMode.green]) {
		[self showGreenView];
	} else {
		[self showRedView];
	}
	
	if (self.onModeChanged) {
		self.onModeChanged(mode);
	}
}

#pragma mark - Red (Horizontal)

- (void)loadRedView
{
	self.redContentViewController = [[RedContentViewController alloc] init];
	self.redContentViewController.dataService = self.dataService;
	self.redContentViewController.onContentSelected = self.onContentSelected;
}

- (void)showRedView
{
	[self loadRedView];
	[self hideGreenView];
	
	[self.view layoutIfNeeded];
	[self embedViewController:self.redContentViewController inView:self.containerView];
	self.mode = ContainerViewControllerMode.red;
}

- (void)hideRedView
{
	if (!self.redContentViewController) {
		return;
	}
	[self.redContentViewController removeFromParentViewController];
	[self.redContentViewController.view removeFromSuperview];
	self.redContentViewController = nil;
}

- (void)reloadRedView
{
	[self.redContentViewController reload];
}

#pragma mark - Green (Vertical)

- (void)loadGreenView
{
	self.greenContentViewController = [[GreenContentViewController alloc] init];
	self.greenContentViewController.dataService = self.dataService;
	self.greenContentViewController.onContentSelected = self.onContentSelected;
}

- (void)showGreenView
{
	[self loadGreenView];
	[self hideRedView];
	
	[self.view layoutIfNeeded];
	[self embedViewController:self.greenContentViewController inView:self.containerView];
	self.mode = ContainerViewControllerMode.green;
}

- (void)hideGreenView
{
	if (!self.greenContentViewController) {
		return;
	}
	[self.greenContentViewController removeFromParentViewController];
	[self.greenContentViewController.view removeFromSuperview];
	self.greenContentViewController = nil;
}

- (void)reloadGreenView
{
	[self.greenContentViewController reload];
}

#pragma mark - Orientation

- (void)reorient
{
	if (UIDeviceOrientationIsPortrait(self.currentDevice.orientation)) {
		[self showMode:ContainerViewControllerMode.green];
	} else {
		[self showMode:ContainerViewControllerMode.red];
	}
}

@end

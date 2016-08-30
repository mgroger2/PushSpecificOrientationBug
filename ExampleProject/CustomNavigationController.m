//
//  CustomNavigationController.m
//  ExampleProject
//
//  Created by Mark Rogers on 8/30/16.
//  Copyright © 2016 Yodle. All rights reserved.
//

#import "CustomNavigationController.h"

@implementation CustomNavigationController

- (BOOL)shouldAutorotate
{
	if (!self.topViewController) {
		return YES;
	}
	return [self.topViewController shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
	if (!self.topViewController) {
		return UIInterfaceOrientationMaskPortrait;
	}
	return [self.topViewController supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
	if (!self.topViewController) {
		return UIInterfaceOrientationPortrait;
	}
	return [self.topViewController preferredInterfaceOrientationForPresentation];
}

@end

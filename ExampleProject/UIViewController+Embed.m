//
//  UIViewController+Embed.m
//  Updated
//
//  Created by Martin Rybak on 2/1/14.
//  Copyright (c) 2014 Updated. All rights reserved.
//

#import "UIViewController+Embed.h"

@implementation UIViewController (Embed)

- (void)embedViewController:(UIViewController*)viewController inView:(UIView*)view
{
	[view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
	[self addChildViewController:viewController];
	[view addSubview:viewController.view];

	NSDictionary* views = @{ @"subview":viewController.view };
	NSArray* verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[subview]-|" options:0 metrics:nil views:views];
	NSArray* horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[subview]-|" options:0 metrics:nil views:views];
	NSArray* constraints = [verticalConstraints arrayByAddingObjectsFromArray:horizontalConstraints];
	[view addConstraints:constraints];
	
	[viewController didMoveToParentViewController:self];
}

@end

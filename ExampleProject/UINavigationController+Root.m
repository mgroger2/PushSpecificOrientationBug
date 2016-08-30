//
//  UINavigationController+Helpers.m
//  ServiceTask
//
//  Created by Martin Rybak on 9/3/14.
//  Copyright (c) 2014 ServiceTask. All rights reserved.
//

#import "UINavigationController+Root.h"

@implementation UINavigationController (Helpers)

- (UIViewController*)rootViewController
{
	return [self.viewControllers firstObject];
}

- (void)setRootViewController:(UIViewController*)rootViewController
{
	[self setViewControllers:@[ rootViewController ]];
}

- (void)setRootViewController:(UIViewController*)rootViewController animated:(BOOL)animated
{
	[self setViewControllers:@[ rootViewController ] animated:animated];
}

@end

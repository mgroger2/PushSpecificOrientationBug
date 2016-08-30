//
//  UINavigationController+Helpers.h
//  ServiceTask
//
//  Created by Martin Rybak on 9/3/14.
//  Copyright (c) 2014 ServiceTask. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (Root)

- (UIViewController*)rootViewController;
- (void)setRootViewController:(UIViewController*)rootViewController;
- (void)setRootViewController:(UIViewController*)rootViewController animated:(BOOL)animated;

@end
